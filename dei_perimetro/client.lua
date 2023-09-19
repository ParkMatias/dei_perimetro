local marcadorActivo = false
local blipPerimetro = nil

RegisterNetEvent('marcarPerimetro')
AddEventHandler('marcarPerimetro', function(coords, radius)
    if not marcadorActivo then
        blipPerimetro = AddBlipForRadius(coords.x, coords.y, coords.z, radius)
        SetBlipSprite(blipPerimetro, 9) 
        SetBlipAlpha(blipPerimetro, 128) 
        SetBlipColour(blipPerimetro, 3) 
        SetBlipHighDetail(blipPerimetro, true)
        SetBlipAsShortRange(blipPerimetro, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Perímetro Policial")
        EndTextCommandSetBlipName(blipPerimetro)
        marcadorActivo = true
    end
end)

RegisterNetEvent('eliminarPerimetro')
AddEventHandler('eliminarPerimetro', function()
    if marcadorActivo then
        RemoveBlip(blipPerimetro)
        marcadorActivo = false
    end
end)
