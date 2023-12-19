ESX = exports['es_extended']:getSharedObject()

local activeBlips = {}

RegisterNetEvent('marcarPerimetro')
AddEventHandler('marcarPerimetro', function(playerId, coords, mensaje)
    if activeBlips[playerId] then
        for _, blip in pairs(activeBlips[playerId]) do
            RemoveBlip(blip)
        end
    end

    local playerBlips = {}

    local activeBlip = AddBlipForRadius(coords.x, coords.y, coords.z, Config.Radius)
    SetBlipColour(activeBlip, 3)
    SetBlipAlpha(activeBlip, 128)
    SetBlipHighDetail(activeBlip, true)
    SetBlipAsShortRange(activeBlip, true)
    table.insert(playerBlips, activeBlip)

    local activeBlip2 = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipColour(activeBlip2, 4)
    SetBlipSprite(activeBlip2, 161)
    SetBlipScale(activeBlip2, 2.0)
    table.insert(playerBlips, activeBlip2)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(mensaje)
    EndTextCommandSetBlipName(activeBlip2)

    Notificacion(mensaje)

    Citizen.CreateThread(function()
        while true do
            SetBlipColour(activeBlip, 3)
            SetBlipColour(activeBlip2, 3)
            Citizen.Wait(750)
            SetBlipColour(activeBlip, 1)
            SetBlipColour(activeBlip2, 1)
            Citizen.Wait(750)
        end
    end)

    activeBlips[playerId] = playerBlips

    Citizen.CreateThread(function()
        Wait(Config.Tiempo)
        for _, blip in pairs(playerBlips) do
            RemoveBlip(blip)
        end
        activeBlips[playerId] = nil
    end)
end)

Notificacion = function (mensaje)
    mensaje = mensaje
    if Config.Notificacion == 'esx' then
        ESX.ShowNotification(mensaje, 'info', 3000)
    elseif Config.Notificacion == 'mythic' then
        exports['mythic_notify']:SendAlert('inform', mensaje, 3000)
    elseif Config.Notificacion == 'codem' then
        TriggerEvent('codem-notification:Create', mensaje, 'info', 'Perimetro', 5000)
    elseif Config.Notificacion == 'okok' then
        exports['okokNotify']:Alert('inform', mensaje, 3000)
    else
        print('No se ha seleccionado ninguna notificacion')
    end
end
