ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('MKR:givemoney')
AddEventHandler('MKR:givemoney', function(amount)
    print("givemoney")
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    amount = tonumber(amount)
    if amount == nil or amount <= 0 then
        TriggerClientEvent('chatMessage', _source, "error in amount of money to be setted")
    else
        xPlayer.addMoney(amount)
        TriggerClientEvent('esx:showAdvancedNotification', _source, 'Race Reward',
        'Eeo, man',
        "Today's your lucky. Grab this money sooner then i'll kick your ass~n~MONEY: ~g~"..amount.."$",
        'CHAR_HUNTER', 9)
    end
end)

RegisterNetEvent('MKR:toobad')
AddEventHandler('MKR:toobad', function()
    local _source = source
    TriggerClientEvent('esx:showAdvancedNotification', _source, 'Race Event',
    "O, that's unlucky",
    "Luckly i'm not u. I don't know what u even expected... Bye looser!",
    'CHAR_HUNTER', 9)
end)