local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local status_ok_theme, alpha_dashboard_theme = pcall(require, "alpha.themes.dashboard")
if not status_ok_theme then
	return
end

M = {}

M.config = {
	alpha.setup(alpha_dashboard_theme.config),
}

return M
