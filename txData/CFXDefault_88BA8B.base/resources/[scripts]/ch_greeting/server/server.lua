RegisterCommand('setGreeting', function(source, args, rawCommand)
    local identifier = GetPLayerIdentifierByType(source, 'license')
    local greeting = string.sub(rawCommand, 13)

    MySQL.await('INSERT INTO greetings (identifier, greeting) VALUES (?, ?) ON DUPLICATE KEY UPDATE greetings = ?', {
        identifier,
        greeting,
        greetings,
    }, function()
        TriggerClientEvent('chat:addMessage', source, {
            args = 'Your greeting has been saved!'
        })
    end)
end)

RegisterNetEvent('ch_greeting:show', function()

end)