---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local launcher  = "rofi -show drun -show-icons"
local runner = "rofi -show run"
local fileManager = "nemo"
local codeEditor = "code"
local browser = "chromium"
local music = "rofi -show run -filter Deezer -auto-select"


------------------
---- GESTURES ----
------------------


hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})


---------------------
---- KEYBINDINGS ----
---------------------


local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local secondMod = mainMod .. " + SHIFT"

local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close(), {description="close the focused window"})

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("hyprlock"), {description="lock the session"})
hl.bind(secondMod .. " + ESCAPE", hl.dsp.exec_cmd("wlogout --buttons-per-row 2"), {description="open the logout menu"}, {locked = true})



-- Open apps
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("/home/tamary/.config/hypr/scripts/hyprbinds.sh"), {description="open keybind list"})
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal), {description="open terminal"})
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(launcher), {description="open app launcher"})
hl.bind(secondMod .. " + SPACE", hl.dsp.exec_cmd(runner), {description="open program launcher"})
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager), {description="open file manager"})
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), {description="open web browser"})
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(codeEditor), {description="open VS Code"})
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(music), {description="open music platform"})
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("steam"), {description="open steam"})
hl.bind(secondMod .. " + G", hl.dsp.exec_cmd("heroic games launcher"), {description="open epicgames"})
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord"), {description="open discord"})
hl.bind(secondMod .. " + D", hl.dsp.exec_cmd(browser .. " --app=https://web.whatsapp.com/"), {description="open whatsapp"})
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -op"), {description="open notification center"})


-- window management
hl.bind(secondMod .. " + V", hl.dsp.window.float({ action = "toggle" }), {description="toggle floating window mode"})
hl.bind(secondMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }), {description="maximize focused window"})

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }), {description="move focus to left window"})
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), {description="move focus to right window"})
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }), {description="move focus to upper window"})
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }), {description="move focus to lower window"})
-- Swap windows with another
hl.bind(secondMod .. " + left",  hl.dsp.window.move({ direction = "left" }), {description="swap with left window"})
hl.bind(secondMod .. " + right", hl.dsp.window.move({ direction = "right" }), {description="swap with right window"})
hl.bind(secondMod .. " + up",    hl.dsp.window.move({ direction = "up" }), {description="swap with upper window"})
hl.bind(secondMod .. " + down",  hl.dsp.window.move({ direction = "down" }), {description="swap with lower window"})

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = {"ampersand", "eacute", "quotedbl", "apostrophe", "parenleft", "minus", "egrave", "underscore", "ccedilla", "agrave"} -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key[i],             hl.dsp.focus({ workspace = i}), {description="change focus to workspace i"})
    hl.bind(secondMod .. " + " .. key[i],     hl.dsp.window.move({ workspace = i }), {description="send window to workspace i"})
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", 	   hl.dsp.workspace.toggle_special("S"), {description="change focus to special workspace"})
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:S" }), {description="send window to special workspace"})

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), {description="scroll between workspaces"})
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), {description="scroll between workspaces"})

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {description="move window"}, { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {description="resize window"}, { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {description="raise volume"}, { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {description="decrease volume"}, { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {description="mute audio"}, { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {description="mute microphone"}, { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioRaiseVolume",  hl.dsp.exec_cmd("brightnessctl set +5"), {description="raise brightness"}, { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioLowerVolume",hl.dsp.exec_cmd("brightnessctl set 5-"), {description="decrease brightness"}, { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"), {description="next audio media"})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {description="pause media"})
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), {description="play media"})
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"), {description="previous audio media"})

-- screen capture --
hl.bind(secondMod .. "+ C", hl.dsp.exec_cmd("hyprshot -z -o ~/Pictures/Screenshots -m region"), {description="capture screen"})
 