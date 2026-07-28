-- ============================================================
-- Hyprland Configuration
-- General appearance and behavior
-- ============================================================

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 5,
        gaps_workspaces = 50,
        border_size = 1,

        col = {
            active_border = "rgba(0DB7D455)",
            inactive_border = "rgba(31313600)",
        },

        resize_on_border = true,
        no_focus_fallback = true,
        allow_tearing = true,
        layout = "dwindle",

        snap = {
            enabled = true,
            window_gap = 4,
            monitor_gap = 5,
            respect_gaps = true,
        },
    },

    decoration = {
        rounding = 18,
        rounding_power = 2.5,

        blur = {
            enabled = true,
            xray = true,
            special = false,
            new_optimizations = true,
            size = 10,
            passes = 3,
            brightness = 1,
            noise = 0.05,
            contrast = 0.89,
            vibrancy = 0.5,
            vibrancy_darkness = 0.5,
            popups = false,
            popups_ignorealpha = 0.6,
            input_methods = true,
            input_methods_ignorealpha = 0.8,
        },

        shadow = {
            enabled = true,
            range = 20,
            offset = { 0, 2 },
            render_power = 10,
            color = "rgba(00000020)",
        },

        dim_inactive = true,
        dim_strength = 0.05,
        dim_special = 0.2,
    },

    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = false,
    },

    master = {
        new_status = "master",
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})
