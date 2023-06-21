RegisterCommand('on', function(_, args)    
    local onlinePlayersId = GetActivePlayers()
    local onlinePlayersName = {}

    for index, value in pairs(playersOnline) do
        onlinePlayersName[index] = GetPlayerName(GetPlayerFromIndex(value))
    end

    TriggerEvent('chat:addMessage', {
        args = { playersOnline }
    })
end)

RegisterCommand('goto', function(_, args)
    local targetId = args[1]
    
    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Please provide a target ID.'}
        })
        return
    end

    TriggerServerEvent('ch_teleporter:goto', targetId)
end)

RegisterCommand('summon', function(_, args)
    local targetId = args[1]
    
    if not targetId then
        TriggerEvent('chat:addMessage', {
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