local ESX = nil
local QBCore = nil

if Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
end

local function AddItem(source, item, amount)
    if Config.Inventory == 'ox' then
        exports.ox_inventory:AddItem(source, item, amount)
    elseif Config.Inventory == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.addInventoryItem(item, amount)
        end
    elseif Config.Inventory == 'qb' then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            Player.Functions.AddItem(item, amount)
        end
    end
end

local function RemoveItem(source, item, amount)
    if Config.Inventory == 'ox' then
        exports.ox_inventory:RemoveItem(source, item, amount)
    elseif Config.Inventory == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.removeInventoryItem(item, amount)
        end
    elseif Config.Inventory == 'qb' then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            Player.Functions.RemoveItem(item, amount)
        end
    end
end

local function GetItemCount(source, item)
    if Config.Inventory == 'ox' then
        return exports.ox_inventory:Search(source, 'count', item)
    elseif Config.Inventory == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local item = xPlayer.getInventoryItem(item)
            return item and item.count or 0
        end
    elseif Config.Inventory == 'qb' then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            local item = Player.Functions.GetItemByName(item)
            return item and item.amount or 0
        end
    end
    return 0
end

local function AddMoney(source, amount)
    if Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.addMoney(amount)
        end
    elseif Config.Framework == 'qbcore' then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            Player.Functions.AddMoney('cash', amount)
        end
    end
end

local function Notify(source, title, description, type)
    TriggerClientEvent('ox_lib:notify', source, {
        title = title,
        description = description,
        type = type
    })
end

RegisterNetEvent('fishing:giveFish', function()
    local source = source
    local totalChance = 0
    local chances = {}
    
    for _, fish in pairs(Config.Items) do
        totalChance = totalChance + fish.chance
        table.insert(chances, {
            name = fish.name,
            min = totalChance - fish.chance + 1,
            max = totalChance
        })
    end
    
    local roll = math.random(1, totalChance)
    local caughtFish
    
    for _, fish in pairs(chances) do
        if roll >= fish.min and roll <= fish.max then
            caughtFish = fish.name
            break
        end
    end
    
    AddItem(source, caughtFish, 1)
    
    Notify(source, 'Fishing', ('You caught a %s!'):format(caughtFish), 'success')
end)

RegisterNetEvent('fishing:sellFish', function(fishType, amount)
    local source = source
    amount = tonumber(amount)
    
    if not amount or amount < 1 then return end
    
    local playerFishCount = GetItemCount(source, fishType)

    if playerFishCount < amount then
        Notify(source, 'Fish Monger', 'You don\'t have that many fish!', 'error')
        return 
    end

    if not Config.FishMonger.prices[fishType] then
        Notify(source, 'Fish Monger', 'This fish cannot be sold here!', 'error')
        return
    end
    
    local price = Config.FishMonger.prices[fishType] * amount
    
    RemoveItem(source, fishType, amount)
    
    if Config.Inventory == 'ox' then
        AddItem(source, 'money', price)
    else
        AddMoney(source, price)
    end
    
    Notify(source, 'Fish Monger', ('Sold %sx %s for $%s'):format(amount, fishType, price), 'success')
end)

RegisterNetEvent('fishing:sellAllFish', function()
    local source = source
    local totalEarnings = 0
    local soldFish = {}
    
    for fishType, price in pairs(Config.FishMonger.prices) do
        local playerFishCount = GetItemCount(source, fishType)
        
        if playerFishCount > 0 then
            local earnings = price * playerFishCount
            totalEarnings = totalEarnings + earnings
            
            RemoveItem(source, fishType, playerFishCount)
            
            table.insert(soldFish, {
                name = fishType,
                count = playerFishCount,
                earnings = earnings
            })
        end
    end
    
    if totalEarnings > 0 then
        if Config.Inventory == 'ox' then
            AddItem(source, 'money', totalEarnings)
        else
            AddMoney(source, totalEarnings)
        end
        
        local message = string.format('Sold all fish for $%s total', totalEarnings)
        
        Notify(source, 'Fish Monger', message, 'success')
    else
        Notify(source, 'Fish Monger', 'You don\'t have any fish to sell!', 'error')
    end
end)