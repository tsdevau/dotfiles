function Linemode:mtime_or_btime()
  local time = math.floor(self._file.cha.mtime or self._file.cha.btime or 0)
  if time == 0 then
    time = ""
  elseif os.date("%Y%m%d", time) == os.date("%Y%m%d") then
    time = os.date("Today %H:%M", time)
  elseif os.date("%Y%m", time) == os.date("%Y%m") and tonumber(os.date("%d", time)) + 1 == os.date("%d") then
    time = os.date("Yesterday %H:%M", time)
  elseif os.date("%Y", time) == os.date("%Y") then
    local day = os.date("*t", time).day
		time = day .. os.date(" %b %Y %H:%M", time)
  else
    local day = os.date("*t", time).day
    time = day .. os.date(" %b %Y %H:%M", time)
  end
  return string.format("%s", time)
end

Status:children_add(function(self)
	local h = self._current.hovered
	if not (h and h.link_to) then
		return ui.Line {""}
	end

	return ui.Line{ui.Span("->" .. tostring(h.link_to)):fg("green")}
end, 3300, Status.LEFT)

Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("red"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("red"),
		" ",
	}
end, 500, Status.RIGHT)
