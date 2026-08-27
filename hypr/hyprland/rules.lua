-- ============================================================
-- Hyprland Configuration
-- Window and workspace rules
-- ============================================================

hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "move-hyprland-run",
    match = {
        class = "hyprland-run",
    },
    move = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "gtk-file-picker",
    match = {
        class = "^xdg-desktop-portal-gtk$",
    },
    float = true,
    size = { 955, 535 },
    center = true,
})

hl.window_rule({
    name = "waypaper-overlay",
    match = {
        class = "^waypaper$",
    },
    float = true,
    center = true,
})

hl.window_rule({
    name = "flclashx",
    match = {
        class = "^Com\\.follow\\.clashx$",
    },
    float = true,
    size = { 588, 868 },
    center = true,
})

hl.window_rule({
    name = "social-apps",
    match = {
        class = "^(discord|org\\.telegram\\.desktop)$",
    },
    workspace = "special:social silent",
})
