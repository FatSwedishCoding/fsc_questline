local ped = nil
ESX = nil
local kattenblipen = nil
local avloppblipen = nil
local stuff = {
    inMission = false,
	hittatkatt = false,
	inlamnadkatt = false,
	hittatring = false
	}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


-- Quest Giver NYA UPDATEN
Citizen.CreateThread(function()
while not NetworkIsSessionStarted() do Wait(0) end
	-- Skapar Quest peden.
    ped2 = createPed(1146800212, vector3(242.61, -890.07, 30.49 -1), 32.17)
	local me = PlayerPedId()
	while true do
        local sleep = 200
        local distance = GetDistanceBetweenCoords(GetEntityCoords(me), GetEntityCoords(ped2))
        if distance > 2.5 then
            sleep = 200
			else
			sleep = 5
			 BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ Prata med %s'):format('Vanja Andersson'))
			 EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 38) then
			cutsceneOver = GetGameTimer() + (1000 * 4)
    local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
	TriggerEvent('esx:showNotification', 'Hej jag heter Vanja Andersson trevligt att träffas.')
    SetCamCoord(cam, vector3(240.5, -895.53, 33.00))
    RenderScriptCams(1, 0, 0, 1, 1)
			if stuff.hittatkatt then
			TriggerServerEvent('fsc_questline:klarkatt')
			return
			end
			TriggerServerEvent('fsc_questline:linkustart')			
			end
			Wait(5)
			end
			Wait(5)
			end
end)
--lägger in katten och allt det. nya versionen!
RegisterNetEvent('fsc_questline:kattpos')
AddEventHandler('fsc_questline:kattpos', function(pos, cords)
stuff.inMission = true
kattped = createPed(1462895032, pos, 305.69)
	NetworkRegisterEntityAsNetworked(kattped)
	
    TriggerEvent('fsc_questline:avbrytkamera')
	
	--Sätter gps
	--local pedBlip = AddBlipForEntity(ped)
	local pedBlip = AddBlipForCoord(cords)
	SetBlipColour(pedBlip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Babsans GPS')
EndTextCommandSetBlipName(pedBlip)

-- kollar om mission är igång, 
	 while stuff.inMission do
	 if not stuff.hittatkatt then
	if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(kattped), false) <= 2.0 then
	 BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ Plocka upp %s'):format('Babsan'))
            EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 38) then
                sleep = 500
				TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_KNEEL", 0, false)
				Wait(5000)
				  TriggerEvent('fsc_questline:avslutaanim')
				stuff.hittatkatt = true
				DeleteEntity(kattped)
				TriggerEvent("animation:carry","crate01")
				RemoveBlip(pedBlip)
				TriggerEvent('esx:showNotification', 'Du har hittat Babsan, lämna tillbaka henne till Vanja.')
end
end
else
end
Wait(5)
end
end)

RegisterNetEvent('fsc_questline:avbrytkamera')
AddEventHandler('fsc_questline:avbrytkamera', function()
while cutsceneOver >= GetGameTimer() do
        for i = 0, 31 do
            DisableAllControlActions(i)
        end
        PointCamAtEntity(cam, ped, 0.0, 0.0, 0.0, true)
        SetCamFov(cam, GetCamFov(cam)-0.05)
        Wait(5)
    end
    RenderScriptCams(false, false, 0, true, false)
	FreezeEntityPosition(PlayerPedId(), false)
    DestroyCam(cam)
end)
RegisterNetEvent('questline_makki3:pratamedquest')
AddEventHandler('questline_makki3:pratamedquest', function()
 local cutsceneOver = GetGameTimer() + (1000 * 4)
    local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
	TriggerEvent('esx:showNotification', 'Hej jag heter Vanja Andersson trevligt att träffas.')
    SetCamCoord(cam, vector3(213.54, -914.11, 35.00))
    RenderScriptCams(1, 0, 0, 1, 1)

-- VIGESELRING QUEST
if vilketquest == 2 then
stuff.inMission = true
TriggerServerEvent('questline_makki3:samsungtid')
TriggerServerEvent('questline_makki3:hittavigselring')
 while cutsceneOver >= GetGameTimer() do
        for i = 0, 31 do
            DisableAllControlActions(i)
        end
        PointCamAtEntity(cam, ped, 0.0, 0.0, 0.0, true)
        SetCamFov(cam, GetCamFov(cam)-0.05)
        Wait(5)
    end
    RenderScriptCams(false, false, 0, true, false)
	FreezeEntityPosition(PlayerPedId(), false)
    DestroyCam(cam)
elseif vilketquest == 3 then
 while cutsceneOver >= GetGameTimer() do
        for i = 0, 31 do
            DisableAllControlActions(i)
        end
        PointCamAtEntity(cam, ped, 0.0, 0.0, 0.0, true) -- 
        SetCamFov(cam, GetCamFov(cam)-0.05)
        Wait(5)
    end
    RenderScriptCams(false, false, 0, true, false)
	FreezeEntityPosition(PlayerPedId(), false)
    DestroyCam(cam)
end

 local avloppos = nil
	local katthuvud = nil
	avloppcords = nil
	
avloppos = vector3(125.64, -1089.39, 28.18)
	   avloppcords = vector3(620.05, -1380.37, 10.18)
	   
local pedBlip = AddBlipForCoord(avloppcords)
	SetBlipColour(pedBlip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Avloppsutgång')
EndTextCommandSetBlipName(pedBlip)


--spawnar ringen när man är 10cm ifrån
local skattjakt = math.random(1,4)
		local skattjaktkoll = 0
         local slamsugen1 = false
		 local slamsugen2 = false
		 local slamsugen3 = false
		 local slamsugen4 = false
 while true do
        Citizen.Wait(1)
		local avloppletare1 = { x = 621.44, y = -1380.95, z = 9.21, h = 180.4409942627 }
		local avloppletare2 = { x = 632.04, y = -1411.97, z = 9.21, h = 180.4409942627 }
		local avloppletare3 = { x = 643.58, y = -1452.16, z = 9.21, h = 180.4409942627 }
		local avloppletare4 = { x = 652.97, y = -1491.66, z = 9.21, h = 180.4409942627 }
		
		local hittaavlopp = math.random(1,4)
		
	local plyCoords = GetEntityCoords(PlayerPedId(), 0)
        local distance1 = #(vector3(avloppletare1.x, avloppletare1.y, avloppletare1.z) - plyCoords)
		local distance2 = #(vector3(avloppletare2.x, avloppletare2.y, avloppletare2.z) - plyCoords)
		local distance3 = #(vector3(avloppletare3.x, avloppletare3.y, avloppletare3.z) - plyCoords)
		local distance4 = #(vector3(avloppletare4.x, avloppletare4.y, avloppletare4.z) - plyCoords)
				
		--POS1
        if distance1 < 10 then
		if slamsugen1 == false then
            DrawMarker(0, avloppletare1.x, avloppletare1.y, avloppletare1.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 1, 157, 0, 155, false, false, 2, false, false, false, false)
			DrawText3D(avloppletare1.x,avloppletare1.y,avloppletare1.z, '[E] för att leta')
                        if distance1 < 2 then
						if IsControlJustReleased(0, 54) then
						TriggerEvent('fsc_questline:goranim')
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen1 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta. ')
						TriggerEvent('fsc_questline:avslutaanim')
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						TriggerEvent('fsc_questline:avslutaanim')
						end						
						end
						end
			end
			end
			
			--POS2
if distance2 < 10 then
		if slamsugen2 == false then
            DrawMarker(0, avloppletare2.x, avloppletare2.y, avloppletare2.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 1, 157, 0, 155, false, false, 2, false, false, false, false)
			DrawText3D(avloppletare2.x,avloppletare2.y,avloppletare2.z, '[E] för att leta')
                        if distance2 < 2 then
						if IsControlJustReleased(0, 54) then
						TriggerEvent('fsc_questline:goranim')
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen2 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta.')
						TriggerEvent('fsc_questline:avslutaanim')
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						TriggerEvent('fsc_questline:avslutaanim')
						end						
						end
						end
			end
			end
 
          -- POS3
if distance3 < 10 then
		if slamsugen3 == false then
            DrawMarker(0, avloppletare3.x, avloppletare3.y, avloppletare3.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 1, 157, 0, 155, false, false, 2, false, false, false, false)
			DrawText3D(avloppletare3.x,avloppletare3.y,avloppletare3.z, '[E] för att leta')
                        if distance3 < 2 then
						if IsControlJustReleased(0, 54) then
						TriggerEvent('fsc_questline:goranim')
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen3 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta.')
						TriggerEvent('fsc_questline:avslutaanim')
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						TriggerEvent('fsc_questline:avslutaanim')
						end						
						end
						end
			end
			end
 
         --POS4
 if distance4 < 10 then
		if slamsugen4 == false then
            DrawMarker(0, avloppletare4.x, avloppletare4.y, avloppletare4.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 1, 157, 0, 155, false, false, 2, false, false, false, false)
			DrawText3D(avloppletare4.x,avloppletare4.y,avloppletare4.z, '[E] för att leta')
                        if distance4 < 2 then
						if IsControlJustReleased(0, 54) then
						TriggerEvent('fsc_questline:goranim')
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen4 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta.')
						TriggerEvent('fsc_questline:avslutaanim')
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						TriggerEvent('fsc_questline:avslutaanim')
						end						
						end
						end
			end
			end

end
end)

RegisterNetEvent('fsc_questline:goranim')
AddEventHandler('fsc_questline:goranim', function()
TaskStartScenarioInPlace(GetPlayerPed(-1), "world_human_gardener_plant", 0, false)
end)

--nya updaten
RegisterNetEvent('fsc_questline:avslutaanim')
AddEventHandler('fsc_questline:avslutaanim', function()
                ClearPedTasksImmediately()
				ClearPedTasks(PlayerPedId(-1))
				ClearPedSecondaryTask()
end)


	function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = 0.3
   
    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

createPed = function(hash, coords, heading)
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(5) end
    local peds = CreatePed(4, hash, coords, false, false)
	FreezeEntityPosition(peds, true)
    SetEntityHeading(peds, heading)
    SetEntityAsMissionEntity(peds, true, true)
    SetEntityInvincible(peds, true)
    SetPedHearingRange(peds, 0.0)
    SetPedSeeingRange(peds, 0.0)
    SetPedAlertness(peds, 0.0)
    SetBlockingOfNonTemporaryEvents(peds, true)
    SetPedCombatAttributes(peds, 46, true)
    SetPedFleeAttributes(peds, 0, 0)
    return peds
end

-- MADE BY MAKKIE & Abbezon AKA KYLVASKAN!
-- 2019-03-29 PROJECT DATE
-- 2020-08-16 LAST UPDATE
