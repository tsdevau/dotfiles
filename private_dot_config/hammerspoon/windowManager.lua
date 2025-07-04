-- Window Management Module
-- This module provides window management functionalities for Hammerspoon.

---@enum AppEventType
AppEventType = {
  hs.application.watcher.activated,
  hs.application.watcher.deactivated,
  hs.application.watcher.hidden,
  hs.application.watcher.unhidden,
  hs.application.watcher.terminated,
  hs.application.watcher.launched,
  hs.application.watcher.launching,
}

---Move and resize focused windows while handling AXEnhancedUserInterface
---and animation duration to avoid issues with some applications.
---@param action fun(max: hs.geometry, frame?: hs.geometry): hs.geometry - Function that returns the new frame for the focused window
---@return nil
local function resizeAndMoveWithAXEnhancedUI(action)
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local screen = window:screen()
  local max = screen:frame()

  local app = window:application()
  if not app then
    hs.alert.show("Cannot determine the focused window's application.")
    return
  end
  local axApp = hs.axuielement.applicationElement(app)
  if not axApp then
    hs.alert.show("Cannot determine the focused window's application AX element.")
    return
  end

  local originalAXEnhancedUI = axApp.AXEnhancedUserInterface
  local originalAnimationDuration = hs.window.animationDuration

  axApp.AXEnhancedUserInterface = false
  hs.window.animationDuration = 0

  local calculatedFrame = action(max, frame) or {}
  for k, v in pairs(calculatedFrame) do
    frame[k] = v
  end

  window:setFrame(frame)

  hs.window.animationDuration = originalAnimationDuration
  axApp.AXEnhancedUserInterface = originalAXEnhancedUI
end

-- Define window sizes and positions

---Move and resize focused window to left half of screen with gaps
---@param max hs.geometry - The maximum screen frame size
---@return hs.geometry
local function moveLeftHalf(max)
  return {
    x = max.x + WINDOW_GAP,
    y = max.y + WINDOW_GAP,
    w = max.w / 2 - WINDOW_GAP * 1.5,
    h = max.h - WINDOW_GAP * 2
  }
end

---Move and resize focused window to right half of screen with gaps
---@param max hs.geometry - The maximum screen frame size
---@return hs.geometry
local function moveRightHalf(max)
  return {
    x = max.x + max.w / 2 + WINDOW_GAP * 0.5,
    y = max.y + WINDOW_GAP,
    w = max.w / 2 - WINDOW_GAP * 1.5,
    h = max.h - WINDOW_GAP * 2
  }
end

---Move and resize focused window to left half top 65% of screen with gaps
---@param max hs.geometry - The maximum screen frame size
---@return hs.geometry
local function moveLeftHalfTop65(max)
  return {
    x = max.x + WINDOW_GAP,
    y = max.y + WINDOW_GAP,
    w = max.w / 2 - WINDOW_GAP * 1.5,
    h = max.h * 0.65 - WINDOW_GAP * 1.5
  }
end

---Move and resize focused window to bottom left 35% of screen with gaps
---@param max hs.geometry - The maximum screen frame size
---@return hs.geometry
local function moveLeftHalfBottom35(max)
  return {
    x = max.x + WINDOW_GAP,
    y = max.y + max.h * 0.65 + WINDOW_GAP * 0.5,
    w = max.w / 2 - WINDOW_GAP * 1.5,
    h = max.h * 0.35 - WINDOW_GAP * 1.5
  }
end

---Move and resize focused window to right half top 65% of screen with gaps
---@param max hs.geometry - The maximum screen frame size
---@return hs.geometry
local function moveRightHalfTop65(max)
  return {
    x = max.x + max.w / 2 + WINDOW_GAP * 0.5,
    y = max.y + WINDOW_GAP,
    w = max.w / 2 - WINDOW_GAP * 1.5,
    h = max.h * 0.65 - WINDOW_GAP * 1.5
  }
end

---Move and resize focused window to bottom right 35% of screen with gaps
---@param max hs.geometry - The maximum screen frame size
---@return hs.geometry
local function moveRightHalfBottom35(max)
  return {
    x = max.x + max.w / 2 + WINDOW_GAP * 0.5,
    y = max.y + max.h * 0.65 + WINDOW_GAP * 0.5,
    w = max.w / 2 - WINDOW_GAP * 1.5,
    h = max.h * 0.35 - WINDOW_GAP * 1.5
  }
end

---Move and resize focused window to be maximized with gaps
---@param max hs.geometry - The maximum screen frame size
---@return hs.geometry
local function moveMaximize(max)
  return {
    x = max.x + WINDOW_GAP,
    y = max.y + WINDOW_GAP,
    w = max.w - WINDOW_GAP * 2,
    h = max.h - WINDOW_GAP * 2
  }
end

---Move focused window to the centre of the screen without resizing
---@param max hs.geometry - The maximum screen frame size
---@param frame hs.geometry - The current frame of the focused window
---@return hs.geometry
local function moveToCentre(max, frame)
  return {
    x = max.x + (max.w - frame.w) / 2,
    y = max.y + (max.h - frame.h) / 2
  }
end

---Resize to custom size and move to the centre of the screen
---@param newSize hs.geometry - The new size to resize the window to
---@return fun(max: hs.geometry, frame?: hs.geometry): hs.geometry
local function resizeAndCentre(newSize)
  local size = newSize or hs.geometry { w = 1920, h = 1080 } -- Default size if not provided
  return function(max)
    return {
      x = max.x + (max.w - size.w) / 2,
      y = max.y + (max.h - size.h) / 2,
      w = size.w,
      h = size.h
    }
  end
end

-- Move focused window to the left half of the screen
hs.hotkey.bind(MEH, "H", function()
  resizeAndMoveWithAXEnhancedUI(moveLeftHalf)
end)

-- Move focused window to the right half of the screen
hs.hotkey.bind(MEH, "L", function()
  resizeAndMoveWithAXEnhancedUI(moveRightHalf)
end)

-- Move focused window to the left top 65% of the screen
hs.hotkey.bind(MEH, "Y", function()
  resizeAndMoveWithAXEnhancedUI(moveLeftHalfTop65)
end)

-- Move focused window to the bottom left 35% of the screen
hs.hotkey.bind(MEH, "N", function()
  resizeAndMoveWithAXEnhancedUI(moveLeftHalfBottom35)
end)

-- Move focused window to the right top 65% of the screen
hs.hotkey.bind(MEH, "O", function()
  resizeAndMoveWithAXEnhancedUI(moveRightHalfTop65)
end)

-- Move focused window to the bottom right 35% of the screen
hs.hotkey.bind(MEH, ".", function()
  resizeAndMoveWithAXEnhancedUI(moveRightHalfBottom35)
end)

-- Move focused window to be maximized
hs.hotkey.bind(MEH, "F", function()
  resizeAndMoveWithAXEnhancedUI(moveMaximize)
end)

-- Move focused window to the centre of the screen
hs.hotkey.bind(MEH, "Return", function()
  resizeAndMoveWithAXEnhancedUI(moveToCentre)
end)

-- Resize focused window to 1920x1080 and move to the centre of the screen
hs.hotkey.bind(MEH, "Space", function()
  local f = hs.geometry { w = 1920, h = 1080 }
  resizeAndMoveWithAXEnhancedUI(resizeAndCentre(f))
end)

---Launch and arrange default applications in a predefined default layout
local function launchAndArrangeDefault()
  local outlook = hs.application.open("com.microsoft.Outlook", 1, true)
  local wezterm = hs.application.open("com.github.wez.wezterm", 2, true)
  local vivaldi = hs.application.open("com.vivaldi.Vivaldi", 1, true)
  local vscode = hs.application.find("com.microsoft.VSCode", false, false)
  local finder = hs.application.find("com.apple.finder", false, false)
  local samsungDisplay = "SAMSUNG"
  local builtInRetinaDisplay = "Built-in Retina Display"
  local screen = hs.screen.primaryScreen()
  local max = screen:frame()
  local isExternalDisplay = screen:name() == samsungDisplay
  local originalAppState = {}

  local function Outlook()
    local f = isExternalDisplay and moveLeftHalfTop65(max) or moveMaximize(max)
    return hs.geometry.rect(f.x, f.y, f.w, f.h)
  end

  local function WezTerm()
    local f = isExternalDisplay and moveLeftHalfBottom35(max) or moveMaximize(max)
    return hs.geometry.rect(f.x, f.y, f.w, f.h)
  end

  local function Vivaldi()
    local f = isExternalDisplay and moveRightHalf(max) or moveMaximize(max)
    return hs.geometry.rect(f.x, f.y, f.w, f.h)
  end

  local function VSCode()
    if vscode then
      local f = isExternalDisplay and moveLeftHalfTop65(max) or moveMaximize(max)
      return hs.geometry.rect(f.x, f.y, f.w, f.h)
    end
    return nil
  end

  local defaultLayout = {
    { wezterm, nil, screen:name(), nil, WezTerm(), nil },
    { outlook, nil, screen:name(), nil, Outlook(), nil },
    { vivaldi, nil, screen:name(), nil, Vivaldi(), nil },
    (vscode and { vscode, nil, screen:name(), nil, VSCode(), nil }) or {},
  }

  -- Save the original AXEnhancedUserInterface state and disable it to apply layout
  for i, app in ipairs(defaultLayout) do
    local axApp = hs.axuielement.applicationElement(app[1])
    if axApp then
      originalAppState[i] = { app[1], axApp.AXEnhancedUserInterface, hs.window.animationDuration }
      axApp.AXEnhancedUserInterface = false
      hs.window.animationDuration = 0
    end
  end

  -- Function to restore the original AXEnhancedUserInterface state
  local function restoreAXUIElementState()
    for _, app in ipairs(originalAppState) do
      local axApp = hs.axuielement.applicationElement(app[1])
      if axApp then
        hs.window.animationDuration = app[3]
        axApp.AXEnhancedUserInterface = app[2]
      end
    end
  end

  hs.layout.apply(defaultLayout)
  finder:kill()
  restoreAXUIElementState()
  ACTIVE_WINDOW_LAYOUT = 1
end

---Launch and arrange Development applications in a predefined development layout
local function launchAndArrangeDevDefault()
  local outlook = hs.application.find("com.microsoft.Outlook", false, false)
  local wezterm = hs.application.open("com.github.wez.wezterm", 2, true)
  local vivaldi = hs.application.open("com.vivaldi.Vivaldi", 1, true)
  local vscode = hs.application.open("com.microsoft.VSCode", 1, true)
  local finder = hs.application.open("com.apple.finder", 1, true)
  local samsungDisplay = "SAMSUNG"
  local builtInRetinaDisplay = "Built-in Retina Display"
  local screen = hs.screen.primaryScreen()
  local max = screen:frame()
  local isExternalDisplay = screen:name() == samsungDisplay
  local originalAppState = {}

  local function WezTerm()
    local f = isExternalDisplay and moveRightHalfBottom35(max) or moveMaximize(max)
    return hs.geometry.rect(f.x, f.y, f.w, f.h)
  end

  local function Vivaldi()
    local f = isExternalDisplay and moveRightHalfTop65(max) or moveMaximize(max)
    return hs.geometry.rect(f.x, f.y, f.w, f.h)
  end

  local function VSCode()
    if vscode then
      local f = isExternalDisplay and moveLeftHalf(max) or moveMaximize(max)
      return hs.geometry.rect(f.x, f.y, f.w, f.h)
    end
    return nil
  end

  local function Finder()
    if finder then
      local f = isExternalDisplay and moveLeftHalfBottom35(max) or moveToCentre(max, finder:focusedWindow():frame())
      return hs.geometry.rect(f.x, f.y, f.w, f.h)
    end
    return nil
  end

  local defaultLayout = {
    { wezterm, nil, screen:name(), nil, WezTerm(), nil },
    { finder,  nil, screen:name(), nil, Finder(),  nil },
    { vivaldi, nil, screen:name(), nil, Vivaldi(), nil },
    { vscode,  nil, screen:name(), nil, VSCode(),  nil },
  }

  -- Save the original AXEnhancedUserInterface state and disable it to apply layout
  for i, app in ipairs(defaultLayout) do
    local axApp = hs.axuielement.applicationElement(app[1])
    if axApp then
      originalAppState[i] = { app[1], axApp.AXEnhancedUserInterface, hs.window.animationDuration }
      axApp.AXEnhancedUserInterface = false
      hs.window.animationDuration = 0
    end
  end

  -- Function to restore the original AXEnhancedUserInterface state
  local function restoreAXUIElementState()
    for _, app in ipairs(originalAppState) do
      local axApp = hs.axuielement.applicationElement(app[1])
      if axApp then
        hs.window.animationDuration = app[3]
        axApp.AXEnhancedUserInterface = app[2]
      end
    end
  end

  hs.layout.apply(defaultLayout)
  outlook:hide()
  finder:mainWindow():sendToBack()
  restoreAXUIElementState()
  ACTIVE_WINDOW_LAYOUT = 2
end

---Launch and arrange Development applications in 4 visible windows development layout
local function launchAndArrangeDev4Panel()
  local outlook = hs.application.find("com.microsoft.Outlook", false, false)
  local wezterm = hs.application.open("com.github.wez.wezterm", 2, true)
  local vivaldi = hs.application.open("com.vivaldi.Vivaldi", 1, true)
  local vscode = hs.application.open("com.microsoft.VSCode", 1, true)
  local finder = hs.application.open("com.apple.finder", 1, true)
  local samsungDisplay = "SAMSUNG"
  local builtInRetinaDisplay = "Built-in Retina Display"
  local screen = hs.screen.primaryScreen()
  local max = screen:frame()
  local isExternalDisplay = screen:name() == samsungDisplay
  local originalAppState = {}

  local function WezTerm()
    local f = isExternalDisplay and moveRightHalfBottom35(max) or moveMaximize(max)
    return hs.geometry.rect(f.x, f.y, f.w, f.h)
  end

  local function Vivaldi()
    local f = isExternalDisplay and moveRightHalfTop65(max) or moveMaximize(max)
    return hs.geometry.rect(f.x, f.y, f.w, f.h)
  end

  local function VSCode()
    if vscode then
      local f = isExternalDisplay and moveLeftHalfTop65(max) or moveMaximize(max)
      return hs.geometry.rect(f.x, f.y, f.w, f.h)
    end
    return nil
  end

  local function Finder()
    if finder then
      local f = isExternalDisplay and moveLeftHalfBottom35(max) or moveToCentre(max, finder:focusedWindow():frame())
      return hs.geometry.rect(f.x, f.y, f.w, f.h)
    end
    return nil
  end

  local defaultLayout = {
    { wezterm, nil, screen:name(), nil, WezTerm(), nil },
    { finder,  nil, screen:name(), nil, Finder(),  nil },
    { vivaldi, nil, screen:name(), nil, Vivaldi(), nil },
    { vscode,  nil, screen:name(), nil, VSCode(),  nil },
  }

  -- Save the original AXEnhancedUserInterface state and disable it to apply layout
  for i, app in ipairs(defaultLayout) do
    local axApp = hs.axuielement.applicationElement(app[1])
    if axApp then
      originalAppState[i] = { app[1], axApp.AXEnhancedUserInterface, hs.window.animationDuration }
      axApp.AXEnhancedUserInterface = false
      hs.window.animationDuration = 0
    end
  end

  -- Function to restore the original AXEnhancedUserInterface state
  local function restoreAXUIElementState()
    for _, app in ipairs(originalAppState) do
      local axApp = hs.axuielement.applicationElement(app[1])
      if axApp then
        hs.window.animationDuration = app[3]
        axApp.AXEnhancedUserInterface = app[2]
      end
    end
  end

  hs.layout.apply(defaultLayout)
  outlook:hide()
  restoreAXUIElementState()
  ACTIVE_WINDOW_LAYOUT = 3
end

-- Bind the hotkey to launch and arrange default applications
hs.hotkey.bind(MEH, "1", function()
  launchAndArrangeDefault()
end)

-- Bind the hotkey to launch and arrange development applications
hs.hotkey.bind(MEH, "2", function()
  -- if ACTIVE_WINDOW_LAYOUT == 2 then
  --   launchAndArrangeDev4Panel()
  -- else
  launchAndArrangeDevDefault()
  -- end
end)

-- Bind the hotkey to launch and arrange development applications in 4 visible windows
hs.hotkey.bind(MEH, "3", function()
  launchAndArrangeDev4Panel()
end)

---Resets the window layout to the default or development layout according to the current active layout
---This function is called when the screen configuration changes.
local function resetCurrentLayout()
  local currentLayout = ACTIVE_WINDOW_LAYOUT
  if currentLayout == 1 then
    launchAndArrangeDefault()
  elseif currentLayout == 2 then
    launchAndArrangeDevDefault()
  elseif currentLayout == 3 then
    launchAndArrangeDev4Panel()
  end
end

---Initialize a screen watcher to automate application arrangement on display changes
hs.screen.watcher.new(resetCurrentLayout):start()


-- --Initialize application watcher to handle Finder focus changes
-- ---Automatically adjust window arrangement if ACTIVE_WINDOW_LAYOUT is set to 2 or 3 when Finder's focus changes
-- ---This function is called when the Finder application is activated or deactivated.
-- ---It launches and arranges the development layout if the Finder is activated,
-- ---or resets to the default layout if the Finder is deactivated or hidden.
-- ---@param name string - The name of the application
-- ---@param event AppEventType - The event type (activated, deactivated, hidden, terminated)
-- ---@param app hs.application - The application object
-- ---@return nil
-- AppWatcher = hs.application.watcher.new(function(name, event, app)
--   local logger = hs.logger.new("appWatcher", "info")
--   logger.i("App Event: ", name, "-", event)
--   if name ~= "Finder" or (ACTIVE_WINDOW_LAYOUT ~= 2 and ACTIVE_WINDOW_LAYOUT ~= 3) or not app then
--     return
--   end
--   hs.timer.doAfter(1.5, function()
--     if ACTIVE_WINDOW_LAYOUT == 2 and hs.window.focusedWindow():application() == app and event == hs.application.watcher.activated then
--       launchAndArrangeDev4Panel()
--       app:mainWindow():focus()
--       return
--     elseif ACTIVE_WINDOW_LAYOUT == 3 and hs.window.focusedWindow():application() ~= app and (
--           event == hs.application.watcher.deactivated or
--           event == hs.application.watcher.hidden or
--           event == hs.application.watcher.terminated
--         ) then
--       AppWatcher:stop()
--       launchAndArrangeDevDefault()
--       AppWatcher:start()
--       return
--     end
--   end)
-- end)

-- AppWatcher:start()
