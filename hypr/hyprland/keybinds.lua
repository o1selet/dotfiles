-- ============================================================
-- Hyprland Configuration
-- Key and mouse bindings
-- ============================================================

local terminal = "kitty"
local fileManager = "kitty -e ranger"
local menu = "tofi-drun -c ~/.config/tofi/configA --drun-launch=true"
local clipboard = "~/.config/cliphist/menu"
local mainMod = "SUPER"

-- Applications and windows

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region -o /home/b1rdy/scr"))
hl.bind(mainMod .. " +SHIFT + S", hl.dsp.exec_cmd("hyprshot -m output -m active -o /home/b1rdy/scr"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(clipboard .. " select"))
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd(clipboard .. " delete"))
-- Focus

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move and resize windows

local keyboardStep = 40

-- Reorder tiled windows
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.swap({ direction = "left" }),  { repeating = true })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.swap({ direction = "up" }),    { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.swap({ direction = "down" }),  { repeating = true })

-- Move floating windows
hl.bind(mainMod .. " + ALT + left",  hl.dsp.window.move({ x = -keyboardStep, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ x = keyboardStep,  y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + up",    hl.dsp.window.move({ x = 0, y = -keyboardStep, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + down",  hl.dsp.window.move({ x = 0, y = keyboardStep,  relative = true }), { repeating = true })

-- Resize tiled and floating windows
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.resize({ x = -keyboardStep, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = keyboardStep,  y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.resize({ x = 0, y = -keyboardStep, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.resize({ x = 0, y = keyboardStep,  relative = true }), { repeating = true })

-- Workspaces

for i = 1, 10 do
    local key = i % 10

    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + Z", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop lid

hl.bind(
    "switch:on:Lid Switch",
    function()
        hl.monitor({
            output = "eDP-1",
            disabled = true,
        })
    end,
    { locked = true }
)

hl.bind(
    "switch:off:Lid Switch",
    function()
        hl.monitor({
            output = "eDP-1",
            disabled = false,
            mode = "1920x1080@60",
            position = "0x0",
            scale = 1.2,
        })
    end,
    { locked = true }
)

-- Media keys

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume +5 --max-volume 100"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume -5 --max-volume 100"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness +5"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness -5"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
