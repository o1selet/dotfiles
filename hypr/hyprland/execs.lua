-- ============================================================
-- Hyprland Configuration
-- Startup commands
-- ============================================================

hl.on("hyprland.start", function()
    hl.exec_cmd("hypridle")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("pgrep -f '^wl-paste --type text --watch .*/cliphist/store$' >/dev/null || wl-paste --type text --watch ~/.config/cliphist/store")
    hl.exec_cmd("pgrep -f '^wl-paste --type image --watch .*/cliphist/store$' >/dev/null || wl-paste --type image --watch ~/.config/cliphist/store")
end)
