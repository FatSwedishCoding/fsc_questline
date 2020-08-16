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


-- Quest Giver NYA UPDATEN VANJA
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
			stuff.inMission = false
	        stuff.hittatkatt = false
	        stuff.inlamnadkatt = false
			return
			end
			if stuff.hittatring then
			TriggerServerEvent('fsc_questline:klarring')
			stuff.inMission = false
	        stuff.hittatring = false			
			return
			end
			TriggerServerEvent('fsc_questline:linkustart')			
			end
			Wait(5)
			end
			Wait(5)
			end
end)


-- Quest Giver NYA UPDATEN Yngve
Citizen.CreateThread(function()
while not NetworkIsSessionStarted() do Wait(0) end
	-- Skapar Quest peden.
    ped3 = createPed(-2054645053, vector3(125.7, -1036.17, 29.28 -1), 70.56)
	local me = PlayerPedId()
	while true do
        local sleep = 200
        local distance = GetDistanceBetweenCoords(GetEntityCoords(me), GetEntityCoords(ped3))
        if distance > 3.0 then
            sleep = 200
			else
			sleep = 5
			 BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ Prata med %s'):format('Yngve Tugmotstånd'))
			 EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 38) then
			cutsceneOver = GetGameTimer() + (1000 * 4)
    local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
	SetCamRot(cam, 0.0, 0.0, 291.93)
	TriggerEvent('esx:showNotification', 'Hej jag heter Yngve, Älskar att laga mat men FYFAN vad jag hatar katter!')
    SetCamCoord(cam, vector3(121.27, -1037.04, 30.28))
    RenderScriptCams(1, 0, 0, 1, 1)
			if stuff.hittatkatt then
			TriggerServerEvent('fsc_questline:klarkatto')
			stuff.hittatkatt = false
	        stuff.hittatkatt = false
	        stuff.inlamnadkatt = false
			end
			TriggerEvent('fsc_questline:avbrytkamera')
			end
			Wait(5)
			end
			Wait(5)
			end
end)

-- lägger in ringarna och allt det nya versionen.
RegisterNetEvent('fsc_questline:ringpos')
AddEventHandler('fsc_questline:ringpos', function(avloppos, avloppcords, skattjakt,avloppletare1, avloppletare2,avloppletare3, avloppletare4)
stuff.inMission = true
local skattjaktkoll = 0 -- Client räknar hur många gånger du letat.

local pedBlip = AddBlipForCoord(avloppcords) -- till client
	SetBlipColour(pedBlip, 1) -- till client
	BeginTextCommandSetBlipName("STRING") -- till client
	AddTextComponentString('Avloppsutgång') -- till client
EndTextCommandSetBlipName(pedBlip) -- till client


local slamsugen1 = false -- CLIENT
local slamsugen2 = false -- CLIENT
local slamsugen3 = false -- CLIENT
local slamsugen4 = false -- CLIENT

TriggerEvent('fsc_questline:avbrytkamera')

while true do  -- till client
Citizen.Wait(1) -- till client
    local plyCoords = GetEntityCoords(PlayerPedId(), 0) -- till client

    local distance1 = #(vector3(avloppletare1.x, avloppletare1.y, avloppletare1.z) - plyCoords) -- till client
	local distance2 = #(vector3(avloppletare2.x, avloppletare2.y, avloppletare2.z) - plyCoords)-- till client
	local distance3 = #(vector3(avloppletare3.x, avloppletare3.y, avloppletare3.z) - plyCoords)-- till client
	local distance4 = #(vector3(avloppletare4.x, avloppletare4.y, avloppletare4.z) - plyCoords)-- till client

    --POS1
        if distance1 < 10 then
		if slamsugen1 == false then
		-- CLIENT
            DrawMarker(0, avloppletare1.x, avloppletare1.y, avloppletare1.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 1, 157, 0, 155, false, false, 2, false, false, false, false)
			-- CLIENT
			DrawText3D(avloppletare1.x,avloppletare1.y,avloppletare1.z, '[E] för att leta')
                        if distance1 < 2 then 
						if IsControlJustReleased(0, 54) then
						
						--TriggerEvent('questline_makki3:goranim')
						fsc_questline_goranim() -- nya function för göra anim.
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen1 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta. ')
						--TriggerEvent('questline_makki3:avslutaanim')
						fsc_questline_avslutanim()
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						--TriggerEvent('questline_makki3:avslutaanim')
						fsc_questline_avslutanim()
						end						
						end
						end
			end
			end
			
			if distance2 < 10 then
		if slamsugen2 == false then
            DrawMarker(0, avloppletare2.x, avloppletare2.y, avloppletare2.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 1, 157, 0, 155, false, false, 2, false, false, false, false)
			DrawText3D(avloppletare2.x,avloppletare2.y,avloppletare2.z, '[E] för att leta')
                        if distance2 < 2 then
						if IsControlJustReleased(0, 54) then
						fsc_questline_goranim()
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen2 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta.')
						fsc_questline_avslutanim()
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						fsc_questline_avslutanim()
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
						fsc_questline_goranim()
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen3 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta.')
						fsc_questline_avslutanim()
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						fsc_questline_avslutanim()
						end						
						end
						end
			end
			end
			
			if distance4 < 10 then
		if slamsugen4 == false then
            DrawMarker(0, avloppletare4.x, avloppletare4.y, avloppletare4.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 1, 157, 0, 155, false, false, 2, false, false, false, false)
			DrawText3D(avloppletare4.x,avloppletare4.y,avloppletare4.z, '[E] för att leta')
                        if distance4 < 2 then
						if IsControlJustReleased(0, 54) then
						fsc_questline_goranim()
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen4 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta.')
						fsc_questline_avslutanim()
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja.')
						fsc_questline_avslutanim()
						end						
						end
						end
			end
			end

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
-- här ska den ligga.

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


function fsc_questline_goranim()
TaskStartScenarioInPlace(GetPlayerPed(-1), "world_human_gardener_plant", 0, false)
end


--[[
RegisterNetEvent('fsc_questline:goranim')
AddEventHandler('fsc_questline:goranim', function()
TaskStartScenarioInPlace(GetPlayerPed(-1), "world_human_gardener_plant", 0, false)
end)
--]]
--nya updaten
function fsc_questline_avslutanim()
  ClearPedTasksImmediately()
  ClearPedTasks(PlayerPedId(-1))
  ClearPedSecondaryTask()
end

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
-- VERSION 1.2
-- 2019-03-29 PROJECT DATE
-- 2020-08-16 LAST UPDATE
