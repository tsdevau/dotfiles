require("hs.ipc")
hs.loadSpoon("EmmyLua")
MEH = { "ctrl", "alt", "shift" }
HYPER = { "cmd", "ctrl", "alt", "shift" }
WINDOW_GAP = 8
ACTIVE_WINDOW_LAYOUT = 3

-- Enable Spotlight for name searches
hs.application.enableSpotlightForNameSearches(true)

-- Open PDF in Preview when downloaded module
require("openPdfDownloadInPreview")

-- Reload Hammerspoon configuration on change
require("reloadHammerspoonConfig")

-- Window Management module
require("windowManager")

-- Test Hotkey Modal
local modalLeader = hs.hotkey.modal.new({ "alt" }, "Space")

modalLeader:bind({}, "H", function()
  hs.alert.show("Hello, world!")
  modalLeader:exit()
end)
modalLeader:bind({}, "Escape", function()
  modalLeader:exit()
end)
