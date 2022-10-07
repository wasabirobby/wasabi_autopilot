-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local Speed = Config.NormalSpeed
local Drive = Config.NormalDrive
local mode = "normal"

if Config.NormalKeybind then
    RegisterCommand('+normalpilot', function()
        local player = PlayerPedId()
        if IsPedInAnyVehicle(player) then
            mode = "normal"
            Drive = Config.NormalDrive
        end
        if DoesBlipExist(GetFirstBlipInfoId(8)) and IsPedInAnyVehicle(player) then
            local blip = GetFirstBlipInfoId(8)
            local bCoords = GetBlipCoords(blip)
            ClearPedTasks(player)
            local veh = GetVehiclePedIsIn(player, false)
            TaskVehicleDriveToCoord(player, veh, bCoords, tonumber(Speed), 0, veh, Drive, 0, true)
            SetDriveTaskDrivingStyle(player, Drive)
            if Config.MythicNotify then
                exports['mythic_notify']:SendAlert('success', Config.Translate[5], 2500)
            elseif Config.pNotify then
                exports['pNotify']:SendNotification({text = Config.Translate[5], type = "success", 2500})
            end
        end
    end, false)

    RegisterCommand('-normalpilot', function()
        if IsPedInAnyVehicle(PlayerPedId()) then
            ClearPedTasks(PlayerPedId())
        end
    end, false)
    RegisterKeyMapping('+normalpilot', 'Autopilot(Normal Driving)', 'keyboard', Config.DefaultKey)
end

if Config.CrazyKeybind then
    RegisterCommand('+crazypilot', function()
        local player = PlayerPedId()
        if IsPedInAnyVehicle(player) then
            mode = "crazy"
            Drive = Config.CrazyDrive
        end
        if DoesBlipExist(GetFirstBlipInfoId(8)) and IsPedInAnyVehicle(player) then
            local blip = GetFirstBlipInfoId(8)
            local bCoords = GetBlipCoords(blip)
            ClearPedTasks(player)
            local veh = GetVehiclePedIsIn(player, false)
            TaskVehicleDriveToCoord(player, veh, bCoords, tonumber(Speed), 0, veh, Drive, 0, true)
            SetDriveTaskDrivingStyle(player, Drive)
            if Config.MythicNotify then
                exports['mythic_notify']:SendAlert('success', Config.Translate[6], 2500)
            elseif Config.pNotify then
                exports['pNotify']:SendNotification({text = Config.Translate[6], type = "success", 2500})
            end
        end
    end, false)

    RegisterCommand('-crazypilot', function()
        if IsPedInAnyVehicle(PlayerPedId()) then
            ClearPedTasks(PlayerPedId())
        end
    end, false)
    RegisterKeyMapping('+crazypilot', 'Autopilot(Agressive Driving)', 'keyboard', Config.CrazyKey)
end

RegisterCommand(Config.StartCommand, function(source, args)
    local player = PlayerPedId()

    if IsPedInAnyVehicle(player) then
        if table.concat(args," ") == Config.NormalCMD then
            mode = "normal"
        end
        if table.concat(args," ") == Config.CrazyCMD then
            mode = "crazy"
        end
        if mode == 'crazy' then
            Drive = Config.CrazyDrive
            Speed = Config.CrazySpeed
        elseif mode == 'normal' then
            Drive = Config.NormalDrive
        end
        if DoesBlipExist(GetFirstBlipInfoId(8)) then
            local blip = GetFirstBlipInfoId(8)
            local bCoords = GetBlipCoords(blip)
            ClearPedTasks(player)
            local veh = GetVehiclePedIsIn(player, false)
            TaskVehicleDriveToCoord(player, veh, bCoords, tonumber(Speed), 0, veh, Drive, 0, true)
            SetDriveTaskDrivingStyle(player, Drive)

            if Config.MythicNotify then
                exports['mythic_notify']:SendAlert('success', Config.Translate[1], 2500)
            elseif Config.pNotify then
                exports['pNotify']:SendNotification({text = Config.Translate[1], type = "success", 2500})
            end

        elseif Config.pNotify then
            exports['pNotify']:SendNotification({text = Config.Translate[2], type = "error", timeout = 2500})
        elseif Config.MythicNotify then
            exports['mythic_notify']:SendAlert('error', Config.Translate[2], 2500)
        end

    elseif Config.pNotify then
        exports['pNotify']:SendNotification({text = Config.Translate[3], type = "error", timeout = 2500})
    elseif Config.MythicNotify then
        exports['mythic_notify']:SendAlert('error', Config.Translate[3], 2500)
    end
end, false)

RegisterCommand(Config.StopCommand, function(source, args)
    if IsPedInAnyVehicle(PlayerPedId()) then
        ClearPedTasks(PlayerPedId())
        if Config.MythicNotify then
            exports['mythic_notify']:SendAlert('error', Config.Translate[4], 2500)
        elseif Config.pNotify then
            exports['pNotify']:SendNotification({text = Config.Translate[4], type = "error", timeout = 2500})
        end
    elseif Config.MythicNotify then
        exports['mythic_notify']:SendAlert('error', Config.Translate[3], 2500)
    elseif Config.pNotify then
        exports['pNotify']:SendNotification({text = Config.Translate[3], type = "error", timeout = 2500})
    end
end, false)