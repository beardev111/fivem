RegisterCommand('goto', function(_, args)
    local targetId = args[1]
    
    if not targetId then
        TriggerEenvet('chat:addMessage', {
            args = { 'Please provide a target ID.'}
        })

        return
    end

    TriggerServerEvent('ch_teleporter:goto', targetId)
end)

RegisterCommand('summon', function(_, args)
    local targetId = args[1]
    
    if not targetId then
        TriggerEenvet('chat:addMessage', {
            args = { 'Please provide a target ID.'}
        })

        return
    end

    TriggerServerEvent('ch_teleporter:summon', targetId)
end)

AddEventHandler('ch_teleporter:teleport', function(targetCoordinates)
    local playerPed = PlayerPedId()

    SetEntityCoords(playerPed, targetCoordinates)
end)