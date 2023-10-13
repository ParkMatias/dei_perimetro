ESX = exports['es_extended']:getSharedObject()

RegisterCommand('perimetro', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and xPlayer.job.name == 'police' then
        if #args > 0 then
            local playerId = source
            local mensaje = table.concat(args, ' ')
            local coords = GetEntityCoords(GetPlayerPed(source))
            TriggerClientEvent('marcarPerimetro', -1, playerId, coords, mensaje)
        else
            TriggerClientEvent('chatMessage', source, '^1ERROR: ^7Debes ingresar un nombre al perimetro.')
        end
    else
        TriggerClientEvent('chatMessage', source, '^1ERROR: ^7No tienes permiso para usar este comando.')
    end
end, false)
