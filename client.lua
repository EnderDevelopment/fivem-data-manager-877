local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    -- Client-side initialization
    print('FiveMScript client initialized')
end)

RegisterNetEvent('fivemscript:updateValue')
AddEventHandler('fivemscript:updateValue', function(newValue)
    -- Handle value update
    print('Value updated to: ' .. newValue)
end)