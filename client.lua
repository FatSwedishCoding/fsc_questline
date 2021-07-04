local ped = nil
ESX = nil
local kattenblipen = nil
local avloppblipen = nil
local stuff = {
    inMission = false,
	hittatkatt = false,
	spawnkatt = false,
	inlamnadkatt = false,
	hittatring = false,
	hittayngve = false,
	lamnatvara = false,
	vehicle = false,
	vehicle2 = false,
	hittayngvebil = false,
	ylabyrint = false,
	yval = false,
	
   flyglisa = false,
   motelisa = false,
   dammen = false,
   lisaval = false,
   dumpster = false,
   raddalisa = false,
   lamnavaska = false
	}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
-- Quest 4 NPC: Ulla.
Citizen.CreateThread(function()
while not NetworkIsSessionStarted() do Wait(0) end
	-- Skapar Quest peden.
    ped4 = createPed(-1656894598, vector3(-2291.08, 225.34, 166.60), 30.56)
	while true do
	local me = PlayerPedId()
        local sleep = 200
        local distance = GetDistanceBetweenCoords(GetEntityCoords(me), GetEntityCoords(ped4))
        if distance > 3.0 then
            sleep = 200
			else
			sleep = 5
			 BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ Prata med %s'):format('Ulla Skalpel'))
			 EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 38) then
			FreezeEntityPosition(PlayerPedId(), true)
			cutsceneOver = GetGameTimer() + (1000 * 4)
    local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
	SetCamRot(cam, 0.0, 0.0, 291.93)
	TriggerEvent('esx:showNotification', 'Hej jag heter Ulla, Jag väntar på någon här.')
    SetCamCoord(cam, vector3(-2291.0, 229.6884, 170.0))
	SetCamRot(cam, 0.0, 0.0, 180.0)
    RenderScriptCams(1, 0, 0, 1, 1)
	if stuff.ylabyrint then
	stuff.ylabyrint = false
	TriggerEvent('esx:showNotification', 'Du ser Yngve ha sex med Ulla, du står där och kollar i 5 min.')
	Wait(5000)
	TriggerEvent('esx:showNotification', 'Du blir påkommen av Ulla som blir helt röd i ansiktet.')
	Wait(5000)
	TriggerEvent('esx:showNotification', 'Yngve: Shit shit, min flickvän skickade dig va?')
	Wait(5000)
	TriggerEvent('esx:showNotification', 'Yngve: Snälla säg inget till henne så får du en fin belöning.')
	Wait(5000)
	TriggerEvent('esx:showNotification', 'Yngve: Kom ner till mig vid resturangen så betalar jag dig för din tystnad.')
	Wait(4000)
	TriggerEvent('esx:showNotification', 'Du har ett val att göra! prata med Vanja eller med Yngve.')
	stuff.yval = true
	Wait(15000)
	end
	
	Wait(2000)
			TriggerEvent('fsc_questline:avbrytkamera')
			end
			Wait(5)
			end
			Wait(5)
			end
end)

-- Quest Giver NYA UPDATEN VANJA
Citizen.CreateThread(function()
while not NetworkIsSessionStarted() do Wait(0) end
	-- Skapar Quest peden.
	
	
    ped2 = createPed(1146800212, vector3(242.61, -890.07, 30.49 -1), 32.17)
	Wait(1000)
	
	while true do
	local me = PlayerPedId()
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
			DisableAllControlActions(PlayerPedId())
			DisableControlAction(PlayerPedId(), INPUT_PICKUP, false)
						
			FreezeEntityPosition(PlayerPedId(), true)
			cutsceneOver = GetGameTimer() + (1000 * 4)
    local cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
	TriggerEvent('esx:showNotification', 'Hej jag heter Vanja Andersson trevligt att träffas.')
    SetCamCoord(cam, vector3(240.5, -895.53, 33.00))
    RenderScriptCams(1, 0, 0, 1, 1)
	        --TriggerServerEvent('fsc_questline:checkmate')
			--Quest 1: Inlämmning
			if stuff.hittatkatt then
			TriggerServerEvent('fsc_questline:klarkatt')
			TriggerEvent("animation:carry","crate01")
			stuff.inMission = false
	        stuff.hittatkatt = false
	        stuff.inlamnadkatt = false
			return
			end
			--Quest 2: inlämmnng
			if stuff.hittatring then
			TriggerServerEvent('fsc_questline:klarring')
			stuff.inMission = false
	        stuff.hittatring = false		
return			
			end
			--Quest 3: inlämmnng
			if stuff.lamnatvara then
			TriggerServerEvent('fsc_questline:klarrest')
			stuff.inMission = false
			stuff.hittayngve = true
	        stuff.lamnatvara = false
	        stuff.vehicle = false
			return
			end
			--Quest 4: Inlämmning
			if stuff.yval then
			 stuff.inMission = false
			 stuff.vehicle = false
			 stuff.hittayngvebil = false
			 stuff.ylabyrint = false
			 stuff.yval = false
			 TriggerServerEvent('fsc_questline:klarotrogen1')
			 return			 
			end		
	-- Quest 5 Prata med vanja för reward.
	if stuff.raddalisa then
    stuff.raddalisa = false
	stuff.inMission = false
	stuff.hittatkatt = false
	stuff.spawnkatt = false
	stuff.inlamnadkatt = false
	stuff.hittatring = false
	stuff.hittayngve = false
	stuff.lamnatvara = false
	stuff.vehicle = false
	stuff.vehicle2 = false
	stuff.hittayngvebil = false
	stuff.ylabyrint = false
	stuff.yval = false
    stuff.lyglisa = false
    stuff.motelisa = false
    stuff.dammen = false
    stuff.lisaval = false
    stuff.dumpster = false
    stuff.lamnavaska = false
	
	TriggerServerEvent('fsc_questline:klarmafia')
	return
	end
			--Wait(5000)
			TriggerServerEvent('fsc_questline:linkustart')
Wait(26000)			
			end
			Wait(5)
			end
			Wait(5)
			end
end)

-- Quest 3: NPC Yngve.
Citizen.CreateThread(function()
while not NetworkIsSessionStarted() do Wait(0) end
	-- Skapar Quest peden.
    ped3 = createPed(-2054645053, vector3(113.5275, -1037.933, 29.32 -1), 70.56)
	while true do
	local me = PlayerPedId()
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
    SetCamCoord(cam, vector3(113.36, -1038.25, 29.32))
    RenderScriptCams(1, 0, 0, 1, 1)
	-- Quest 1 Lämna katten.
			if stuff.hittatkatt then
			TriggerServerEvent('fsc_questline:klarkatto')
			TriggerEvent("animation:carry","crate01")
			
	stuff.hittatkatt = false
	stuff.inlamnadkatt = false		
	stuff.inMission = false
	stuff.hittatring = false
	stuff.hittayngve = false
	stuff.lamnatvara = false
	stuff.vehicle = false
	stuff.hittayngvebil = false
	stuff.ylabyrint = false
	stuff.yval = false
			
			end
			-- Quest 3 Start.
			if stuff.hittayngve then
			TriggerEvent('fsc_questline:avbrytkamera')
			stuff.hittayngve = false
			RemoveBlip(pedBlip3)
			TriggerServerEvent('fsc_questline:koravaror')
			
			local vehicleModel1
	        local vehiclename1
	vehicleModel1 = GetHashKey(Config.Vehicle.name)
	vehiclename1 = Config.Vehicle.label
	
    local vehicleModel = vehicleModel1
	local vehiclename = vehiclename1
	
    RequestModel(vehicleModel)
    while not HasModelLoaded(vehicleModel) do Wait(0) end
	local tpos = #Config.Vehicle.spawnlocations
    stuff.vehicle = CreateVehicle(vehicleModel, Config.Vehicle.spawnlocations[tpos].coords, Config.Vehicle.spawnlocations[tpos].heading, true, true)
    NetworkRegisterEntityAsNetworked(stuff.vehicle)
    SetVehicleNumberPlateText(stuff.vehicle, 'Resturang')
	Wait(4000)
	TaskWarpPedIntoVehicle(GetPlayerPed(-1), stuff.vehicle, -1)
			hemta()
			TriggerEvent('fsc_questline:avbrytkamera')
			end
			-- Quest 2 lämna Ringen.
			if stuff.hittatring then
			TriggerServerEvent('fsc_questline:klarringo')
			stuff.inMission = false
	        stuff.hittatring = false		
return			
			end
			-- Quest 4 Dark side otrogen.
    if stuff.yval then
			 stuff.inMission = false
			 stuff.vehicle = false
			 stuff.hittayngvebil = false
			 stuff.ylabyrint = true
			 stuff.yval = false
			 TriggerServerEvent('fsc_questline:klarotrogen2')			 
			return
			end
			
			-- Quest 5 Dark side hjälp Mafia.
			if stuff.lamnavaska then		
	stuff.inMission = false
	stuff.hittatkatt = false
	stuff.spawnkatt = false
	stuff.inlamnadkatt = false
	stuff.hittatring = false
	stuff.hittayngve = false
	stuff.lamnatvara = false
	stuff.vehicle = false
	stuff.vehicle2 = false
	stuff.hittayngvebil = false
	stuff.ylabyrint = false
	stuff.yval = false
    stuff.lyglisa = false
    stuff.motelisa = false
    stuff.dammen = false
    stuff.lisaval = false
    stuff.dumpster = false
    stuff.lamnavaska = false
	
	TriggerServerEvent('fsc_questline:klarmafia1')
	end
			
			TriggerEvent('fsc_questline:avbrytkamera')
			Wait(15000)
			end
			Wait(5)
			end
			Wait(5)
			end
end)

function hemta()
hemta1cords = vector3(-658.55, -892.09, 24.91)
hemta2cords = vector3(1233.24, -3230.07, 5.65)
hemta3cords = vector3(134.94, -1052.28, 29.41)
RemoveBlip(pedBlip)
local pedBlip = AddBlipForCoord(hemta1cords) -- till client
	SetBlipColour(pedBlip, 1) -- till client
	BeginTextCommandSetBlipName("STRING") -- till client
	AddTextComponentString('Chuckling') -- till client
EndTextCommandSetBlipName(pedBlip)

local quest1 = false -- CLIENT
local quest2 = true -- CLIENT
local quest3 = true -- CLIENT


while true do  -- till client
Citizen.Wait(1) -- till client
    local plyCoords = GetEntityCoords(PlayerPedId(), 0) -- till client

    local distance1 = #(vector3(hemta1cords.x, hemta1cords.y, hemta1cords.z) - plyCoords) -- till client
	local distance2 = #(vector3(hemta2cords.x, hemta2cords.y, hemta2cords.z) - plyCoords)-- till client
	local distance3 = #(vector3(hemta3cords.x, hemta3cords.y, hemta3cords.z) - plyCoords)-- till client

    --POS1
        if distance1 < 10 then
		if not quest1 then
		--quest2 = false
			DrawText3D(hemta1cords.x,hemta1cords.y,hemta1cords.z, '[E] för prata med kassören')
                        if distance1 < 2 then 
						if IsControlJustReleased(0, 54) then
						quest2 = false						
						quest1 = true
						FreezeEntityPosition(stuff.vehicle, true)
						TriggerEvent('esx:showNotification', 'Freda Foh Shen: Vad vill du beställa?')
						Wait(2000)
						TriggerEvent('esx:showNotification', 'You: Jag har en beställning från Yngve')
						Wait(2000)
						TriggerEvent('esx:showNotification', 'Freda Foh Shen: Ok , vi lastar in kycklingen nu')
						Wait(2000)
						TriggerEvent('esx:showNotification', 'Freda Foh Shen: And then! and then! and then!')
						FreezeEntityPosition(stuff.vehicle, false)
						
						RemoveBlip(pedBlip)
						pedBlip1 = AddBlipForCoord(hemta2cords) -- till client
	SetBlipColour(pedBlip1, 1) -- till client
	BeginTextCommandSetBlipName("STRING") -- till client
	AddTextComponentString('Kyckling Pickup') -- till client
EndTextCommandSetBlipName(pedBlip1) -- till client
						end
						end
			end
			end
			
			if distance2 < 10 then
		if not quest2 then
            DrawMarker(0, hemta2cords.x, hemta2cords.y, hemta2cords.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 1, 157, 0, 155, false, false, 2, false, false, false, false)
			DrawText3D(hemta2cords.x,hemta2cords.y,hemta2cords.z, '[E] för att prata med Sebastian Bäck')
                        if distance2 < 2 then
						if IsControlJustReleased(0, 54) then
						quest2 = true
						quest3 = false
						FreezeEntityPosition(stuff.vehicle, true)
						TriggerEvent('esx:showNotification', 'Sebastian Bäck: Hej vad gör du här på varvet?')
						Wait(2000)
						TriggerEvent('esx:showNotification', 'You: Jag har en beställning från Yngve')
						Wait(2000)
						TriggerEvent('esx:showNotification', 'Sebastian Bäck: Ok , vi lasta fisken i skufferten nu.')
						Wait(2000)
						TriggerEvent('esx:showNotification', 'Sebastian Bäck: Sådär klart åk tbx till resturangen! vi fiskare vill inte ha statsbor här!')
						FreezeEntityPosition(stuff.vehicle, false)
						RemoveBlip(pedBlip1)
						pedBlip1 = AddBlipForCoord(hemta3cords) -- till client
	SetBlipColour(pedBlip1, 1) -- till client
	BeginTextCommandSetBlipName("STRING") -- till client
	AddTextComponentString('Resturangen') -- till client
EndTextCommandSetBlipName(pedBlip1) -- till client
						end
						end
			end
			end
			if distance3 < 10 then
			if not quest3 then
			 DrawMarker(0, hemta3cords.x, hemta3cords.y, hemta3cords.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 1, 157, 0, 155, false, false, 2, false, false, false, false)
			DrawText3D(hemta3cords.x,hemta3cords.y,hemta3cords.z, '[E] för att lasta av allt')
			 if distance3 < 2 then
			 if IsControlJustReleased(0, 54) then
						quest3 = true
						FreezeEntityPosition(stuff.vehicle, true)
						TriggerEvent('esx:showNotification', 'Yngve Tugmotstånd: Lastar av allt nu')
						Wait(2000)
						TriggerEvent('esx:showNotification', 'Yngve Tugmotstånd: dra till vanja så kommer hon betala dig')
						Wait(2000)
						RemoveBlip(pedBlip1)
						DeleteEntity(stuff.vehicle)
						stuff.lamnatvara = true
						end
			end
			end
end
end
end

-- Quest 4: find Yngve
RegisterNetEvent('fsc_questline:findygnve')
AddEventHandler('fsc_questline:findygnve', function(yngvebilpos)
SetNewWaypoint(yngvebilpos)

pedBlip = AddBlipForCoord(yngvebilpos) -- till client
	SetBlipColour(pedBlip, 1) -- till client
	BeginTextCommandSetBlipName("STRING") -- till client
	AddTextComponentString('Yngve parkade bil.') -- till client
EndTextCommandSetBlipName(pedBlip) -- till client

TriggerEvent('fsc_questline:avbrytkamera')
followygnve(yngvebilpos)
end)

-- Quest 4: Follow Yngve
function followygnve(yngvebilpos1)
-- random what vehicle Yngve whould drive.

vehicleModel = GetHashKey("Burrito")
RequestModel(vehicleModel)
 while not HasModelLoaded(vehicleModel) do Wait(0) end
 
 while stuff.hittayngvebil == false do
  if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(yngvebilpos1), true) <= 40.5 then
  stuff.hittayngvebil = true
 stuff.vehicle = CreateVehicle(vehicleModel, vector3(44.21, -869.86, 30.47), 224, true, true)
    NetworkRegisterEntityAsNetworked(stuff.vehicle)
    SetVehicleDoorsLocked(stuff.vehicle, 4)
    SetVehicleDoorsLockedForAllPlayers(stuff.vehicle, true)
	TriggerEvent('esx:showNotification', 'Sms från Vanja: Följ efter Yngve bil, han får inte upptäcka dig!')
	RemoveBlip(pedBlip)
	Wait(4000)
	local hash = -2054645053
	RequestModel(hash)
	while not HasModelLoaded(hash) do Wait(5) end
    stuff.driver = CreatePedInsideVehicle(stuff.vehicle, 4, hash, -1, true, false)
    SetPedHearingRange(stuff.driver, 0.0)
    SetPedSeeingRange(stuff.driver, 0.0)
    SetPedAlertness(stuff.driver, 0.0)
    SetBlockingOfNonTemporaryEvents(stuff.driver, true)
	
	local parking = false
	local drivecords = vector3(-2312, 443.24, 174.04)
	TaskVehicleDriveToCoordLongrange(stuff.driver, stuff.vehicle, drivecords, 50.0, 387, 5)
    Wait(1500)
	while parking == false do
	if GetDistanceBetweenCoords(GetEntityCoords(stuff.vehicle), vector3(drivecords), true) <= 35.0 and not parking then
                            parking = true
                            ClearPedTasks(stuff.driver)
                            ClearPedSecondaryTask(stuff.driver)
							TaskVehiclePark(stuff.driver, stuff.vehicle, drivecords, 350, 0, 40.0, false)
							 TaskLeaveVehicle(stuff.driver, stuff.vehicle, 0)
							 TaskWanderInArea(stuff.driver, drivecords, 15.0, 5, 10)
							 Wait(5000)
							 DeleteEntity(stuff.vehicle)
							 DeleteEntity(stuff.driver)
							TriggerEvent('esx:showNotification', 'Sms från Vanja: följ efter Yngve in i labyrinten')
							stuff.ylabyrint = true
                        end
						Wait(5000)
						end
						
	end
	Wait(7000)
	end
end


-- Quest 5: hämta Lisa Lös
RegisterNetEvent('fsc_questline:hittalisa')
AddEventHandler('fsc_questline:hittalisa', function(lisapickpos)
SetNewWaypoint(lisapickpos)

pedBlip1 = AddBlipForCoord(lisapickpos) -- till client
	SetBlipColour(pedBlip1, 1) -- till client
	BeginTextCommandSetBlipName("STRING") -- till client
	AddTextComponentString('Lisa Lös hämtplats') -- till client
EndTextCommandSetBlipName(pedBlip1) -- till client

TriggerEvent('fsc_questline:avbrytkamera')
lisaibilen(lisapickpos)
end)


-- Quest 5: Lisa lös i bilen
function lisaibilen(lisapos)
 
 while stuff.flyglisa == false do
  if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(lisapos), true) <= 20.5 then
  if IsPedInAnyVehicle(PlayerPedId(), false) then
    print('Local player is in a vehicle!')
	local veh = GetVehiclePedIsIn(PlayerPedId(),false)
  stuff.flyglisa = true
	RemoveBlip(pedBlip1)
	--Wait(4000)
	local lisaspawn = vector3(-1038, -2742.27, 12.89)
	lisaped = createPed(1055701597,lisaspawn , 305.69)
	NetworkRegisterEntityAsNetworked(lisaped)
	SetEntityInvincible(lisaped, true)
	FreezeEntityPosition(lisaped, false)
	--TaskWanderInArea(lisaped, lisaspawn, 15.0, 5, 10)
    --SetBlockingOfNonTemporaryEvents(lisaped, true)
	--TaskEnterVehicle(lisaped, veh, 0, 0, 2)
	TaskEnterVehicle( lisaped, veh, 20000,0, 1.5, 1, 0)
	Wait(11000)
	TriggerEvent('esx:showNotification', 'Heej jag är Lisa Lös, Vanja sa att du skulle hämta mig och köra mig till mirror Park.')
	Wait(5000)
	TriggerEvent('esx:showNotification', 'Skulle möta upp Yngve där!')
	local mirrorlisapos = vector3(1275.607, -664.7005, 67.52308)
	-- blip på mappen
	pedBlip = AddBlipForCoord(mirrorlisapos) -- till client
	SetBlipColour(pedBlip, 1) -- till client
	BeginTextCommandSetBlipName("STRING") -- till client
	AddTextComponentString('Mirror Park Mötesplats') -- till client
EndTextCommandSetBlipName(pedBlip) -- till client
SetNewWaypoint(pedBlip) 
	
	SetNewWaypoint(mirrorlisapos)
	
	-- Quest 5 Kapitel 2.
	while stuff.motelisa == false do
	 if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(mirrorlisapos), true) <= 5.5 then
	  if IsPedInAnyVehicle(PlayerPedId(), false) then
    print('Local player is in a vehicle!')
	local veh = GetVehiclePedIsIn(PlayerPedId(),false)
	
	 stuff.motelisa = true
	 TriggerEvent('esx:showNotification', 'Vanja sa att Yngve skulle träffa oss här.')
	 TriggerEvent('esx:showNotification', 'Vi får vänta, stäng av motorn!')
	 FreezeEntityPosition(PlayerPedId(), true)
	 FreezeEntityPosition(veh, true)

  local ullapedo = -1656894598
  local bigbosso = -236444766
  local yngvepedo = -2054645053
  local model = -39239064
  
  local pos1 = vector3(1248.47, -721.65, 62.91)
  local pos2 = vector3(1278.357, -667.403, 67.21641)
  local pos3 = vector3(1276.608, -667.7755, 67.33725)
  local pos4 = vector3(1275.262, -661.7892, 67.6759)
  local pos5 = vector3(1277.957, -661.0521, 67.54631)
  local pos6 = vector3(1281.296, -660.6335, 67.26564)
  Wait(10)
  
  spawnModel(ullapedo)
  spawnModel(bigbosso)
  spawnModel(yngvepedo)
  spawnModel(model)

ullapeddo1 = createPed(ullapedo,pos1 , 13.12259)
bigbosso1 = createPed(bigbosso,pos1 , 13.12259)
yngvepeddo1 = createPed(yngvepedo,pos1 , 13.12259)

dealerGuard1 = createPed(model,pos1 , 13.12259)
dealerGuard2 = createPed(model,pos1 , 13.12259)
dealerGuard3 = createPed(model,pos1 , 13.12259)

FreezeEntityPosition(ullapeddo1, false)
FreezeEntityPosition(bigbosso1, false)
FreezeEntityPosition(yngvepeddo1, false)

FreezeEntityPosition(dealerGuard1, false)
FreezeEntityPosition(dealerGuard2, false)
FreezeEntityPosition(dealerGuard3, false)
  
  NetworkRegisterEntityAsNetworked(ullapeddo1)
  NetworkRegisterEntityAsNetworked(bigbosso1)
  NetworkRegisterEntityAsNetworked(yngvepeddo1)
  NetworkRegisterEntityAsNetworked(dealerGuard1)
  NetworkRegisterEntityAsNetworked(dealerGuard2)
  NetworkRegisterEntityAsNetworked(dealerGuard3)
  
  SetEntityInvincible(ullapeddo1, true)
  SetEntityInvincible(bigbosso1, true)
  SetEntityInvincible(yngvepeddo1, true)
  SetEntityInvincible(dealerGuard1, true)
  SetEntityInvincible(dealerGuard2, true)
  SetEntityInvincible(dealerGuard3, true)
  
  SetPedAsGroupLeader(bigbosso1, 5)
  SetPedAsGroupMember(ullapeddo1, 5)
  SetPedAsGroupMember(yngvepeddo1, 5)
  
  SetPedAsGroupMember(dealerGuard1, 5)
  SetPedAsGroupMember(dealerGuard2, 5)
  SetPedAsGroupMember(dealerGuard3, 5)
  --[[
  local vehcords = vector3(1039.801, -769.0615, 58.01515)
  local vehcords2 = vector3(1039.171, -775.2704, 58.01712)
  --]]
  -- GATAN
  local vehcords = vector3(1258.68, -749.15, 63.87)
  -- SANDEN
  local vehcords2 = vector3(1258.59, -727.67, 63.35)
  
  vehicleModel = GetHashKey("baller6")
RequestModel(vehicleModel)
 while not HasModelLoaded(vehicleModel) do Wait(0) end
 
  -- Skapa fordon för mafian.
  stuff.vehicle = CreateVehicle(vehicleModel, vehcords, 353.7898, true, true)
  stuff.vehicle2 = CreateVehicle(vehicleModel, vehcords2, 353.7898, true, true)
  
  -- sätter in NPC i bilarna.
  TaskWarpPedIntoVehicle(dealerGuard3,stuff.vehicle2 ,-1)
  TaskWarpPedIntoVehicle(yngvepeddo1,stuff.vehicle2 ,0)
  TaskWarpPedIntoVehicle(ullapeddo1,stuff.vehicle2 ,1)
  
   TaskWarpPedIntoVehicle(dealerGuard1,stuff.vehicle ,-1)
   TaskWarpPedIntoVehicle(bigbosso1,stuff.vehicle ,0)
   TaskWarpPedIntoVehicle(dealerGuard2,stuff.vehicle ,1)
   Wait(3000)
  
  TaskVehicleDriveToCoord(dealerGuard3, stuff.vehicle2,1276.14, -657.3371, 67.63313, 8.0, 0, GetHashKey("baller6"), 1074528293, 1.0, true)
  TaskVehicleDriveToCoord(dealerGuard1, stuff.vehicle,1300.96, -672.54, 67.54, 8.0, 0, GetHashKey("baller6"), 1074528293, 1.0, true)
  
  Wait(45000)
  TaskLeaveVehicle(yngvepeddo1, stuff.vehicle2, 64)
  TaskLeaveVehicle(ullapeddo1, stuff.vehicle2, 64)
  TaskLeaveVehicle(bigbosso1, stuff.vehicle, 64)
  
  DeleteEntity(dealerGuard1)
  TaskLeaveVehicle(dealerGuard2, stuff.vehicle, 64)
  TaskLeaveVehicle(dealerGuard3, stuff.vehicle2, 64)
  Wait(800)
  GiveWeaponToPed(dealerGuard1, "weapon_assaultrifle", 2800, true, true)
  GiveWeaponToPed(dealerGuard2, "weapon_assaultrifle", 2800, true, true)
  GiveWeaponToPed(dealerGuard3, "weapon_assaultrifle", 2800, true, true)
  
  GiveWeaponToPed(yngvepeddo1, "weapon_assaultrifle", 2800, true, true)
  GiveWeaponToPed(ullapeddo1, "weapon_assaultrifle", 2800, true, true)
  GiveWeaponToPed(bigbosso1, "weapon_assaultrifle", 2800, true, true)
  
  TaskGoToCoordAnyMeans(dealerGuard1,pos1, 1.0, 0, 0, 786603, 0xbf800000)
  TaskGoToCoordAnyMeans(dealerGuard2, pos2, 1.0, 0, 0, 786603, 0xbf800000)
  TaskGoToCoordAnyMeans(dealerGuard3,pos4, 1.0, 0, 0, 786603, 0xbf800000)
  
  TaskGoToCoordAnyMeans(yngvepeddo1,pos5, 1.0, 0, 0, 786603, 0xbf800000)
  TaskGoToCoordAnyMeans(ullapeddo1, pos6, 1.0, 0, 0, 786603, 0xbf800000)
  TaskGoToCoordAnyMeans(bigbosso1, pos3, 1.0, 0, 0, 786603, 0xbf800000)
  Wait(22000)
  SetEntityHeading(bigbosso1, 42.177)
  SetEntityHeading(dealerGuard3, 24)
  SetEntityHeading(dealerGuard1, 109.86)
  SetEntityHeading(boss, 339)
  
  TriggerEvent('esx:showNotification', 'Big Boss Man: UT UR BIL FLICKA I PASSAGERARSÄTET!')
  Wait(2000)
  TriggerEvent('esx:showNotification', 'Big Boss Man: Du ska med oss!!')
  Wait(2000)
  local veh2 = GetVehiclePedIsIn(lisaped,false)
  
  TriggerEvent('esx:showNotification', 'Lisa Lös: Oook, men låt föraren vara, hen är oskyldig.')
  Wait(2000)
  TriggerEvent('esx:showNotification', 'Big Boss Man: Sätt dig bak i bilen bakom mig nu!.')
  Wait(2000)
  TaskEnterVehicle(lisaped, stuff.vehicle, -1, 2, 1.0001, 1)
  TaskEnterVehicle(dealerGuard2, stuff.vehicle, -1, 1, 1.0001, 1)
  Wait(12000)
   TriggerEvent('esx:showNotification', 'Big Boss Man: Om du vill tjäna pengar så bara att kontakta oss.')
   Wait(4000)
   
  TaskEnterVehicle(bigbosso1, stuff.vehicle, -1, -1, 1.0001, 1)
  --TaskEnterVehicle(dealerGuard1, stuff.vehicle, 0, -1, 1.0001, 1)
  
  TaskEnterVehicle(yngvepeddo1, stuff.vehicle2, -1, 0, 1.0001, 1)
  TaskEnterVehicle(ullapeddo1, stuff.vehicle2, -1, 1, 1.0001, 1)
  TaskEnterVehicle(dealerGuard3, stuff.vehicle2, -1, -1, 1.0001, 1)
  Wait(18000)
  TaskVehicleDriveToCoord(dealerGuard3, stuff.vehicle2,1015.863, -770.5566, 57.38231, 8.0, 0, GetHashKey("baller6"), 1074528293, 1.0, true)
  TaskVehicleDriveToCoord(bigbosso1, stuff.vehicle,1029.764, -788.0691, 57.35344, 8.0, 0, GetHashKey("baller6"), 1074528293, 1.0, true)
  Wait(15000)
  DeleteEntity(lisaped)
  DeleteEntity(stuff.vehicle)
  DeleteEntity(stuff.vehicle2)
  DeleteEntity(bigbosso1)
  DeleteEntity(yngvepeddo1)
  DeleteEntity(ullapeddo1)
  DeleteEntity(dealerGuard1)
  DeleteEntity(dealerGuard2)
  DeleteEntity(dealerGuard3)
  FreezeEntityPosition(PlayerPedId(), false)
	 FreezeEntityPosition(veh, false)
  
  RemoveBlip(pedBlip)
  TriggerEvent('esx:showNotification', 'Vanja SMS: Hej, Yngve ringde och sa att Lisa blivit kidnappad och de kräver 10 miljoner kr för henne.')
  Wait(4000)
  TriggerEvent('esx:showNotification', 'Yngve tycker mina föreldrar kan hjälpa till och betala, då hans företag inte går så bra. ')
  Wait(4000)
  TriggerEvent('esx:showNotification', 'Hon är min bästa vän typ, men innan kan du åka till Dammen,')
  Wait(4000)
  TriggerEvent('esx:showNotification', 'Hört rykten på stan att det är en vanlig kidnappning plats.')
  Wait(4000)
  local dammenpos = vector3(1659.51, 1.6, 173.77)
  -- blip på mappen
	pedBlip = AddBlipForCoord(dammenpos) -- till client
	SetBlipColour(pedBlip, 1) -- till client
	BeginTextCommandSetBlipName("STRING") -- till client
	AddTextComponentString('Mördardammen') -- till client
EndTextCommandSetBlipName(pedBlip) -- till client
 SetNewWaypoint(dammenpos) 
  
  while stuff.dammen == false do
	 if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(dammenpos), true) <= 5.5 then
	 stuff.dammen = true
	 RemoveBlip(pedBlip)
	 Wait(2000)
	 TriggerEvent('esx:showNotification', 'Kolla runt i området efter Lisa Lös!')
	 Wait(2000)
	 TriggerEvent('esx:showNotification', 'Du kan även välja vem du vill hjälpa.')
	 local lisakid = vector3(1665.8, 1.12, 165.12)
	 local guard1pos = vector3(1664.79, -9.78, 165.56)
	 local guard2pos = vector3(1660.8, -11.64, 169.02)
	 
  lisaped = createPed(1055701597,lisakid , 115)
  dealerGuard1 = createPed(model,guard2pos , 13.12259)
  dealerGuard2 = createPed(model,guard1pos , 13.12259)
  
   GiveWeaponToPed(dealerGuard1, "weapon_assaultrifle", 2800, true, true)
  GiveWeaponToPed(dealerGuard2, "weapon_assaultrifle", 2800, true, true)
  
	NetworkRegisterEntityAsNetworked(dealerGuard1)
	SetEntityInvincible(dealerGuard1, true)
	FreezeEntityPosition(dealerGuard1, false)
	
	NetworkRegisterEntityAsNetworked(dealerGuard2)
	SetEntityInvincible(dealerGuard2, true)
	FreezeEntityPosition(dealerGuard2, false)
	
	 SetEntityHeading(dealerGuard2, 120)
  SetEntityHeading(dealerGuard1, 120)
	
	NetworkRegisterEntityAsNetworked(lisaped)
	SetEntityInvincible(lisaped, true)
	FreezeEntityPosition(lisaped, false)
  
  while not stuff.lisaval do
	 if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(lisakid), true) <= 3.5 then
	 
	 BeginTextCommandDisplayHelp('STRING')
     AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ Ta av repet för händerna %s'):format('Lisa Lös'))
	 EndTextCommandDisplayHelp(0, false, true, -1)
     if IsControlJustReleased(0, 38) then
	 RemoveBlip(pedBlip)
	   stuff.lisaval = true
	   local pos1 = vector3(1667.31, 63.51, 171.86)
	   TriggerEvent('esx:showNotification', 'Du: Ta bakvägen och spring ner till öst östra motorvägen!')
	   Wait(4000)
	   stuff.raddalisa = true
	   TriggerEvent('esx:showNotification', 'Åk ner till Vanja och säg att du räddade Lisa Lös.')
	   
	   TaskGoToCoordAnyMeans(lisaped,pos1, 1.0, 0, 0, 786603, 0xbf800000) 
	   Wait(10000)
	   DeleteEntity(lisaped)
  DeleteEntity(dealerGuard1)
  DeleteEntity(dealerGuard2)
  end
  end
  
   if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(guard1pos), true) <= 3.5 then
	 
	 BeginTextCommandDisplayHelp('STRING')
     AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ Prata med Vakten %s'):format('Vakten'))
	 EndTextCommandDisplayHelp(0, false, true, -1)
     if IsControlJustReleased(0, 38) then
	 RemoveBlip(pedBlip)
	   stuff.lisaval = true
	   TriggerEvent('esx:showNotification', 'Du: Hej jag vill hjälpa er, jag tycker Lisa är en slampa.')
	   Wait(4000)
	   TriggerEvent('esx:showNotification', 'Vakten: Ok, aa boss sa något om det,')
	   Wait(4000)
	   TriggerEvent('esx:showNotification', 'Vakten: åka och hämta pengarna och lämna de till yngve.')
	   Wait(4000)
	   TriggerEvent('esx:showNotification', 'Vakten: Pengarna ligger i en sopptuna gömd, skickar GPS.')   
	   fsc_questline_dumpster()
  end
  end
  Wait(5)
  end 
	 end
	 Wait(1000)
	 end
  else
	TriggerEvent('esx:showNotification', 'Du måste ha sitta i ett fordon.')
	 end
	 end
	 Wait(5000)	
	end
	else
	TriggerEvent('esx:showNotification', 'Du måste ha ett fordon för att hämta upp Lisa Lös.')
	Wait(5000)
	end
    Wait(1500)					
	end
	Wait(7000)
	end
end
-- DEV MODE, för att hoppa i koden för DEV.
RegisterNetEvent('fsc_questline:1337')
AddEventHandler('fsc_questline:1337', function()
fsc_questline_dumpster()
end
)

--Quest 5 Mafia way Dumpster ONDA VALET!
function fsc_questline_dumpster()
   local dumpster = vector3(-43.86, -1285.63, 29.09)
	   
	    -- blip på mappen
	pedBlip = AddBlipForCoord(dumpster) -- till client
	SetBlipColour(pedBlip, 1) -- till client
	BeginTextCommandSetBlipName("STRING") -- till client
	AddTextComponentString('Dumpster') -- till client
EndTextCommandSetBlipName(pedBlip) -- till client
 SetNewWaypoint(dumpster)
 
 while stuff.dumpster == false do
  if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(dumpster), true) <= 2.5 then
   BeginTextCommandDisplayHelp('STRING')
     AddTextComponentSubstringPlayerName(('~INPUT_CONTEXT~ Leta i sopptunnan efter  väskan med pengar.%s'):format(''))
	 EndTextCommandDisplayHelp(0, false, true, -1)
     if IsControlJustReleased(0, 38) then
	 stuff.dumpster = true
	 TriggerEvent('esx:showNotification', 'Du hittade väskan, lämna den till Yngve dirrekt.')
	 DeleteEntity(lisaped)
  DeleteEntity(dealerGuard1)
  DeleteEntity(dealerGuard2)
	 RemoveBlip(pedBlip)
	 stuff.lamnavaska = true
  end
end
Wait(5)
end
end

-- Quest 2: lägger in ringarna och allt.
RegisterNetEvent('fsc_questline:ringpos')
AddEventHandler('fsc_questline:ringpos', function(avloppos, avloppcords, skattjakt,avloppletare1, avloppletare2,avloppletare3, avloppletare4)
stuff.inMission = true
local skattjaktkoll = 0 -- Client räknar hur många gånger du letat.

SetNewWaypoint(avloppcords)

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
						
						fsc_questline_goranim() -- nya function för göra anim.
						Wait(4000)
						skattjaktkoll = skattjaktkoll + 1
						if skattjaktkoll < skattjakt then
						slamsugen1 = true
						TriggerEvent('esx:showNotification', 'Du hittade inget i avföringen, fortsätt leta. ')
						fsc_questline_avslutanim()
						else
						slamsugen1 = true
						slamsugen2 = true
						slamsugen3 = true
						slamsugen4 = true
						stuff.hittatring = true
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja eller Yngve.')
						RemoveBlip(pedBlip)
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
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja eller Yngve.')
						RemoveBlip(pedBlip)
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
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja eller Yngve.')
						RemoveBlip(pedBlip)
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
						TriggerEvent('esx:showNotification', 'Du hittade Vigselringen, lämna tillbaka den till Vanja eller Yngve.')
						RemoveBlip(pedBlip)
						fsc_questline_avslutanim()
						end						
						end
						end
			end
			end

end
end)

-- lägger in quest3 körning pos nya version!
RegisterNetEvent('fsc_questline:yngvepos')
AddEventHandler('fsc_questline:yngvepos', function(restpos)
stuff.inMission = true
stuff.hittayngve = true
TriggerEvent('fsc_questline:avbrytkamera')

pedBlip3 = AddBlipForCoord(restpos)
	SetBlipColour(pedBlip3, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Yngves Jobb')
EndTextCommandSetBlipName(pedBlip3)
SetNewWaypoint(113.5275, -1037.933)
end)

--lägger in katten och allt det. nya versionen!
RegisterNetEvent('fsc_questline:kattpos')
AddEventHandler('fsc_questline:kattpos', function(pos, cords)
stuff.inMission = true
    TriggerEvent('fsc_questline:avbrytkamera')
	
	--Sätter gps
	--local pedBlip = AddBlipForEntity(ped)
	SetNewWaypoint(cords)
	local pedBlip = AddBlipForCoord(cords)
	SetBlipColour(pedBlip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Babsans GPS')
EndTextCommandSetBlipName(pedBlip)

-- kollar om mission är igång, 
	 while stuff.inMission do
	 if not stuff.hittatkatt then
	if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(pos), true) <= 40.5 then
	if not stuff.spawnkatt then
	stuff.spawnkatt = true
	kattped = createPed(1462895032, pos, 305.69)
	NetworkRegisterEntityAsNetworked(kattped)
	FreezeEntityPosition(kattped, true)
	TriggerEvent('esx:showNotification', 'Katt har landat på månen.')
	end
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

function SpawnDealerCar1()
  ESX.Game.SpawnVehicle('baller6', {  
    x = 1042.298,
    y = -783.1595,
    z = 58.003
    }, 16.7, function(vehicle)
    SetVehicleModKit(vehicle, 0)
    SetVehicleLivery(vehicle, 0)
    dealerVehicle1 = vehicle
  end)
end

function SpawnDealerCar2()
  ESX.Game.SpawnVehicle('baller6', {
    x = 1041.042,
    y = -773.8267,
    z = 58.0224
    }, 355.9199, function(vehicle)
    SetVehicleModKit(vehicle, 0)
    SetVehicleLivery(vehicle, 0)
    dealerVehicle2 = vehicle
  end)
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

function spawnModel(model)
  RequestModel(model)            
  while not HasModelLoaded(model) do
    Citizen.Wait(1)
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

-- MADE BY Marcusf1993 AKA Makki3
-- VERSION 1.5
-- 2019-03-29 PROJECT DATE
-- 2021-07-04 LAST UPDATE
