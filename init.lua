-- refers to grid.lua in this directory, taken from the Hydra wiki:  
-- https://github.com/sdegutis/hydra/wiki/Useful-Hydra-libraries

-- init grid
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 7
hs.grid.GRIDHEIGHT = 3

-- disable animation
hs.window.animationDuration = 0

-- hotkey mash
local mash_app = {"cmd", "alt", "ctrl"}
local mash = {"ctrl", "alt"}
local mashshift = {"ctrl", "alt", "shift"}

local function open_help()
  help_str = "d - Dictionary, 1 - Terminal, 2 - Pathfinder, " ..
            "3 - Chrome, 4 - Dash, 5 - Trello, 6 - Quiver"        
  hs.alert.show(
   help_str, 2)
end

local function open_dictionary()
  --hydra.alert("Lexicon, at your service.", 0.75)
  hs.application.launchOrFocus("Dictionary")
end

local function open_terminal()
	hs.application.launchOrFocus("iterm")
end

local function open_pathfinder()
	hs.application.launchOrFocus("Path Finder")
end

local function open_chrome()
	hs.application.launchOrFocus("Google Chrome")
end

local function open_trello()
	hs.application.launchOrFocus("Trello X")
end

local function open_quiver()
  hs.application.launchOrFocus("Quiver")
end
-- Launch applications
hs.hotkey.bind(mash_app, 'D', open_dictionary)
hs.hotkey.bind(mash_app, '1', open_terminal)
hs.hotkey.bind(mash_app, '2', open_pathfinder)
hs.hotkey.bind(mash_app, '3', open_chrome)
-- mash_app '4' reserved for dash global key
hs.hotkey.bind(mash_app, '5', open_trello)
hs.hotkey.bind(mash_app, '6', open_quiver)
hs.hotkey.bind(mash_app, '/', open_help)

--hs.hotkey.bind(mash, '0',hs.hints.windowHints)

-- global operations
hs.hotkey.bind(mash, ';', 
  function() hs.grid.snap(hs.window.focusedWindow()) end)
hs.hotkey.bind(mash, "'", 
  function() hs.fnutil.map(hs.window.visibleWindows(), hs.grid.snap) end)

-- adjust grid size
hs.hotkey.bind(mash, '=', function() hs.grid.adjustWidth( 1) end)
hs.hotkey.bind(mash, '-', function() hs.grid.adjustWidth(-1) end)
hs.hotkey.bind(mash, ']', function() hs.grid.adjustHeight( 1) end)
hs.hotkey.bind(mash, '[', function() hs.grid.adjustHeight(-1) end)

-- change focus
hs.hotkey.bind(mashshift, 'H',
 function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(mashshift, 'L',
 function() hs.window.focusedWindow():focusWindowEast() end)
hs.hotkey.bind(mashshift, 'K', 
  function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(mashshift, 'J', 
  function() hs.window.focusedWindow():focusWindowSouth() end)

hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)

-- multi monitor
hs.hotkey.bind(mash, 'N', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mash, 'P', hs.grid.pushWindowPrevScreen)

-- move windows
hs.hotkey.bind(mash, 'H', hs.grid.pushWindowLeft)
hs.hotkey.bind(mash, 'J', hs.grid.pushWindowDown)
hs.hotkey.bind(mash, 'K', hs.grid.pushWindowUp)
hs.hotkey.bind(mash, 'L', hs.grid.pushWindowRight)

-- resize windows
hs.hotkey.bind(mash, 'Y', hs.grid.resizeWindowThinner)
hs.hotkey.bind(mash, 'U', hs.grid.resizeWindowShorter)
hs.hotkey.bind(mash, 'I', hs.grid.resizeWindowTaller)
hs.hotkey.bind(mash, 'O', hs.grid.resizeWindowWider)

-- Window Hints
hs.hotkey.bind(mash, '.', hs.hints.windowHints)


