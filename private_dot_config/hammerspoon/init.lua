require("hs.ipc")
hs.loadSpoon("EmmyLua")
MEH = { "ctrl", "alt", "shift" }
HYPER = { "cmd", "ctrl", "alt", "shift" }
WINDOW_GAP = 8
ACTIVE_WINDOW_LAYOUT = 3

-- Reload Hammerspoon configuration on change
local function reloadConfig(paths, flags)
  for _, file in pairs(paths) do
    if file:sub(-4) == ".lua" then
      hs.reload()
      return
    end
  end
end

hs.pathwatcher.new("~/.config/hammerspoon", reloadConfig):start()

-- Window Management Module
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
