RegisterCommand('a', function(_, args)
    local playerName = GetPlayerName(source)
    local weaponName = 'weapon_' .. args[1] or 'weapon_pistol'
    local weaponHash = GetHashKey(weaponName)

    if not HasPedGotWeapon(PlayerPedId(), weaponHash, false) then
        GiveWeaponToPed(PlayerPedId(), weaponHash, 250, false, true)
        TriggerClientEvent('chat:addMessage', -1, {
            color = {255, 0, 0},
            multiline = true,
            args = {'Server', playerName .. ' has been given a ' .. weaponName .. '.'}
        })
    else
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            multiline = true,
            args = {'Server', 'You already have a ' .. weaponName .. '.'}
        })
    end
end)
