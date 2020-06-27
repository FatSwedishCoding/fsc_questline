local ped = nil
ESX = nil
local kattenblipen = nil
local avloppblipen = nil
local vilketquest = nil
local stuff = {
    inMission = false,
	cd = false,
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

-- Quest Giver
Citizen.CreateThread(function()

    while not NetworkIsSessionStarted() do Wait(0) end
	-- Skapar Quest peden.
    ped = createPed(1146800212, vector3(212.92, -914.8, 29.69), 305.69)
    FreezeEntityPosition(ped, true)
	 while true do
        local me = PlayerPedId()
        local sleep = 200
        local distance = GetDistanceBetweenCoords(GetEntityCoords(me), GetEntityCoords(ped))
        if distance > 2.5 then
            sleep = 200
        else
            sleep = 5
            BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ Prata med %s'):format('Vanja Andersson'))
            EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 38) then
			
			-- när man lämnar katten till Vanja.
			if stuff.inlamnadkatt == true then
if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(ped), false) <= 2.0 then
	 BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ lämna tillbaka %s'):format('Babsan'))
            EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 38) then
                sleep = 500
				local cutsceneOver = GetGameTimer() + (1000 * 4)
    local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
	
	TriggerServerEvent('questline_makki3:klarkatt')
	TriggerEvent('destroycarryObject')
	ClearPedTasksImmediately(GetPlayerPed(-1))
    SetCamCoord(cam, vector3(213.54, -914.11, 35.00))
    RenderScriptCams(1, 0, 0, 1, 1)
	while cutsceneOver >= GetGameTimer() do
        for i = 0, 31 do
            DisableAllControlActions(i)
        end
        PointCamAtEntity(cam, ped, 0.0, 0.0, 0.0, true)
        SetCamFov(cam, GetCamFov(cam)-0.05)
        Wait(5)
    end
    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(cam)
	TriggerEvent("animation:carry","crate01")
				stuff.inlamnadkatt = false
				stuff.inMission = false
				stuff.cd = true
				vilketquest = nil
				sleep = 500
end
end
end
-- katt quest slut

-- TriggerServerEvent('questline_makki3:kollacd')

			-- Kollar om ringen är hittad för att återlämna den.		
    if stuff.hittatring == true then
    stuff.hittatring = false
    local cutsceneOver = GetGameTimer() + (1000 * 4)
    local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
	 SetCamCoord(cam, vector3(213.54, -914.11, 35.00))
    RenderScriptCams(1, 0, 0, 1, 1)
	TriggerServerEvent('questline_makki3:klarring')
	
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
	stuff.inMission = false
	stuff.cd = true
	vilketquest = nil
	return
	end
	-- Ring slut
	
--kollar databasen efter tiden
ESX.TriggerServerCallback('questline_makki3:kollacd', function(cooldown)
if cooldown == false then
stuff.inMission = false
stuff.cd = false
else
stuff.inMission = true
stuff.cd = true
end
end)
Wait(500)
			-- Kollar om mission är gjort redan.
			if stuff.inMission == false and stuff.cd == false then						
                sleep = 500
TriggerEvent('questline_makki3:pratamedquest')
else
local cutsceneOver = GetGameTimer() + (1000 * 4)
    local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
	 SetCamCoord(cam, vector3(213.54, -914.11, 35.00))
    RenderScriptCams(1, 0, 0, 1, 1)
	
	TriggerEvent('esx:showNotification', 'Hej tack för hjälpen förut, just nu är allt fin fint. ha det gött hej.')
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
end
            end
        end
        Wait(sleep)
    end
	end)

RegisterNetEvent('questline_makki3:pratamedquest')
AddEventHandler('questline_makki3:pratamedquest', function()
 local cutsceneOver = GetGameTimer() + (1000 * 4)
    local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
	TriggerEvent('esx:showNotification', 'Hej jag heter Vanja Andersson trevligt att träffas.')
    SetCamCoord(cam, vector3(213.54, -914.11, 35.00))
    RenderScriptCams(1, 0, 0, 1, 1)
vilketquest = math.random(1,2)
-- LETA KATT QUEST
-- SKAPA KATTEN
if vilketquest == 1 then
stuff.inMission = true
stuff.cd = true
     TriggerServerEvent('questline_makki3:samsungtid')  
     TriggerServerEvent('questline_makki3:letakatt')
	local kattpos = nil
	local katthuvud = nil
	kattcords = nil
	
	local kattmatblandare = math.random(1,2)	
	   if kattmatblandare  == 1 then
	   kattpos = vector3(125.64, -1089.39, 28.18)
	   kattcords = vector3(150.2, -1057.77, 28.18)
	   
	   elseif kattmatblandare == 2 then
	   kattpos = vector3(-508.41, -1743.5, 19.14)
	   kattcords = vector3(-511.84, -1715.62, 19.32)
	   end	   
	   ped1 = createPed(1462895032, kattpos, 305.69)
	   FreezeEntityPosition(PlayerPedId(), true)
	NetworkRegisterEntityAsNetworked(ped1)	
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
	--Sätter gps
	--local pedBlip = AddBlipForEntity(ped)
	local pedBlip = AddBlipForCoord(kattcords)
	SetBlipColour(pedBlip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Babsans GPS')
EndTextCommandSetBlipName(pedBlip)  
	--TriggerServerEvent('questline_makki3:kattBlip1', GetEntityCoords(pedBlip))
	
	-- kollar om mission är igång, 
	 while stuff.inMission do
	 if not stuff.hittatkatt then
	if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(ped1), false) <= 2.0 then
	 BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ Plocka upp %s'):format('Babsan'))
            EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 38) then
                sleep = 500
				TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_KNEEL", 0, false)
				Wait(5000)
				  TriggerEvent('questline_makki3:avslutaanim')
				stuff.hittatkatt = true
				stuff.inlamnadkatt = true
				DeleteEntity(ped1)
				TriggerEvent("animation:carry","crate01")
				RemoveBlip(pedBlip)
				TriggerEvent('esx:showNotification', 'Du har hittat Babsan, lämna tillbaka henne till Vanja.')
				return
end
end
else
end
Wait(5)
end
-- hittat katten, bara att lämna in kvar

-- VIGESELRING QUEST
elseif vilketquest == 2 then
stuff.inMission = true
stuff.cd = true
-- Sätter cd i databasen
TriggerServerEvent('questline_makki3:samsungtid')
TriggerServerEvent('questline_makki3:hittavigselring')
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
	   
local avloppBlip = AddBlipForCoord(avloppcords)
	SetBlipColour(avloppBlip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Avloppsutgång')
EndTextCommandSetBlipName(avloppBlip)

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
						TriggerEvent('questline_makki3:goranim')
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen1 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta. ')
						TriggerEvent('questline_makki3:avslutaanim')
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						TriggerEvent('questline_makki3:avslutaanim')
						RemoveBlip(avloppBlip)
						return
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
						TriggerEvent('questline_makki3:goranim')
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen2 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta.')
						TriggerEvent('questline_makki3:avslutaanim')
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						TriggerEvent('questline_makki3:avslutaanim')
						RemoveBlip(avloppBlip)
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
						TriggerEvent('questline_makki3:goranim')
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen3 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta.')
						TriggerEvent('questline_makki3:avslutaanim')
						return
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						TriggerEvent('questline_makki3:avslutaanim')
						RemoveBlip(avloppBlip)
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
						TriggerEvent('questline_makki3:goranim')
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen4 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta.')
						TriggerEvent('questline_makki3:avslutaanim')
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						TriggerEvent('questline_makki3:avslutaanim')
						RemoveBlip(avloppBlip)
						end						
						end
						end
			end
			end
end
end)

RegisterNetEvent('questline_makki3:kattBlip')
AddEventHandler('questline_makki3:kattBlip', function(coords)
    if not DoesBlipExist(kattenblipen) then
        kattenblipen = AddBlipForCoord(coords, coords.x, coords.y, coords.z)
        
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('kattgps')
        EndTextCommandSetBlipName(kattenblipen)
    else
        SetBlipCoords(kattenblipen, coords.x, coords.y, coords.z)
    end
end)
--göra leta i bajs anim
RegisterNetEvent('questline_makki3:goranim')
AddEventHandler('questline_makki3:goranim', function()
TaskStartScenarioInPlace(GetPlayerPed(-1), "world_human_gardener_plant", 0, false)
end)

RegisterNetEvent('questline_makki3:avslutaanim')
AddEventHandler('questline_makki3:avslutaanim', function()
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

-- Mall för att skapa NPCER i samma script.
createPed = function(hash, coords, heading)
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(5) end
    local peds = CreatePed(4, hash, coords, false, false)
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

-- First Release
-- 2019-03-04
-- Last update
-- 2020-04-15
