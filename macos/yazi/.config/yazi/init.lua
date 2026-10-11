-- Add one blank row below the tab bar when multiple tabs are open.
local original_tabs_height = Tabs.height

function Tabs.height()
	return original_tabs_height() > 0 and 2 or 0
end
