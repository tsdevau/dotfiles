-- Auto-open PDFs in Preview when they download
local downloadsPath = os.getenv("HOME") .. "/Downloads"

local function handleDownload(paths)
  for _, path in pairs(paths) do
    if path:match("%.pdf$") then
      -- Small delay to ensure file is fully written
      hs.timer.doAfter(0.5, function()
        hs.execute("open -a Preview '" .. path .. "'")
      end)
    end
  end
end

-- Initialize the path watcher
hs.pathwatcher.new(downloadsPath, handleDownload):start()
