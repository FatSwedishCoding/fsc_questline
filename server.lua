ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler( "playerConnecting", function(name)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchScalar("SELECT * FROM questline WHERE identifier = @identifier", {['@identifier'] = identifier})
	if not result then
		MySQL.Sync.execute("INSERT INTO questline (`identifier`, `timeleft`) VALUES (@identifier, @timeleft)",{['@identifier'] = identifier, ['timeleft'] = 0})
    end
end)

-- Första konv om sin katt.
RegisterServerEvent('questline_makki3:letakatt')
AddEventHandler('questline_makki3:letakatt', function()
local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
TriggerClientEvent('esx:showNotification', _source,'Hej jag har tappat bort min katt, om du hittar henne så skulle du vara jätte snell katt.')
--
end)
-- Klar med katt questet
RegisterServerEvent('questline_makki3:klarkatt')
AddEventHandler('questline_makki3:klarkatt', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(400,600)
    xPlayer.addMoney(randomMoney)
	TriggerClientEvent('esx:showNotification', src, 'Tack så himla mycket för ni hittade Babsan.')
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	return
end)
-- klarr med ringen quest
RegisterServerEvent('questline_makki3:klarring')
AddEventHandler('questline_makki3:klarring', function()
local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
local randomMoney = math.random(500,700)
    xPlayer.addMoney(randomMoney)
	TriggerClientEvent('esx:showNotification', src, 'Tack så himla mycket, nu kan jag träffa min pojkvän igen.')
	TriggerClientEvent('esx:showNotification', src, 'här får du ' .. randomMoney .. 'kr som tack för hjälpen.')
	return
end)
--katt gps saken
RegisterServerEvent('questline_makki3:kattBlip1')
AddEventHandler('questline_makki3:kattBlip', function(coords)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do 
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('questline_makki3:kattBlip', xPlayers[i], coords)
    end
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

ESX.RegisterServerCallback('questline_makki3:kollacd', function(source, cb)
local date = os.date('*t')
local data = false
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local identifier = GetPlayerIdentifiers(source)[1]

-- NYA KODEN FÖR KOLLA CD MED DATE!
local result1 = MySQL.Sync.fetchScalar("SELECT timeleft FROM questline WHERE identifier = @identifier", {['@identifier'] = identifier})

local databastid = os.date('%Y:%m:%d:%H:%M', result1)
local currentLocalTime1 = (("%02d:%02d:%02d:%02d:%02d"):format(date.year,date.month,date.day,date.hour, date.min, date.sec))

local result = MySQL.Sync.fetchScalar("SELECT time FROM questline WHERE identifier = @identifier", {['@identifier'] = identifier})
local currentLocalTime = (("%02d:%02d:%02d"):format(date.hour, date.min, date.sec))

if databastid < currentLocalTime1 then
-- om godkänt att ta quest.
cb(false)
TriggerClientEvent('esx:showNotification', _source,'Godkänt')
-- Om nekad att ta quest.
else
cb(true)
TriggerClientEvent('esx:showNotification', _source,'Nekad')
end
--
-- gamla koden som bara kolla tid inte datum
--[[
if result < currentLocalTime then
data = false
TriggerClientEvent('questline_makki3:sattcd', _source, data)
else
data = true
TriggerClientEvent('questline_makki3:sattcd', _source, data)
end
--]]
end)

RegisterServerEvent('questline_makki3:samsungtid')
AddEventHandler('questline_makki3:samsungtid', function()
local date = os.date('*t')
local time = os.time()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local identifier = GetPlayerIdentifiers(source)[1]
-- nya koden för date
local currentLocalTime = (("%02d:%02d:%02d"):format(date.hour + 3, date.min, date.sec))
MySQL.Async.execute("UPDATE questline SET time =@carthiefv2 WHERE identifier=@identifier", {['@identifier'] = identifier, ['@carthiefv2'] = currentLocalTime})

local myTimeStamp1 = os.time({year=date.year, month=date.month, day=date.day, hour=date.hour + 3, minute=date.min})

MySQL.Async.execute("UPDATE questline SET timeleft =@carthiefv2 WHERE identifier=@identifier", {['@identifier'] = identifier, ['@carthiefv2'] = myTimeStamp1})
--
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