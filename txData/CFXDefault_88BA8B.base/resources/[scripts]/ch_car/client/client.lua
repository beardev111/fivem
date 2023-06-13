RegisterCommand('c', function(_, args)
    local vehicleName = args[1] or 'adder'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { vehicleName .. 'não é um nome de carro válido'}
        })

        return
    end

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        Wait(10)
    end

    local playerPed = PlayerPedId()
    local pos       = GetEntityCoords(playerPed)
    local heading   = GetEntityHeading(playerPed)

    local vehicle = CreateVehicle(
        vehicleName,
        pos,
        heading,
        true
    )

    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetModelAsNoLongerNeeded(vehicleName)
end)