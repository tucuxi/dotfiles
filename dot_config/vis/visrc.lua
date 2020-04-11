require('vis')
require('plugins/vis-modelines')
require('plugins/vis-commentary')
require('plugins/vis-filetype-settings')

settings = {
	java = { 'set autoindent', 'set expandtab', 'set tabwidth 4' },
	yaml = { 'set autoindent', 'set expandtab', 'set tabwidth 2' }
}

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	vis:command('set theme gruvbox')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options
	vis:command('set relativenumbers')
	vis:command('set cursorline')
end)
