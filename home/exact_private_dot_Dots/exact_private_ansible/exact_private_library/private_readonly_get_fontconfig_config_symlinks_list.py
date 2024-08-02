#!/usr/bin/python

from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

DOCUMENTATION = r'''
---
module: get_fontconfig_config_symlinks_list

short_description: Returns a list of fontconfig configuration symlinks.

version_added: "0.1.0"

description:
  - Returns a list of fontconfig configuration symlinks
    according to the options passed.
  - This list is stored in the ``file_list`` list in the output dictionary.
  - It can be stored in a variable and used later on for creating/deleting
    symlinks in a loop using ansible.builtin.file module.
  - The module has plenty of parameters, but they can be initialized
    automatically, since the module has sane defaults. The only really needed
    option is the ``conf_needed`` one, because by default it contains
    just empty list.

options:
  antialias:
    description:
      - Antialias setting.
      - Affected files:
        10-no-antialias.conf
        10-yes-antialias.conf
    required: false
    type: bool
    default: true
  autohint:
    description:
      - Autohint setting.
      - Affected files:
        10-autohint.conf
    required: false
    type: bool
    default: false
  autohint_if_no_hinting:
    description:
      - Enable autohinting for the fonts that are not hinted.
      - Affected files:
        09-autohint-if-no-hinting.conf
    required: false
    type: bool
    default: false
  bitmaps:
    description:
      - Setting for bitmap fonts.
      - Affected files:
        70-force-bitmaps.conf
        70-no-bitmaps.conf
        70-yes-bitmaps.conf
    required: false
    type: str
    choices: [force, "no", "yes"]
    default: "yes"
  hinting:
    description:
      - Hinting setting.
      - Affected files:
        10-unhinted.conf
    required: false
    type: bool
    default: true
  hintstyle:
    description:
      - Hintstyle setting.
      - Is only in effect when ``hinting == true``.
      - Affected files:
        10-hinting-full.conf
        10-hinting-medium.conf
        10-hinting-slight.conf
        10-hinting-none.conf
    required: false
    type: str
    choices: [hintfull, hintmedium, hintnone, hintslight]
    default: hintslight
  lcdfilter:
    description:
      - Lcdfilter settings.
      - Affected files:
        11-lcdfilter-default.conf
        11-lcdfilter-legacy.conf
        11-lcdfilter-light.conf
    required: false
    type: str
    choices: [lcddefault, lcdlegacy, lcdlight, lcdnone]
    default: lcddefault
  rgba:
    description:
      - Rgba (sub-pixel) setting.
      - Affected files:
        10-no-sub-pixel.conf
        10-sub-pixel-bgr.conf
        10-sub-pixel-rgb.conf
        10-sub-pixel-vbgr.conf
        10-sub-pixel-vrgb.conf
    required: false
    type: str
    choices: [bgr, none, rgb, vbgr, vrgb]
    default: rgb
  scale_bitmap_fonts:
    description:
      - Whether to scale bitmap fonts or not.
      - Affected files:
        10-scale-bitmap-fonts.conf
    required: false
    type: bool
    default: true
  conf_avail:
    description:
      - List of glob patterns to search for
        available fontconfig configuration files.
    required: false
    type: list
    default:
      - /usr/share/fontconfig/conf.avail/*.conf
      - /etc/fonts/conf.avail/*.conf
  conf_d:
    description:
      - Path to the directory where fontconfig configuration is stored.
    required: false
    type: str
    default: /etc/fonts/conf.d
  conf_needed:
    description:
      - List of configuration files (basenames only!) to be installed.
      - None of the files listed in the "Affected files" sections of the above
        options should be on this list. Those files are adjusted automatically
        based on the options passed/default options.
    required: false
    type: list
    default: []
author:
  - Victor Brand (@vbrand1984)
'''

EXAMPLES = r'''
# Get a list of fontconfig configuration symlinks
# and store it in the ``fontconfig_config_symlinks_list`` variable
- name: Prepare system fontconfig configuration
  get_fontconfig_config_symlinks_list:
    conf_avail:
      - /usr/share/fontconfig/conf.avail/*.conf
      - /etc/fonts/*.conf
    conf_d: /etc/fonts/conf.d
    conf_needed:
      # This list SHOULD be specified when calling the module
      # <...>
      - 50-user.conf
      - 51-local.conf
      - 60-generic.conf
      - 60-latin.conf
      - 65-nonlatin.conf
      # <...>
    antialias: true
    autohint: false
    autohint_if_no_hinting: false
    hinting: true
    hintstyle: hintslight
    lcdfilter: lcddefault
    rgba: rgb
    bitmaps: "yes"
    scale_bitmap_fonts: true
  register: fontconfig_config_symlinks_list

# Use the ``fontconfig_config_symlinks_list`` variable
# in oder to set up needed configuration in a loop
- name: Adjust system fontconfig configuration
  become: true
  ansible.builtin.file:
    src: "{{ item.src if 'src' in item else '' }}"
    dest: "{{ item.dest }}"
    state: "{{ item.state }}"
    owner: "{{ 'root' if item.state == 'link' else '' }}"
    group: "{{ 'root' if item.state == 'link' else '' }}"
  loop: "{{ fontconfig_config_symlinks_list.file_list }}"
'''

RETURN = r'''
# Sample output
file_list:
  - dest: /etc/fonts/conf.d/05-reset-dirs-sample.conf
    state: absent
  - dest: /etc/fonts/conf.d/09-autohint-if-no-hinting.conf
    state: absent
  # <...>
  - dest: /etc/fonts/conf.d/10-hinting-none.conf
    state: absent
  - dest: /etc/fonts/conf.d/10-hinting-slight.conf
    src: ../../../usr/share/fontconfig/conf.avail/10-hinting-slight.conf
    state: link
  # <...>
  - dest: /etc/fonts/conf.d/45-generic.conf
    src: ../../../usr/share/fontconfig/conf.avail/45-generic.conf
    state: link
  - dest: /etc/fonts/conf.d/45-latin.conf
    src: ../../../usr/share/fontconfig/conf.avail/45-latin.conf
    state: link
  - dest: /etc/fonts/conf.d/48-spacing.conf
    src: ../../../usr/share/fontconfig/conf.avail/48-spacing.conf
    state: link
  # <...>
'''

from ansible.module_utils.basic import AnsibleModule
from glob import glob as glob_search
from os import path as os_path


def run_module():

    fc_options_to_files = {
        'antialias': {
            True: '10-yes-antialias.conf',
            False: '10-no-antialias.conf'
        },
        'autohint': {
            True: '10-autohint.conf',
            False: ''
        },
        'autohint_if_no_hinting': {
            True: '09-autohint-if-no-hinting.conf',
            False: ''
        },
        'hinting': {
            True: '',
            False: '10-unhinted.conf'
        },
        'hintstyle': {
            'hintfull': '10-hinting-full.conf',
            'hintmedium': '10-hinting-medium.conf',
            'hintslight': '10-hinting-slight.conf',
            'hintnone': '10-hinting-none.conf'
        },
        'rgba': {
            'bgr': '10-sub-pixel-bgr.conf',
            'rgb': '10-sub-pixel-rgb.conf',
            'vbgr': '10-sub-pixel-vbgr.conf',
            'vrgb': '10-sub-pixel-vrgb.conf',
            'none': '10-no-sub-pixel.conf'
        },
        'lcdfilter': {
            'lcddefault': '11-lcdfilter-default.conf',
            'lcdlegacy': '11-lcdfilter-legacy.conf',
            'lcdlight': '11-lcdfilter-light.conf',
            'lcdnone': ''
        },
        'bitmaps': {
            'force': '70-force-bitmaps.conf',
            'no': '70-no-bitmaps.conf',
            'yes': '70-yes-bitmaps.conf'
        },
        'scale_bitmap_fonts': {
            True: '10-scale-bitmap-fonts.conf',
            False: ''
        }
    }

    # define available arguments/parameters a user can pass to the module
    module_args = dict(
        conf_avail=dict(type='list', required=False,
            default=[
                '/usr/share/fontconfig/conf.avail/*.conf',
                '/etc/fonts/conf.avail/*.conf'
            ]
        ),
        conf_d=dict(type='str', required=False, default='/etc/fonts/conf.d/'),
        conf_needed=dict(type='list', required=False, default=[]),
        antialias=dict(type='bool', required=False, default=True),
        autohint=dict(type='bool', required=False, default=False),
        autohint_if_no_hinting=dict(type='bool', required=False, default=False),
        hinting=dict(type='bool', required=False, default=True),
        hintstyle=dict(type='str', required=False,
            choices=tuple(fc_options_to_files['hintstyle'].keys()),
            default='hintslight'
        ),
        lcdfilter=dict(type='str', required=False,
            choices=tuple(fc_options_to_files['lcdfilter'].keys()),
            default='lcddefault'
        ),
        rgba=dict(type='str', required=False,
            choices=tuple(fc_options_to_files['rgba'].keys()),
            default='rgb'
        ),
        bitmaps=dict(type='str', required=False,
            choices=tuple(fc_options_to_files['bitmaps'].keys()),
            default='yes'
        ),
        scale_bitmap_fonts=dict(type='bool', required=False, default=True),
    )

    # seed the result dict in the object
    result = dict(
        changed=False,
        file_list=[]
    )

    # the AnsibleModule object will be our abstraction working with Ansible
    # this includes instantiation, a couple of common attr would be the
    # args/params passed to the execution, as well as if the module
    # supports check mode
    module = AnsibleModule(
        argument_spec=module_args,
        supports_check_mode=True
    )

    # if the user is working with this module in only check mode we do not
    # want to make any changes to the environment, just return the current
    # state with no modifications
    if module.check_mode:
        module.exit_json(**result)

    the_conf_needed = module.params['conf_needed']

    # Check for the options that can be adjusted in automatic manner
    for the_key in ('autohint', 'autohint_if_no_hinting', 'antialias', 'rgba', 'lcdfilter', 'bitmaps'):
        the_option = module.params[the_key]
        conf_files = fc_options_to_files[the_key]
        if conf_files[the_option] != '':
            the_conf_needed.append(conf_files[the_option])

    # Hintstyle option. Check if hinting is enabled at all
    if module.params['hinting']:
        # It is enabled. Then set the ``hintstyle`` option
        the_conf_needed.append(fc_options_to_files['hintstyle'][module.params['hintstyle']])
    else:
        # It is disabled. Set the specific file then (``10-unhinted.conf`` by default).
        the_conf_needed.append(fc_options_to_files['hinting'][False])

    # If bitmap fonts are not disabled, check for scaling option for them
    if module.params['bitmaps'] != 'no':
        sbf_conf = fc_options_to_files['scale_bitmap_fonts'][module.params['scale_bitmap_fonts']]
        if sbf_conf != '':
            the_conf_needed.append(sbf_conf)

    ### Put everything together ###

    # Resulting file list
    file_list = []

    # List of all available config files of fontconfig
    conf_avail_file_list = []
    for conf_path in module.params['conf_avail']:
        conf_avail_file_list += glob_search(conf_path)

    # Sort the list of the available ``.conf`` files by their basenames.
    # It is made just for the convenience of the debug output.
    # This sorting is not necessary for the script to be run properly.
    conf_avail_file_list.sort(key=lambda element: os_path.basename(element))

    # Loop through all available config files found
    # and check if they are in the needed config list
    for src_file in conf_avail_file_list:
        src_basename = os_path.basename(src_file)

        src_dirname = os_path.dirname(src_file)
        src_dir_relative = os_path.relpath(src_dirname, module.params['conf_d'])
        # This path will be the 'src' for the symlink, if it's needed
        src_file_relative = os_path.join(src_dir_relative, src_basename)

        # In Debian, source files for ``61-urw*.conf`` config files don't have 
        # the ``61-`` prefix for some reason.
        # We need to handle this out by checking the source filename
        # and adding the prefix for comparison
        if src_basename.find('urw-') == 0:
            src_basename_query = '61-' + src_basename
        else:
            src_basename_query = src_basename

        # This path will be 'dest' for the symlink
        dest_file = os_path.join(module.params['conf_d'], src_basename_query)

        if src_basename_query in the_conf_needed:
            # The config file is on the list. Create a symlink.
            the_record = {'dest': dest_file, 'src': src_file_relative, 'state': 'link'}
        else:
            # It's not on the list. Delete the symlink, if it exists.
            the_record = {'dest': dest_file, 'state': 'absent'}

        file_list.append(the_record)

    result['file_list'] = file_list

    # in the event of a successful module execution, you will want to
    # simple AnsibleModule.exit_json(), passing the key/value results
    module.exit_json(**result)


def main():
    run_module()


if __name__ == '__main__':
    main()
