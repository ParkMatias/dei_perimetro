ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('perimetro', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name == 'police' then
        local playerCoords = GetEntityCoords(GetPlayerPed(source))
        local radius = 50.0 

        TriggerClientEvent('marcarPerimetro', -1, playerCoords, radius)

        Citizen.Wait(300000) 

        TriggerClientEvent('eliminarPerimetro', -1)
    else
        TriggerClientEvent('chatMessage', source, '^1ERROR: ^7No tienes permiso para usar este comando.')
    end
end, false)
