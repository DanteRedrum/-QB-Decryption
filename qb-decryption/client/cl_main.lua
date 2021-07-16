QBCore = nil
isLoggedIn = false
local requiredItemsShowed = false

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) 
            QBCore = obj 
        end)
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
	if QBCore ~= nil then
		QBCore.Functions.TriggerCallback('qb-crypto:server:GetRebootState', function(result)
		end)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local pos = GetEntityCoords(PlayerPedId())
		local dist = #(pos - vector3(Config.Locations["decrypt"].coords.x, Config.Locations["decrypt"].coords.y, Config.Locations["decrypt"].coords.z))

		if dist < 15 then
			local requiredItems = {
				[1] = {name = QBCore.Shared.Items["cryptostick"]["name"], image = QBCore.Shared.Items["cryptostick"]["image"]},
			}
			if dist < 1.5 then
				if not Config.Decrypting["RebootInfo"].state then
					DrawText3Ds(Config.Locations["decrypt"].coords.x, Config.Locations["decrypt"].coords.y, Config.Locations["decrypt"].coords.z, '~g~E~w~ - Use Thumb drive')
					if not requiredItemsShowed then
						requiredItemsShowed = true
						TriggerEvent('inventory:client:requiredItems', requiredItems, true)
					end

					if IsControlJustPressed(0, Keys["E"]) then
						QBCore.Functions.TriggerCallback('qb-crypto:server:HasSticky', function(HasItem)
							if HasItem then
								QBCore.Functions.Progressbar("deliver_reycle_package", "Plugging in usb drive...", 20000, false, true, {
									disableMovement = true,
									disableCarMovement = true,
									disableMouse = false,
									disableCombat = true,
								}, {}, {}, {}, function() -- Done
									TriggerEvent("mhacking:show")
									TriggerEvent("mhacking:start", math.random(2, 3), 11, HackingSuccess)
								end)
							else
								QBCore.Functions.Notify('You don\'t have a cryptostick', 'error')
							end
						end)
					end
				else
					DrawText3Ds(Config.Locations["decrypt"].coords.x, Config.Locations["decrypt"].coords.y, Config.Locations["decrypt"].coords.z, 'System is rebooting - '..Config.Decrypting["RebootInfo"].percentage..'%')
				end
			else
				if requiredItemsShowed then
					requiredItemsShowed = false
					TriggerEvent('inventory:client:requiredItems', requiredItems, false)
				end
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

function ExchangeSuccess()
	QBCore.Functions.TriggerCallback('qb-crypto:server:ExchangeSuccess', function(result)
	end)
	QBCore.Functions.TriggerCallback('qb-crypto:server:SyncReboot', function(result)
	end)
end

function ExchangeFail()
	QBCore.Functions.TriggerCallback('qb-crypto:server:ExchangeFail', function(result)
		end)
	QBCore.Functions.TriggerCallback('qb-crypto:server:SyncReboot', function(result)
	end)
end

RegisterNetEvent('qb-crypto:client:SyncReboot')
AddEventHandler('qb-crypto:client:SyncReboot', function()
	Config.Decrypting["RebootInfo"].state = true
	SystemCrashCooldown()
end)

function SystemCrashCooldown()
	Citizen.CreateThread(function()
		while Config.Decrypting["RebootInfo"].state do

			if (Config.Decrypting["RebootInfo"].percentage + 1) <= 100 then
				Config.Decrypting["RebootInfo"].percentage = Config.Decrypting["RebootInfo"].percentage + 1
				QBCore.Functions.TriggerCallback('qb-crypto:server:Rebooting', function(result)
				end, true, Config.Decrypting["RebootInfo"].percentage)
			else
				Config.Decrypting["RebootInfo"].percentage = 0
				Config.Decrypting["RebootInfo"].state = false
				QBCore.Functions.TriggerCallback('qb-crypto:server:Rebooting', function(result)
				end, false, 0)
			end

			Citizen.Wait(1200)
		end
	end)
end

function HackingSuccess(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        ExchangeSuccess()
    else
		TriggerEvent('mhacking:hide')
		ExchangeFail()
	end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	isLoggedIn = true
	QBCore.Functions.TriggerCallback('qb-crypto:server:GetRebootState', function(result)
	end)
end)

RegisterNetEvent('qb-crypto:client:GetRebootState')
AddEventHandler('qb-crypto:client:GetRebootState', function(RebootInfo)
	if Config.Decrypting["RebootInfo"].state then
		Config.Decrypting["RebootInfo"].state = RebootInfo.state
		Config.Decrypting["RebootInfo"].percentage = RebootInfo.percentage
		SystemCrashCooldown()
	end
end)

--mail
RegisterNetEvent('qb-crypto:client:sendMail')
AddEventHandler('qb-crypto:client:sendMail',function(msg)
	Citizen.Wait(90000)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "Ph03nix",
        subject = "SECURED EMAIL",
        message = "I decrypted the files on the thumbdrive and found: "..msg
    })
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end