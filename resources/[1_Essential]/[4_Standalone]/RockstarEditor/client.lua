ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
    ESX.PlayerLoaded = false
    ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

function openRockstarMenu()
    local lib = exports['ox_lib']

    options = {}

    table.insert(options, {
        title = Config.Langage["option-start-record"],
        icon = 'play',
        description = Config.Langage["option-start-record-desc"],
        onSelect = function()
            StartRecording(1)
        end,
    })

    table.insert(options, {
        title = Config.Langage["option-stop-record"],
        icon = 'stop',
        description = Config.Langage["option-stop-record-desc"],
        onSelect = function()
            if(IsRecording()) then
				StopRecordingAndSaveClip()
			end
        end,
    })

    table.insert(options, {
        title = Config.Langage["option-open-rockstar"],
        icon = 'film',
        description = Config.Langage["option-open-rockstar-desc"],
        onSelect = function()
            NetworkSessionLeaveSinglePlayer()
			ActivateRockstarEditor()
        end,
    })

    lib:registerContext({
        id = 'rockstar_menu',
        title = 'Rockstar Editor',
        options = options
    })

    lib:showContext('rockstar_menu')
end

if Config.Command ~= "" then
    -- Enregistrement de la commande qui appelle la fonction
    RegisterCommand(Config.Command, function()
        openRockstarMenu() -- Appelle votre fonction
    end, false)
else
    TriggerServerEvent("esx:rockstar:printConsole", "Merci de mettre une commande dans la configuration")
    TriggerServerEvent("esx:rockstar:printConsole", "Please enter a command in configuration file.")
end

if Config.Key ~= "" and Config.Command ~= "" then
    -- Liaison de la commande à la touche F5
    RegisterKeyMapping(Config.Command, Config.KeyDesc, 'keyboard', Config.Key)
end