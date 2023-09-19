local activeBlip = nil

RegisterNetEvent('marcarPerimetro')
AddEventHandler('marcarPerimetro', function(coords, radius)
    if activeBlip then
        RemoveBlip(activeBlip)
    end

    activeBlip = AddBlipForRadius(coords.x, coords.y, coords.z, radius)
    SetBlipColour(activeBlip, 3) 
    SetBlipAlpha(activeBlip, 128)
    SetBlipHighDetail(activeBlip, true)
    SetBlipAsShortRange(activeBlip, true)
end)
