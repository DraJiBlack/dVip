--_____   _____        ___       _   _   _____   _           ___   _____   _   _   
--|  _  \ |  _  \      /   |     | | | | |  _  \ | |         /   | /  ___| | | / /  
--| | | | | |_| |     / /| |     | | | | | |_| | | |        / /| | | |     | |/ /   
--| | | | |  _  /    / / | |  _  | | | | |  _  { | |       / / | | | |     | |\ \   
--| |_| | | | \ \   / /  | | | |_| | | | | |_| | | |___   / /  | | | |___  | | \ \  
--|_____/ |_|  \_\ /_/   |_| \_____/ |_| |_____/ |_____| /_/   |_| \_____| |_|  \_\ 


ESX = nil

--- Autheur : DraJiBlack#3403
--- Github : 


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
    TriggerServerEvent("draji:RequestVipLevel")
    PlayerData = ESX.GetPlayerData()
    print("[^3Autheur^7] ^2DraJiBlack#3403")
	print("[^3Initialisation^7] ^2dVip")
end)

--- Menu Peds ---

function menuped()


    local menu = RageUI.CreateMenu(DraJi.NameMenu,"Menu VIP")
    local peds = RageUI.CreateSubMenu(menu, "Peds", "Menu VIP")
    local homme = RageUI.CreateSubMenu(peds, "Homme", "Peds Homme")
    local femme = RageUI.CreateSubMenu(peds, "Femme", "Peds Femme")
    local animaux = RageUI.CreateSubMenu(peds, "Animaux", "Peds Animaux")
    local urgence = RageUI.CreateSubMenu(menu, "Vélo", "Vélo de dépannage")



    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menu, function()

--------------------------------------------------------------------------------------------------
            
            RageUI.Separator("Votre Steam : ~b~"..GetPlayerName(PlayerId()))
            RageUI.Separator("Votre ID : ~b~"..GetPlayerServerId(PlayerId()))
            RageUI.Separator("Status : ~h~~y~VIP~s~")
            RageUI.Separator("")
            RageUI.Separator("~b~↓ Choisis ton Peds ↓")

--------------------------------------------------------------------------------------------------


            RageUI.Button("~r~Réiniatialiser le ped", nil, {RightLabel = "~w~←"}, true, {
                onSelected = function()
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    local isMale = skin.sex == 0
                    TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                            TriggerEvent('esx:restoreLoadout')
                            Citizen.Wait(200)
                            ESX.ShowAdvancedNotification("Menu VIP", "~b~Apparence","~y~Vous avez retrouver votre apparance", "CHAR_REVENGE", 2) 

                        end)
                    end)
                end)
        end})   

            RageUI.Button("~g~→ PEDS", nil, {RightLabel = "→→"}, true , {
                onSelected = function()
                end
            }, peds)


            RageUI.Button("~b~Vélo de dépannage", nil, {RightLabel = "~w~←"}, true, {
                onSelected = function()
                    local model = GetHashKey("bmx")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    local vehicle = CreateVehicle(model, pos, true, true)
                    ESX.ShowAdvancedNotification("Menu VIP", "~b~Dépannage","~y~Vous avez bien reçu votre vélo de dépannage", "CHAR_REVENGE", 2) 
                    RageUI.CloseAll()
                  end
              })






          end)




          


        RageUI.IsVisible(peds, function()

            RageUI.Separator("~b~↓~s~ Liste des peds ~b~↓~s~")


            RageUI.Button("Hommes", nil, {}, true, {
                onSelected = function()
                end}, homme); 
            

            RageUI.Button("Femme", nil, {}, true, {
                onSelected = function()
                end}, femme); 

            RageUI.Button("Animaux", nil, {}, true, {
                onSelected = function()
                end}, animaux); 

            end)


        RageUI.IsVisible(homme, function()

            RageUI.Separator("~b~↓~s~ Liste des peds ~b~↓~s~")

            for _, v in pairs (DraJi.PedHomme) do

                RageUI.Button(v.name, nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                onSelected = function()
                    local j1 = PlayerId()
                    local p1 = GetHashKey(v.model)
                    ESX.ShowAdvancedNotification("Menu VIP", "~b~Apparence","~y~Apparance chargé avec succès", "CHAR_REVENGE", 2) 
                    Citizen.Wait(200)
                    RequestModel(p1)
                    while not HasModelLoaded(p1) do
                        Wait(100)
                    end
                    SetPlayerModel(j1, p1)
                    SetModelAsNoLongerNeeded(p1)
                end 
            });
       end
end)


         RageUI.IsVisible(femme, function()

            RageUI.Separator("~b~↓~s~ Liste des peds ~b~↓~s~")

            for _, v in pairs (DraJi.PedFemme) do

                RageUI.Button(v.name, nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                onSelected = function()
                    local j1 = PlayerId()
                    local p1 = GetHashKey(v.model)
                    ESX.ShowAdvancedNotification("Menu VIP", "~b~Apparence","~y~Apparance chargé avec succès", "CHAR_REVENGE", 2) 
                    Citizen.Wait(200)
                    RequestModel(p1)
                    while not HasModelLoaded(p1) do
                        Wait(100)
                    end
                    SetPlayerModel(j1, p1)
                    SetModelAsNoLongerNeeded(p1)
                end 
            });
       end
end)


        RageUI.IsVisible(animaux, function()

            RageUI.Separator("~b~↓~s~ Liste des peds ~b~↓~s~")

            for _, v in pairs (DraJi.PedAnimaux) do

                RageUI.Button(v.name, nil, {RightBadge = RageUI.BadgeStyle.None}, true, {
                onSelected = function()
                    local j1 = PlayerId()
                    local p1 = GetHashKey(v.model)
                    ESX.ShowAdvancedNotification("Menu VIP", "~b~Apparence","~y~Apparance chargé avec succès", "CHAR_REVENGE", 2) 
                    Citizen.Wait(200)
                    RequestModel(p1)
                    while not HasModelLoaded(p1) do
                        Wait(100)
                    end
                    SetPlayerModel(j1, p1)
                    SetModelAsNoLongerNeeded(p1)
                end 
            });
       end
end)



        if not RageUI.Visible(menu) and not RageUI.Visible(homme) and not RageUI.Visible(femme) and not RageUI.Visible(animaux) and not RageUI.Visible(urgence) and not RageUI.Visible(peds) then
            menu=RMenu:DeleteType("Menu VIP", true)
        end
    end
end

vipLevel = 0

RegisterNetEvent('vip')
AddEventHandler('vip', function(vip)
    viplevel = vip
end)

RegisterNetEvent("draji:callbackVipLvl")
AddEventHandler("draji:callbackVipLvl", function(incomingVipLevel)
    if incomingVipLevel > 0 then 
        ESX.ShowNotification("Niveau de votre souscription VIP : ~y~~h~"..incomingVipLevel) 
    end
    vipLevel = incomingVipLevel
end)

RegisterCommand("vip", function()
    if vipLevel <= 0 then 
        ESX.ShowAdvancedNotification("Menu VIP", "~b~Vous n'êtes pas VIP","~r~Vous n'avez pas la permission d'accéder à ce menu ! \n~w~Plus d'informations sur ~b~Discord ~w~!", "CHAR_REVENGE", 2) 
        RageUI.CloseAll() 
    else 
        menuped() 
    end
end)


RegisterNetEvent("draji:RequestVipLevel")
AddEventHandler("draji:RequestVipLevel", function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local identifier = GetPlayerIdentifier(_src)
    TriggerClientEvent("draji:callbackVipLvl", _src, (vips[identifier] or 0))
end)