QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateCallback('qb-crypto:server:ExchangeFail', function(source, cb)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("cryptostick")

    if ItemData ~= nil then
        Player.Functions.RemoveItem("cryptostick", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "remove")
        TriggerClientEvent('QBCore:Notify', src, "Attempt failed, the stick has crashed..", 'error', 5000)
    end
end)

QBCore.Functions.CreateCallback('qb-crypto:server:Rebooting', function(source, cb, state, percentage)
	Config.Decrypting["RebootInfo"].state = state
    Config.Decrypting["RebootInfo"].percentage = percentage
end)

QBCore.Functions.CreateCallback('qb-crypto:server:GetRebootState', function(source, cb)
	local src = source
    TriggerClientEvent('qb-crypto:client:GetRebootState', src, Config.Decrypting["RebootInfo"].state)
end)

QBCore.Functions.CreateCallback('qb-crypto:server:SyncReboot', function(source, cb)
    TriggerClientEvent('qb-crypto:client:SyncReboot', -1)
end)

QBCore.Functions.CreateCallback('qb-crypto:server:ExchangeSuccess', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("cryptostick")

    if ItemData ~= nil then
        Player.Functions.RemoveItem("cryptostick", 1)
        TriggerClientEvent('QBCore:Notify', src, "Your associate will contact you with the contents of the thumb drive", "success", 6000)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "remove")
        --pick random message
        local msg = "Chemistry_assignment_v2_realfinal.pdf, Do not waste my time with this crap!!"
        local chance = math.random(1,100)
        local odd = math.random(1,7)
        if chance > 75 then
            if odd == 5 or odd == 6 then
                msg = Config.Tier2[math.random(1,#Config.Tier2)]
            elseif odd == 7 then
                msg = Config.Tier3[math.random(1,#Config.Tier3)]
            else
                msg = Config.Tier1[math.random(1,#Config.Tier1)]
            end
        end
        --email
        TriggerClientEvent("qb-crypto:client:sendMail", src, msg)
    end
end)

RegisterServerEvent('qb-crypto:server:ExchangeFail')
AddEventHandler('qb-crypto:server:ExchangeFail', function()
    QBCore.Functions.BanInjection(source, 'qb-crypto (ExchangeFail)')
end)

RegisterServerEvent('qb-crypto:server:Rebooting')
AddEventHandler('qb-crypto:server:Rebooting', function(state, percentage)
    QBCore.Functions.BanInjection(source, 'qb-crypto (Rebooting)')
end)

RegisterServerEvent('qb-crypto:server:GetRebootState')
AddEventHandler('qb-crypto:server:GetRebootState', function()
    QBCore.Functions.BanInjection(source, 'qb-crypto (GetRebootState)')
end)

RegisterServerEvent('qb-crypto:server:SyncReboot')
AddEventHandler('qb-crypto:server:SyncReboot', function()
    QBCore.Functions.BanInjection(source, 'qb-crypto (SyncReboot)')
end)

RegisterServerEvent('qb-crypto:server:ExchangeSuccess')
AddEventHandler('qb-crypto:server:ExchangeSuccess', function(LuckChance)
    QBCore.Functions.BanInjection(source, 'qb-crypto (ExchangeSuccess)')
end)

QBCore.Functions.CreateCallback('qb-crypto:server:HasSticky', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("cryptostick")

    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)