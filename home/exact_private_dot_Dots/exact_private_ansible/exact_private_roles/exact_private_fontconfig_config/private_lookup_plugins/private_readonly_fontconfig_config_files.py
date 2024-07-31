# vim: ft=python
# See: https://www.ansiblepilot.com/articles/creating-a-custom-ansible-lookup-plugin-in-python-for-reading-a-file/

# python 3 headers, required if submitting to Ansible
from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

#DOCUMENTATION = r"""
#  name: file
#  author: Luca Berton <luca@ansiblepilot.com>
#  version_added: "0.1"
#  short_description: read file contents
#  description:
#      - This lookup returns the contents from a file on the Ansible controller's file system.
#  options:
#    _terms:
#      description: path(s) of files to read
#      required: True
#    option1:
#      description:
#            - Sample option that could modify plugin behaviour.
#            - This one can be set directly ``option1='x'`` or in ansible.cfg, but can also use vars or environment.
#      type: string
#      ini:
#        - section: file_lookup
#          key: option1
#  notes:
#    - if read in variable context, the file can be interpreted as YAML if the content is valid to the parser.
#    - this lookup does not understand globbing --- use the fileglob lookup instead.
#"""
from ansible.errors import AnsibleError, AnsibleParserError
from ansible.plugins.lookup import LookupBase
from ansible.utils.display import Display

from glob import glob as glob_search
import os

display = Display()

class LookupModule(LookupBase):

    def run(self, terms, variables=None, **kwargs):
        self.set_options(var_options=variables, direct=kwargs)
        result = []

        conf_file_list = []
        for conf_path in variables['fcc_fontconfig_conf_avail_paths']:
            conf_file_list += glob_search(conf_path)
        #ret = variables['fontconfig_conf_avail_path']

        conf_needed = variables['fcc_unconditional_conf_list'] if 'fcc_unconditional_conf_list' in variables else []

        # Antialias option adjustment
        fcc_option_antialias = variables['fcc_option_antialias'] if 'fcc_option_antialias' in variables else True
        if fcc_option_antialias:
            conf_needed.append("10-yes-antialias.conf")
        else:
            conf_needed.append("10-no-antialias.conf")


        # Autohint options adjustment
        fcc_option_autohint = variables['fcc_option_autohint']
        if fcc_option_autohint:
            conf_needed.append("10-autohint.conf")

        fcc_option_autohint_if_no_hinting = variables['fcc_option_autohint_if_no_hinting']
        if fcc_option_autohint_if_no_hinting:
            conf_needed.append("10-autohint-if-no-hinting.conf")


        # Hinting and hintstyle options adjustment
        fcc_option_hinting = variables['fcc_option_hinting']

        if fcc_option_hinting:
            fcc_option_hintstyle = variables['fcc_option_hintstyle']
            hintstyle_tweaked = '-' + fcc_option_hintstyle.replace('hint', '') + '.'
            for the_conf_file in ("10-hinting-full.conf", "10-hinting-medium.conf", "10-hinting-none.conf", "10-hinting-slight.conf"):
                if hintstyle_tweaked in the_conf_file:
                    conf_needed.append(the_conf_file)
        else:
            conf_needed.append("10-hinting-none.conf")


        # Lcdfilter options adjustment
        fcc_option_lcdfilter = variables['fcc_option_lcdfilter']
        lcdfilter_tweaked = '-' + fcc_option_lcdfilter.replace('lcd', '') + '.'
        for the_conf_file in ("11-lcdfilter-default.conf", "11-lcdfilter-legacy.conf", "11-lcdfilter-light.conf"):
            if lcdfilter_tweaked in the_conf_file:
                conf_needed.append(the_conf_file)


        # Rgba options adjustment
        fcc_option_rgba = variables['fcc_option_rgba']
        rgba_tweaked = '-' + fcc_option_rgba + '.conf'
        rgba_adjusted = False

        for the_conf_file in ("10-sub-pixel-bgr.conf", "10-sub-pixel-rgb.conf", "10-sub-pixel-vbgr.conf", "10-sub-pixel-vrgb.conf"):
            if rgba_tweaked in the_conf_file:
                conf_needed.append(the_conf_file)
                rgba_adjusted = True

        if not rgba_adjusted:
            conf_needed.append("10-no-sub-pixel.conf")


        # Bitmaps options adjustment
        fcc_option_bitmaps = variables['fcc_option_bitmaps']
        fcc_option_scale_bitmap_fonts = variables['fcc_option_scale_bitmap_fonts']
        bitmaps_tweaked = '-' + fcc_option_bitmaps + '-bitmaps.conf'

        for the_conf_file in ("70-force-bitmaps.conf", "70-no-bitmaps.conf", "70-yes-bitmaps.conf"):
            if bitmaps_tweaked in the_conf_file:
                conf_needed.append(the_conf_file)

        if fcc_option_bitmaps != 'no' and fcc_option_scale_bitmap_fonts:
            conf_needed.append("10-scale-bitmap-fonts.conf")


        # Put everything together
        for src_file in conf_file_list:
            basename = os.path.basename(src_file)
            dest_file = "/etc/fonts/conf.d/" + basename
            if basename in conf_needed:
                the_record = {'dest': dest_file, 'src': src_file, 'state': 'link', 'owner': 'root', 'group': 'root'}
            else:
                the_record = {'dest': dest_file, 'state': 'absent'}

            result.append(the_record)

        return result
