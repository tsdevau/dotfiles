-- Auto-open PDFs in Preview when they download

local downloadsPath = os.getenv("HOME") .. "/Downloads"

local function handleDownload(paths, flags)
  for i, path in pairs(paths) do
    local flagTable = flags[i]
    if path:match("%.pdf$") and flagTable.itemCreated and flagTable.itemIsFile then
      -- Small delay to ensure file is fully written
      hs.timer.doAfter(0.5, function()
        hs.execute("open -a Preview '" .. path .. "'")
      end)
    end
  end
end

-- Initialize the path watcher
hs.pathwatcher.new(downloadsPath, handleDownload):start()
