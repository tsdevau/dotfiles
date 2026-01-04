-- Reload Hammerspoon configuration on change

local configPath = os.getenv("HOME") .. "/.config/hammerspoon"

local function handleConfigReload(paths)
  for _, path in pairs(paths) do
    if path:match("%.lua$") then
      -- Small delay to ensure file is fully written
      hs.timer.doAfter(0.5, function()
        hs.reload()
      end)
    end
  end
end

-- Initialize the path watcher
hs.pathwatcher.new(configPath, handleConfigReload):start()
