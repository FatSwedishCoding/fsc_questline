ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler( "playerConnecting", function(name)
	local identifier = GetPlayerIdentifiers(source)[1]
local currentLocalTime = (("%02d-%02d-%02d %02d:%02d:%02d"):format(0000, 00, 00, 00, 00,00 ))
	local result = MySQL.Sync.fetchScalar("SELECT * FROM questline WHERE identifier = @identifier", {['@identifier'] = identifier})
	if not result then
		MySQL.Sync.execute("INSERT INTO questline (`identifier`, `autotid`) VALUES (@identifier, @timeleft)",{['@identifier'] = identifier, ['timeleft'] = currentLocalTime})
    print('JAG LA TILL')
	print('JAG LA TILL')
	print('JAG LA TILL')
	print('JAG LA TILL')
	end
end)
----
-----

-----
RegisterServerEvent('fsc_questline:linkustart')
AddEventHandler('fsc_questline:linkustart', function()
fsc_kollacd()
end)


-- test!
function fsc_kollacd()
local date = os.date('*t')
local data = false
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local identifier = GetPlayerIdentifiers(source)[1]
local result = MySQL.Sync.fetchScalar("SELECT autotid FROM questline WHERE identifier = @identifier", {['@identifier'] = identifier})
local currentLocalTime = (("%02d-%02d-%02d %02d:%02d:%02d"):format(date.year, date.month, date.day, date.hour, date.min,date.sec ))
if result < currentLocalTime then
data = false
-- för att randomera questet,
fsc_randomquest(_source)
-- sätter 3h cd.
fsc_sattcd(_source)
else
data = true
TriggerClientEvent('esx:showNotification', _source,'Hej tack för hjälpen förut, just nu är allt fin fint. ha det gött hej.')
TriggerClientEvent('fsc_questline:avbrytkamera',_source)
return
end
end

--nya sattcd
function fsc_sattcd(source)
local date = os.date('*t')
local time = os.time()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local identifier = GetPlayerIdentifiers(source)[1]

local day = date.day
local hour = date.hour + 3
if hour > 24 then
day = date.day + 1
hour = 0
end

local currentLocalTime = (("%02d-%02d-%02d %02d:%02d:%02d"):format(date.year,date.month,day,hour, date.min, date.sec))


MySQL.Async.execute("UPDATE questline SET autotid =@carthiefv2 WHERE identifier=@identifier", {['@identifier'] = identifier, ['@carthiefv2'] = currentLocalTime})
end

function fsc_randomquest(source)
local _source = source
local q = math.random(1,4)
print(q)
if q == 1 then
fsc_letakatt(_source)
elseif q == 2 then
fsc_letaring(_source)
elseif q == 3 then
fsc_korakaffe(source)
elseif q == 4 then
fsc_korakaffe(source)
else
end
end

-- updrag 3, köra lastbil med kaffe till olika affärer
function fsc_korakaffe(source)
local _source = source
TriggerClientEvent('esx:showNotification', _source,'Min kompis Yngve Tugmotstånd behöver hjälp,')
Wait(2000)
TriggerClientEvent('esx:showNotification', _source,'han ger dig mer info, skicka kordinater via google maps')
restpos = vector3(120.63, -1036.31, 29.28)
TriggerClientEvent('fsc_questline:yngvepos',_source, restpos)
end

RegisterServerEvent('fsc_questline:koravaror')
AddEventHandler('fsc_questline:koravaror', function()
local _source = source
TriggerClientEvent('esx:showNotification', _source,'Hej vad bra att vanja skickade efter dig,')
Wait(2000)
TriggerClientEvent('esx:showNotification', _source,'Du behöver hämta lite varor åt resturangen,')
Wait(2000)
TriggerClientEvent('esx:showNotification', _source,'allt är förbeställt du behöver bara åka dit,')
Wait(2000)
TriggerClientEvent('esx:showNotification', _source,'Står en skåpbil på baksidan du kan använda.')
Wait(2000)
TriggerClientEvent('esx:showNotification', _source,'Sickar dig Kordinaterna på Google Maps.')

end)
-- Första konv om sin katt. NYA UPDATEN
function fsc_letakatt(source)
local _source = source
TriggerClientEvent('esx:showNotification', _source,'jag har tappat bort min katt, om du hittar henne så skulle du vara jätte snell katt.')
local kattmatblandare = math.random(1,2)
if kattmatblandare  == 1 then
	   kattpos = vector3(125.64, -1089.39, 28.18)
	   kattcords = vector3(150.2, -1057.77, 28.18)	   
	   elseif kattmatblandare == 2 then
	   kattpos = vector3(-508.41, -1743.5, 19.14)
	   kattcords = vector3(-511.84, -1715.62, 19.32)
	   end
TriggerClientEvent('fsc_questline:kattpos',_source, kattpos, kattcords)
end

-- Reward till kattquestet. NYA UPDATEN
RegisterServerEvent('fsc_questline:klarkatt')
AddEventHandler('fsc_questline:klarkatt', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(600,800)
    xPlayer.addMoney(randomMoney)
	TriggerClientEvent('esx:showNotification', src, 'Tack så himla mycket för ni hittade Babsan.')
	Wait(2000)
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	TriggerClientEvent('fsc_questline:avbrytkamera',src)
end)

-- Reward till kattquestet. NYA UPDATEN ONDA SIDAN
RegisterServerEvent('fsc_questline:klarkatto')
AddEventHandler('fsc_questline:klarkatto', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(400,1000)
    xPlayer.addMoney(randomMoney)
	TriggerClientEvent('esx:showNotification', src, 'O jävlar en katt. tack så mycket, här får du lite kompesation för den. säg inte till någon.')
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	TriggerClientEvent('fsc_questline:avbrytkamera', src)
end)

-- LETA RINGEN!
function fsc_letaring(source)
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
TriggerClientEvent('esx:showNotification', _source,'Hej, Igår när jag var på toa, så slank min vigsel ring ner i toaletten skulle du kunna leta rätt på den så lovar jag att jag gör vad som helst.')
local avloppos = nil
local avloppcords = nil

avloppos = vector3(125.64, -1089.39, 28.18)
avloppcords = vector3(620.05, -1380.37, 10.18)

local skattjakt = math.random(1,4) -- slump på hur många gånger du behöver leta.
local hittaavlopp = math.random(1,4)

local skattjaktkoll = 0 -- Client räknar hur många gånger du letat.
    local slamsugen1 = false -- CLIENT
	local slamsugen2 = false -- CLIENT
	local slamsugen3 = false -- CLIENT
	local slamsugen4 = false -- CLIENT
	
	local avloppletare1 = { x = 621.44, y = -1380.95, z = 9.21, h = 180.4409942627 }
	local avloppletare2 = { x = 632.04, y = -1411.97, z = 9.21, h = 180.4409942627 }
	local avloppletare3 = { x = 643.58, y = -1452.16, z = 9.21, h = 180.4409942627 }
	local avloppletare4 = { x = 652.97, y = -1491.66, z = 9.21, h = 180.4409942627 }

TriggerClientEvent('fsc_questline:ringpos',_source, avloppos, avloppcords, skattjakt, avloppletare1, avloppletare2, avloppletare3, avloppletare4 )
end


-- Nya updaten
RegisterServerEvent('fsc_questline:klarrest')
AddEventHandler('fsc_questline:klarrest', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(1000,1200)
    xPlayer.addMoney(randomMoney)
	TriggerClientEvent('esx:showNotification', src, 'Tack så himla mycket att du hjälpte min pojkvän med körningen.')
	Wait(2000)
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	TriggerClientEvent('fsc_questline:avbrytkamera', src)
end)

-- Nya updaten
RegisterServerEvent('fsc_questline:klarring')
AddEventHandler('fsc_questline:klarring', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(600,800)
    xPlayer.addMoney(randomMoney)
	TriggerClientEvent('esx:showNotification', src, 'Tack så himla mycket, nu kan jag träffa min pojkvän igen.')
	Wait(2000)
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	TriggerClientEvent('fsc_questline:avbrytkamera', src)
end)


--gamla
RegisterServerEvent('questline_makki3:hittavigselring')
AddEventHandler('questline_makki3:hittavigselring', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
TriggerClientEvent('esx:showNotification', _source,'Hej, Igår när jag var på toa, så slank min vigsel ring ner i toaletten skulle du kunna leta rätt på den så lovar jag att jag gör vad som helst.')

local skattjakt = math.random(1,4)
		local skattjaktkoll = 0
        local slamsugen1 = false
		local slamsugen2 = false
		local slamsugen3 = false
		local slamsugen4 = false
		 
		local avloppletare1 = { x = 621.44, y = -1380.95, z = 9.21, h = 180.4409942627 }
		local avloppletare2 = { x = 632.04, y = -1411.97, z = 9.21, h = 180.4409942627 }
		local avloppletare3 = { x = 643.58, y = -1452.16, z = 9.21, h = 180.4409942627 }
		local avloppletare4 = { x = 652.97, y = -1491.66, z = 9.21, h = 180.4409942627 }
		
		local hittaavlopp = math.random(1,4)
		
		 local distance1 = #(vector3(avloppletare1.x, avloppletare1.y, avloppletare1.z) - plyCoords)
		local distance2 = #(vector3(avloppletare2.x, avloppletare2.y, avloppletare2.z) - plyCoords)
		local distance3 = #(vector3(avloppletare3.x, avloppletare3.y, avloppletare3.z) - plyCoords)
		local distance4 = #(vector3(avloppletare4.x, avloppletare4.y, avloppletare4.z) - plyCoords)
		
end)


--gamla
RegisterServerEvent('questline_makki3:fyllabilfirmakaffe')
AddEventHandler('questline_makki3:fyllabilfirmakaffe', function()
local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx:showNotification', _source,'Hej jag har tappat bort min katt,')
	Wait(2000)
TriggerClientEvent('esx:showNotification', _source,'om du hjälpa mig att hitta henne skulle vara jätte snällt.')

end)