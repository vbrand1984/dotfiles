local obmenu = {}

obmenu.items = {}

obmenu.my_gtk = nil
obmenu.gtk_icon_theme = nil
obmenu.icon_size = 24

obmenu.icon_cache = {}
setmetatable(obmenu.icon_cache, {__mode = 'vk'})


-- {{{ function lookup_icon

function obmenu:lookup_icon(icon_name)
	if not icon_name or icon_name == '' then return '' end
	
	if self.my_gtk == nil then
		local lgi = require("lgi")
		self.my_gtk = lgi.require("Gtk", "3.0")
		self.gtk_icon_theme = self.my_gtk.IconTheme.get_default()
	end

    local icon_path

	if self.icon_cache[icon_name] then
		icon_path = self.icon_cache[icon_name]
	else
		local icon_info = self.my_gtk.IconTheme.lookup_icon(self.gtk_icon_theme, tostring(icon_name), tonumber(self.icon_size), 0)

		if icon_info then 
			icon_path = self.my_gtk.IconInfo.get_filename(icon_info)
			self.icon_cache[icon_name] = icon_path
		else
			local missing_icon = "gtk-missing-image"
			if self.icon_cache[missing_icon] then
				icon_path = self.icon_cache[missing_icon]
			else
				icon_info = self.my_gtk.IconTheme.lookup_icon(self.gtk_icon_theme, missing_icon, tonumber(self.icon_size), 0)
				icon_path = self.my_gtk.IconInfo.get_filename(icon_info)
				self.icon_cache[missing_icon] = icon_path
			end
		end
	end

    return icon_path
end

-- }}}

-- {{{ Action

obmenu.menuitem = {}

function obmenu.menuitem.print_action(obj)
	local result = '<action'
	if obj.name and obj.name ~= '' then
		result = result .. ' name="' .. obj.name .. '"'
	end

	if obj.contents and obj.contents ~= '' then
		result = result .. '>'
		if obj.name == 'Execute' then
			result = result .. '<execute><command><![CDATA[' .. obj.contents .. ']]></command></execute>'
		else
			result = result .. obj.contents
		end
		result = result .. '</action>\n'
	else
		result = result .. ' />\n'
	end

	return result
end

function obmenu.menuitem:add_action_execute(contents)
	local action = {}
	setmetatable(action, {__tostring = self.print_action})
	action.name = 'Execute'
	action.contents = contents or ''
	table.insert(self.actions, action)
end

-- }}}
-- {{{ Menuitem

function obmenu.print_menuitem(obj)

	-- Opening tag
	local result = '<item'
	if obj.label and obj.label ~= '' then
		result = result .. ' label="' .. obj.label .. '"'
	end
	if obj.icon and obj.icon ~= '' then
		result = result .. ' icon="' .. obj.icon .. '"'
	end
	result = result .. '>\n'

	-- Entrails of the tag
	s = #obj.actions
	for i = 1, s do
		local elem = obj.actions[i]
		result = result .. tostring(elem)
	end -- for

	-- Closing tag
	result = result .. '</item>\n'
	return result
end

function obmenu:add_menuitem(label, icon)
	local item = {}
	setmetatable(item, {__tostring = self.print_menuitem, __index = self.menuitem})
	item.actions = {}
	item.label = label or ''
	item.icon = self:lookup_icon(icon)
	table.insert(self.items, item)
	return item
end

-- }}}
-- {{{ Separator

function obmenu.print_separator(obj)
	local result = '<separator'
	if obj.label and obj.label ~= '' then
		result = result .. " label='" .. tostring(obj.label) .. "' "
	end
	result = result .. "/>\n"
	return result
end


function obmenu:add_separator(label)
	local item = {}
	setmetatable(item, {__tostring = self.print_separator})
	if label and label ~= '' then
		item.label = tostring(label)
	end
	table.insert(self.items, item)
end

-- }}}
-- {{{ Pipemenu

function obmenu.print_sub_pipemenu(obj)
	local result = '<menu'
	if obj.id and obj.id ~= '' then
		result = result .. ' id="' .. tostring(obj.id) .. '"'
	end
	if obj.label and obj.label ~= '' then
		result = result .. ' label="' .. tostring(obj.label) .. '"'
	end
	if obj.execute and obj.execute ~= '' then
		result = result .. ' execute="' .. tostring(obj.execute) .. '"'
	end
	if obj.icon and obj.icon ~= '' then
		result = result .. ' icon="' .. tostring(obj.icon) .. '"'
	end
	result = result .. ' />\n'
	return result
end

function obmenu:add_sub_pipemenu(id, label, execute, icon)
	local item = {}
	setmetatable(item, {__tostring = self.print_sub_pipemenu})
	item.id = id or ''
	item.label = label or ''
	item.execute = execute or ''
	item.icon = self:lookup_icon(icon)
	table.insert(self.items, item)
end

-- }}}

-- {{{ function print_menu

function obmenu.print_menu(self)
	local result = '<openbox_pipe_menu>\n'

	s = #self.items
	for i = 1, s do
		local elem = self.items[i]
		result = result .. tostring(elem)
	end -- for

	result = result .. '</openbox_pipe_menu>\n'
	return result
end

-- }}}

setmetatable(obmenu, {__tostring = obmenu.print_menu})

return obmenu
