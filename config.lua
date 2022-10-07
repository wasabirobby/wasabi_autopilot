-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.checkForUpdates = true -- Check for Updates?

Config.NormalSpeed = 25.0 -- Normal Speed
Config.NormalDrive = 786603 -- Normal Drive Style
Config.CrazySpeed = 100.0 -- Crazy Speed
Config.CrazyDrive = 1074528293 -- Crazy Drive Style

Config.NormalKeybind = true -- Enable Keymapping for toggling normal driving autopilot
Config.DefaultKey = "i" -- Default keybind to toggle normal driving autopilot
Config.CrazyKeybind = true -- Enable Keymapping for toggling crazy driving autopilot
Config.CrazyKey = "o" -- Default keybind to toggle crazy driving autopilot

Config.StartCommand = "autopilot" -- Command to activate Auto-Pilot
Config.NormalCMD = "normal" -- Normal driving command argument
Config.CrazyCMD = "crazy" -- Crazy driving command argument
--Default normal autopilot: /autopilot normal

Config.StopCommand = "apstop" -- Command to disable Auto-Pilot

Config.MythicNotify = true --If you use Mythic Notify
Config.pNotify = false --If you use pNotify

Config.Translate = {
    [1] = "Autopilot - Activated",
    [2] = "You have not set a waypoint!",
    [3] = "You are not in a vehicle!",
    [4] = "Autopilot - Disabled",
    [5] = "Autopilot Normal - Button Pressed",
    [6] = "Autopilot Aggressive - Button Pressed"
}