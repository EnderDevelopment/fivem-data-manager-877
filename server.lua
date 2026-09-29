local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Server-side initialization
print('FiveMScript server initialized')

-- Database functions
local function getPlayerData(playerId, callback)
    MySQL.Async.fetchScalar('SELECT value FROM ' .. Config.Database.TableName .. ' WHERE player_id = @player_id', {
        ['@player_id'] = playerId
    }, function(result)
        if result then
            callback(result)
        else
            MySQL.Async.execute('INSERT INTO ' .. Config.Database.TableName .. ' (player_id, value) VALUES (@player_id, @value)', {
                ['@player_id'] = playerId,
                ['@value'] = Config.ScriptSettings.DefaultValue
            }, function()
                callback(Config.ScriptSettings.DefaultValue)
            end)
        end
    end)
end

-- Command example
ESX.RegisterCommand('fivemscript', 'user', function(xPlayer, args, showError)
    local playerId = xPlayer.identifier

    getPlayerData(playerId, function(currentValue)
        local newValue = currentValue + 10

        MySQL.Async.execute('UPDATE ' .. Config.Database.TableName .. ' SET value = @value WHERE player_id = @player_id', {
            ['@value'] = newValue,
            ['@player_id'] = playerId
        }, function()
            TriggerClientEvent('fivemscript:updateValue', xPlayer.source, newValue)
        end)
    end)
end, false, {help = 'Example command for FiveMScript'})