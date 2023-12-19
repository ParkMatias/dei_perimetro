ESX = exports['es_extended']:getSharedObject()

RegisterCommand(Config.Comando, function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and xPlayer.job.name == 'police' and #args > 0 then
        local playerId, mensaje, coords = source, table.concat(args, ' '), GetEntityCoords(GetPlayerPed(source))
        TriggerClientEvent('marcarPerimetro', -1, playerId, coords, mensaje)
    else
        TriggerClientEvent('chatMessage', source, '^1ERROR: ^7No tienes permiso para usar este comando.')
        if #args == 0 then
            TriggerClientEvent('chatMessage', source, '^1ERROR: ^7Debes ingresar un nombre al perimetro.')
        end
    end
end, false)
