ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('MKR:registry')
AddEventHandler('MKR:registry', function(amount, char)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local base = 0
    amount = tonumber(amount)
    base = xPlayer.getAccount('bank').money
    if amount == nil or amount <= 0 then
        TriggerClientEvent('chatMessage', _source, _U"error_paid")
    else
        if amount > base then
            amount = base
        end
        xPlayer.removeAccountMoney('bank', amount)
        TriggerClientEvent('esx:showAdvancedNotification', _source, _U("race_entry"),
        _U("race_entry_header"),
        _U("race_entry_message")..amount.."$",
        char, 9)
        TriggerClientEvent('MKR:enterrace', _source)
    end
end)

RegisterNetEvent('MKR:givemoney')
AddEventHandler('MKR:givemoney', function(amount, char)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    amount = tonumber(amount)
    if amount == nil or amount <= 0 then
        TriggerClientEvent('chatMessage', _source, _U"error_setmoney")
    else
        xPlayer.addMoney(amount)
        TriggerClientEvent('esx:showAdvancedNotification', _source, _U"race_reward",
        _U"race_reward_header",
        _U"race_reward_message"..amount.."$",
        char, 9)
    end
end)

RegisterNetEvent('MKR:toobad')
AddEventHandler('MKR:toobad', function(char)
    local _source = source
    TriggerClientEvent('esx:showAdvancedNotification', _source, _U"race_failed",
    _U"race_failed_header",
    _U"race_failed_message",
    char, 9)
end)