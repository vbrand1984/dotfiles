#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

	item:		add an item inside the menu				{item => ["command", "label", "icon"]},
	cat:		add a category inside the menu			{cat => ["name", "label", "icon"]},
	sep:		horizontal line separator				{sep => undef}, {sep => "label"},
	pipe:		a pipe menu entry						{pipe => ["command", "label", "icon"]},
	file:		include the content of an XML file		{file => "/path/to/file.xml"},
	raw:		any XML data supported by Openbox		{raw => q(...)},
	beg:		begin of a category						{beg => ["name", "icon"]},
	end:		end of a category						{end => undef},
	obgenmenu:	generic menu settings					{obgenmenu => ["label", "icon"]},
	exit:		default "Exit" action					{exit => ["label", "icon"]},

=cut

# NOTE:
#		* Keys and values are case sensitive. Keep all keys lowercase.
#		* ICON can be a either a direct path to an icon or a valid icon name
#		* Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};
my $chezmoi_editor = 'env EDITOR="gvim --nofork" chezmoi edit --apply';

our $SCHEMA = [

	#			COMMAND					LABEL				ICON
	{pipe =>	['/bin/bash ~/.local/lib/ob-gtk-bookmarks.sh',	'Bookmarks',	'system-file-manager']},
	{item =>	['x-terminal-emulator',	'Terminal',			'utilities-terminal']},
	{item =>	['xdg-open http://',	'Web Browser',		'web-browser']},

	{sep =>		undef},

	#			NAME					LABEL				ICON
	{cat =>		['utility',				'Accessories',		'applications-utilities']},
	{cat =>		['development',			'Development',		'applications-development']},
	{cat =>		['education',			'Education',		'applications-science']},
	{cat =>		['game',				'Games',			'applications-games']},
	{cat =>		['graphics',			'Graphics',			'applications-graphics']},
	{cat =>		['audiovideo',			'Multimedia',		'applications-multimedia']},
	{cat =>		['network',				'Network',			'applications-internet']},
	{cat =>		['office',				'Office',			'applications-office']},
	{cat =>		['other',				'Other',			'applications-other']},
	{cat =>		['settings',			'Settings',			'applications-accessories']},
	{cat =>		['system',				'System',			'applications-system']},

	#			  LABEL			 ICON
	#{beg => ['My category',  'cat-icon']},
	#		   ... some items ...
	#{end => undef},

	#			 COMMAND	 LABEL		  ICON
	#{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},

	## Generic advanced settings
	#{sep		=> undef},
	#{obgenmenu => ['Openbox Settings', 'applications-engineering']},
	#{sep		=> undef},

	## Custom advanced settings
	{sep => undef},
	{beg => ['Advanced Settings', 'applications-engineering']},

		# Nitrogen
		{item => ['nitrogen', 'Desktop wallpaper', 'nitrogen']},

		{sep => undef},

		# Openbox configuration category
		{beg => ['Configure Openbox', 'openbox']},
			{item => ['obconf', 'Obconf', 'obconf']},
			{item => ['reconfigure-openbox.sh', 'Reconfigure Openbox', 'configure']},
			{item => ['openbox --restart', 'Restart Openbox', 'system-restart']},

			{sep => undef},

			{item => ["$chezmoi_editor ~/.config/openbox/autostart", 'Edit Autostart', 'text-x-generic']},
			{item => ["$chezmoi_editor ~/.config/openbox/menu.xml",  'Edit menu.xml',  'text-x-generic']},
			{item => ["$editor ~/.config/openbox/rc.xml",            'Edit rc.xml',    'text-x-generic']},
		{end => undef},

		{beg => ['General configuration', 'settings-configure']},
			{item => ['/bin/sh -e ~/.local/bin/conky.sh restart', 'Restart conky', 'conky']},
			{item => ['killall -SIGUSR1 tint2', 'Restart tint2', 'tint2']},
			{item => ["$chezmoi_editor ~/.config/conky/conky.conf",  'Conky configuration',  'text-x-generic']},
		{end => undef},

		# obmenu-generator category
		{beg => ['Obmenu-Generator', 'accessories-text-editor']},
			{item => ["$chezmoi_editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-generic']},
			{item => ["$chezmoi_editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-generic']},

			{sep  => undef},

			{item => ['obmenu-generator -d', 'Refresh cache', 'view-refresh']},
		{end => undef},

	{end => undef},

	{sep => undef},

	## The xscreensaver lock command
	{item => ['xscreensaver-command -lock', 'Lock screen', 'system-lock-screen']},

	## This option uses the default Openbox's "Exit" action
	{exit => ['Exit from Openbox', 'application-exit']},

	## This uses the 'oblogout' menu
	{item => ['lxsession-logout --prompt="<big><big><b>Vero exire a sessione vis?</b></big></big>"', 'Shutdown', 'system-shut-down']},
]
