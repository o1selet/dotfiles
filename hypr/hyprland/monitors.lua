-- ============================================================
-- Hyprland Configuration
-- Monitor setup
-- ============================================================

local function lid_is_closed()
    local state = io.open("/proc/acpi/button/lid/LID0/state", "r")
    if not state then
        return false
    end

    local contents = state:read("*a")
    state:close()
    return contents:match("closed") ~= nil
end

hl.monitor({
    output = "eDP-1",
    disabled = lid_is_closed(),
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@100",
    position = "1920x0",
    scale = 1,
})
