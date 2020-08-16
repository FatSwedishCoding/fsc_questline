ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler( "playerConnecting", function(name)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchScalar("SELECT * FROM questline WHERE identifier = @identifier", {['@identifier'] = identifier})
	if not result then
		MySQL.Sync.execute("INSERT INTO questline (`identifier`, `timeleft`) VALUES (@identifier, @timeleft)",{['@identifier'] = identifier, ['timeleft'] = 0})
		print('/////////////////////////////// ///////////////////////////////')
		print('Spelaren med steamnamet ' .. name .. ' lades in i databasen "questline", ' .. name .. 's hexkod är: ' .. identifier)
		print('/////////////////////////////////////////////////////////////////////////')
    end
end)

RegisterServerEvent('fsc_questline:linkustart')
AddEventHandler('fsc_questline:linkustart', function()
fsc_kollacd()
end)

function fsc_kollacd()
local date = os.date('*t')
local data = false
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local identifier = GetPlayerIdentifiers(source)[1]
local result = MySQL.Sync.fetchScalar("SELECT time FROM questline WHERE identifier = @identifier", {['@identifier'] = identifier})
local currentLocalTime = (("%02d:%02d:%02d"):format(date.hour, date.min, date.sec))
if result < currentLocalTime then
data = false
print('false, inte cd')
-- för att randomera questet,
fsc_randomquest(_source)
-- sätter 3h cd.
fsc_sattcd(_source)
else
data = true
print('true, har cd')
TriggerClientEvent('esx:showNotification', _source,'Hej tack för hjälpen förut, just nu är allt fin fint. ha det gött hej.')
TriggerClientEvent('fsc_questline:avbrytkamera',_source)
return
end
end

function fsc_sattcd(source)
local date = os.date('*t')
local time = os.time()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local identifier = GetPlayerIdentifiers(source)[1]

local currentLocalTime = (("%02d:%02d:%02d"):format(date.hour + 3, date.min, date.sec))
MySQL.Async.execute("UPDATE questline SET time =@carthiefv2 WHERE identifier=@identifier", {['@identifier'] = identifier, ['@carthiefv2'] = currentLocalTime})
end

function fsc_randomquest(source)
local _source = source
quest = {}
quest[1] = 1
quest[2] = 1
local q = math.random(quest[1], quest[2])
print(q)
if q == 1 then
fsc_letakatt(_source)
else
end
end
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
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	TriggerClientEvent('fsc_questline:avbrytkamera',src)
end)


RegisterServerEvent('questline_makki3:klarring')
AddEventHandler('questline_makki3:klarring', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(500,700)
    xPlayer.addMoney(randomMoney)
	TriggerClientEvent('esx:showNotification', src, 'Tack så himla mycket, nu kan jag träffa min pojkvän igen.')
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
end)

RegisterServerEvent('questline_makki3:hittavigselring')
AddEventHandler('questline_makki3:hittavigselring', function()
local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx:showNotification', _source,'Hej, Igår när jag var på toa, så slank min vigsel ring ner i toaletten skulle du kunna leta rätt på den så lovar jag att jag gör vad som helst.')
end)

RegisterServerEvent('questline_makki3:fyllabilfirmakaffe')
AddEventHandler('questline_makki3:fyllabilfirmakaffe', function()
local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx:showNotification', _source,'Hej jag har tappat bort min katt, om du hjälpa mig att hitta henne skulle vara jätte snällt.')
end)

--[[
RegisterServerEvent('questline_makki3:samsungtid')
AddEventHandler('questline_makki3:samsungtid', function()
local date = os.date('*t')
local time = os.time()
local cdtid = 360

local _source = source
local sourceXPlayer = ESX.GetPlayerFromId(_source) 
local identifier = GetPlayerIdentifiers(source)[1]
MySQL.Async.execute("UPDATE questline SET timeleft =@carthiefv2 WHERE identifier=@identifier", {['@identifier'] = identifier, ['@carthiefv2'] = '360'})

end)
--]]
--[[
RegisterServerEvent('questline_makki3:')
AddEventHandler('questline_makki3:', function()
end)
RegisterServerEvent('questline_makki3:')
AddEventHandler('questline_makki3:', function()
end)
RegisterServerEvent('questline_makki3:')
AddEventHandler('questline_makki3:', function()
end)
RegisterServerEvent('questline_makki3:')
AddEventHandler('questline_makki3:', function()
end)
RegisterServerEvent('questline_makki3:')
AddEventHandler('questline_makki3:', function()
end)
RegisterServerEvent('questline_makki3:')
AddEventHandler('questline_makki3:', function()
end)
RegisterServerEvent('questline_makki3:')
AddEventHandler('questline_makki3:', function()
end)
]]