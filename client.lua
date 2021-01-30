local currentcheckpoint = 1
local currentrace
local selectedcar = ''
local timer = nil
local isInMarker = false
local GUI = {}
local raceinproggress = false
GUI.Time = 0
local blip = {}
local numberofpoints = 0
local vehicle

--help locals
local printed = false
local currentraceindex = 0
local m0 = 0
local starttimer = false
local zerotime = 0

RegisterCommand("respawn", function(source, args)
    local backflash = currentrace
    starttimer = false
    SetEntityAsMissionEntity(vehicle, true, true)
    DeleteVehicle(vehicle)
    for index, checkpoint in pairs(currentrace.Points) do
        if DoesBlipExist(blip[index]) then
            RemoveBlip(blip[index])
        end
    end
    RestartRace()
    currentrace = backflash
    SetEntityCoords(PlayerPedId(), currentrace.Pos.x, currentrace.Pos.y, currentrace.Pos.z+1, true, true, true, false)
    StartRace()
end)
RegisterCommand("exit", function(source, args)
    starttimer = false
    SetEntityAsMissionEntity(vehicle, true, true)
    BringVehicleToHalt(vehicle, 3, 10, true)
    DeleteVehicle(vehicle)
    for index, checkpoint in pairs(currentrace.Points) do
        if DoesBlipExist(blip[index]) then
            RemoveBlip(blip[index])
        end
    end
    RestartRace()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    reloadB()
end)

function reloadB()
    local zones = {}
    local blipInfo = {}
    for zoneKey, zoneValues in pairs(Config.Checkpoints) do
        local blip = AddBlipForCoord(zoneValues.Pos.x, zoneValues.Pos.y, zoneValues.Pos.z)
        SetBlipSprite(blip, zoneValues.Btype)
        SetBlipDisplay(blip, 6)
        SetBlipScale(blip, 1.2)
        SetBlipColour(blip, zoneValues.BColor)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(zoneValues.Name)
        EndTextCommandSetBlipName(blip)
    end
end
--GroundMarker
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local coords = GetEntityCoords(GetPlayerPed(-1))

        for k, v in pairs(Config.Checkpoints) do
            if (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 100) then
                DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
            end
        end
    end
end)


--IsInMarker, load esx
Citizen.CreateThread(function()
    while true do
        Wait(0)
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
        isInMarker = false
        for k, v in pairs(Config.Checkpoints) do
            if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                ESX.ShowHelpNotification('Press ~INPUT_PICKUP~ to take part in race event!')
                currentraceindex = k
                currentrace = v
                isInMarker = true
                break
            elseif (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) > v.Size.x) then
                isInMarker = false
            end
        end
        if IsControlPressed(0, Config.OpenControl) and (isInMarker==true) and ((GetGameTimer() - GUI.Time) > 150) then
            GUI.Time = GetGameTimer()
            print("DEBUG: StartRace()")
            --odtialto
            TriggerServerEvent('MKR:registry', currentrace.Entry)
        end
    end
end)

RegisterNetEvent('MKR:enterrace')
AddEventHandler('MKR:enterrace', function() StartRace()end)
--sem

--Samotny raceevent
    --currentrace=Route_1
function StartRace()
    local heading = GetEntityHeading(PlayerPedId())
    print(heading)
    selectedcar = currentrace.Car
    print(currentrace,selectedcar)
    local car = GetHashKey(selectedcar)
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end
    vehicle = CreateVehicle(car, currentrace.Pos.x, currentrace.Pos.y, currentrace.Pos.z+1, currentrace.Heading, true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    if (GetVehiclePedIsIn(GetPlayerPed(-1),false)~=0) then
        FreezeEntityPosition(GetVehiclePedIsIn(GetPlayerPed(-1),false--[[only current vehicle]]),true--[[toggle freeze]])
        if Config.SendMessagess then
            TriggerEvent('chat:addMessage', { args = { "~g~MKR","Hello, this is MKR (mr__kuko's racing)" }, color = 0,0,0 })
            TriggerEvent('chat:addMessage', { args = { "type ~u~/respawn~s~ for fresh start" }, color = 0,0,0 })
            TriggerEvent('chat:addMessage', { args = { "type ~u~/exit~s~ to exit race" }, color = 0,0,0 })
        end
        Count()
    else print("DEBUG: Error during StartRace()")
    end
end

--Counter-unfreeze
function Count()
    timer = 3
	local t1=0
	local t0 = GetGameTimer()
    while(timer ~= 0) do
		print("DEBUG: Timer has been setted up")
        while (t1 < 1000) do
            if(timer==3) then
                text(timer,0.49,0.5,255,128,0,1.5)
            elseif(timer==2) then
                text(timer,0.49,0.5,255,255,0,1.5)
            elseif(timer==1) then
                text(timer,0.49,0.5,102,204,0,1.5)
            else
                print("ERROR in writing text")
            end
			t1=GetGameTimer()-t0
			Wait(0)
		end
        timer = timer-1
		Wait(0)
		t1=0
        t0=GetGameTimer()
        PlaySoundFrontend(-1, "CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET")
	end
	t1=0
	t0 = GetGameTimer()
    while (t1 < 1000) do
        text("GO!",0.45,0.5,255,0,0,1.5)
		Wait(0)
		t1=GetGameTimer()-t0
    end
    PlaySoundFrontend(-1, "FLIGHT_SCHOOL_LESSON_PASSED", "HUD_AWARDS")
    FreezeEntityPosition(GetVehiclePedIsIn(GetPlayerPed(-1),false),false)
    starttimer = true
    zerotime = GetGameTimer()
    print(zerotime)

    numberofpoints = 0
    for index, checkpoint in pairs(currentrace.Points) do
        blip[index] = AddBlipForCoord(checkpoint.x, checkpoint.y, checkpoint.z)
        SetBlipColour(blip[index], currentrace.BColor)
        SetBlipHiddenOnLegend(blip[index],true)
        SetBlipDisplay(blip[index],5)
        ShowNumberOnBlip(blip[index], (index))
        --print("DEBUG: index:"..index)
        numberofpoints = numberofpoints + 1
    end
    raceinproggress = true
    SetBlipRoute(blip[1],true)
end


Citizen.CreateThread(function()
    while true do
        Wait(0)
        if(raceinproggress) then
            --Graphic checkpoints
            local coords = GetBlipCoords( blip[currentcheckpoint] )
            local blipHeight = true and ( #( GetEntityCoords( PlayerPedId() ) - coords ) ) * 0.5 or 100
            if ( blipHeight <= 10 ) then
                blipHeight = 10
            end
            DrawMarker( 1, coords.x, coords.y, coords.z-5.0, 0, 0, 0, 0, 0, 0, 8.0, 8.0, blipHeight, currentrace.Color.r, currentrace.Color.g, currentrace.Color.b, 155, false, false, 2, false, false, false, false )
            if(currentcheckpoint<numberofpoints) then
                DrawMarker( 2, coords.x, coords.y, coords.z + blipHeight -3.0, 0, 0, 0, 0, 0, 0, 6.0, 6.0, 6.0, currentrace.Color.r, currentrace.Color.g, currentrace.Color.b, 155, false, true, 2, false, false, false, false )
            else
                DrawMarker( 5, coords.x, coords.y, coords.z + blipHeight -3.0, 0, 0, 0, 0, 0, 0, 8.0, 8.0, 8.0, currentrace.Color.r, currentrace.Color.g, currentrace.Color.b, 155, false, true, 2, false, false, false, false )
            end
            DrawMarker( 6, coords.x, coords.y, coords.z + blipHeight -3.0, 0, 0, 0, 0, 0, 0, 11.0, 11.0, 11.0, currentrace.Color.r, currentrace.Color.g, currentrace.Color.b, 155, false, true, 2, false, false, false, false )

            if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetBlipCoords(blip[currentcheckpoint]), true) < 15) then
                if (currentcheckpoint < numberofpoints) then
                    SetBlipRoute(blip[currentcheckpoint+1],true)
                    PlaySoundFrontend(-1, "RACE_PLACED", "HUD_AWARDS")
                end
                RemoveBlip(blip[currentcheckpoint])
                currentcheckpoint = currentcheckpoint+1
            end
            text((currentcheckpoint-1).."/"..numberofpoints,0.16,0.8,currentrace.Color.r,currentrace.Color.g,currentrace.Color.b,1.0)
            if(currentcheckpoint>numberofpoints) then
                print("DEBUG: Finish line")
                EndRace()
            end
        end           
    end
end)

function EndRace()
    starttimer = false
    print("DEBUG: Is it end already?")
    PlaySoundFrontend(-1, "FLIGHT_SCHOOL_LESSON_PASSED", "HUD_AWARDS")
    print(m0)
    local t1 = 0
	local t0 = GetGameTimer()
    while (t1 < 4000) do
        text("Race Finished!",0.2,0.4,104,204,0,3.0)
        text('~h~total time: '..math.floor(m0/60000)..'m '..math.floor((m0 - (math.floor(m0/60000))*60000)/1000)..'s '..(m0 - (math.floor(m0/1000)*1000))..'ms',0.3,0.6,0,0,0,1.0)
        Wait(0)
        t1=GetGameTimer()-t0
        if(t1>1000) then
            BringVehicleToHalt(vehicle, 3, 10, true)
            --FreezeEntityPosition(GetVehiclePedIsIn(GetPlayerPed(-1),false),true)
        end
    end
    if Config.SendMessagess then
        TriggerEvent('chat:addMessage', { args = { "Total time: "..math.floor(m0/60000)..'m'..math.floor((m0 - (math.floor(m0/60000))*60000)/1000)..'s'..(m0 - (math.floor(m0/1000)*1000))..'ms'}, color = 0,0,0 })
    end
    local sumary = currentrace.ttf - m0
    if sumary > 0 then
        TriggerServerEvent('MKR:givemoney', tonumber(currentrace.Reward))
    else
        TriggerServerEvent('MKR:toobad')
    end
    SetEntityAsMissionEntity(vehicle, true, true)
    DeleteVehicle(vehicle)
    RestartRace()
end
function RestartRace()
    raceinproggress = false
    currentcheckpoint = 1
    currentrace = nil
    selectedcar = ''
    timer = nil
    isInMarker = false
    blip = {}
    numberofpoints = 0
    printed = false
end

--Foundation category
function text(content,x,y,r,g,b,scale)
    SetTextColour(r,g,b,255)
    SetTextScale(scale, scale)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextEntry("STRING")
    AddTextComponentString(content)
    DrawText(x,y)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if starttimer then
            m0 = (GetGameTimer()-zerotime)
            local ms = currentrace.ttf - m0
            if(math.floor(ms/60000)==0) then
                text(math.floor((ms - (math.floor(ms/60000))*60000)/1000)..'s '..(ms - (math.floor(ms/1000)*1000))..'ms',0.16,0.85,0,102,0,1.0)
            else
                text(math.floor(ms/60000)..'m '..math.floor((ms - (math.floor(ms/60000))*60000)/1000)..'s '..(ms - (math.floor(ms/1000)*1000))..'ms',0.16,0.85,0,102,0,1.0)
            end
            DisableControlAction(0,75,true)
            DisableControlAction(27,75,true)
        end
    end
end)

--430-stopwatch
--435-finishflag
--483-redline
