--_____   _____        ___       _   _   _____   _           ___   _____   _   _   
--|  _  \ |  _  \      /   |     | | | | |  _  \ | |         /   | /  ___| | | / /  
--| | | | | |_| |     / /| |     | | | | | |_| | | |        / /| | | |     | |/ /   
--| | | | |  _  /    / / | |  _  | | | | |  _  { | |       / / | | | |     | |\ \   
--| |_| | | | \ \   / /  | | | |_| | | | | |_| | | |___   / /  | | | |___  | | \ \  
--|_____/ |_|  \_\ /_/   |_| \_____/ |_| |_____/ |_____| /_/   |_| \_____| |_|  \_\ 


ESX, vips = nil, {}

TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
end)


Citizen.CreateThread(function()
    MySQL.Async.fetchAll("SELECT identifier, viplevel FROM users WHERE viplevel > 0", {}, function(result)
        for id, data in pairs(result) do
            vips[data.identifier] = data.viplevel
        end
    end)
end)

RegisterNetEvent("draji:RequestVipLevel")
AddEventHandler("draji:RequestVipLevel", function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local identifier = GetPlayerIdentifier(_src)
    TriggerClientEvent("draji:callbackVipLvl", _src, (vips[identifier] or 0))
end)