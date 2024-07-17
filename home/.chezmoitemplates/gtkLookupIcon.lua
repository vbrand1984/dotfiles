-- chezmoi:template: left-delimiter=@'{% right-delimiter=%}'@
@'{% if false -%}'@
-- vim: ft=lua
-- This template adds the lookup_icon function which searches for the full path of a certain icon
-- Also, it initializes the GTK module for lua
-- Used in Openbox pipemenu scripts
@'{%- end -%}'@

--== TEMPLATE START: gtkLookupIcon.lua ==--

-- Initializing GTK module
local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "3.0")
local gtk_icon_theme = Gtk.IconTheme.get_default()

-- Returns full path to the icon image file for 'icon_name' of 'icon_size' in current GTK icon theme
local function lookup_icon(the_gtk, gtk_theme, icon_name, icon_size)
    local missing_icon = "gtk-missing-image"
    local icon_path

    local icon_info = the_gtk.IconTheme.lookup_icon(gtk_theme, tostring(icon_name), tonumber(icon_size), 0)

    if icon_info then 
        icon_path = the_gtk.IconInfo.get_filename(icon_info)
    else
        icon_info = the_gtk.IconTheme.lookup_icon(gtk_theme, missing_icon, 24, 0)
        icon_path = the_gtk.IconInfo.get_filename(icon_info)
    end
    return icon_path
end

--== TEMPLATE END: gtkLookupIcon.lua ==--

@'{%- /* This deletes an empty string after the template */ -%}'@
