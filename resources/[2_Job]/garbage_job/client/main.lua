local bags = 0
local bagsTaken = {}
local bagProp = nil
local jobVehicle = nil
local blip = nil
local isHoldingBag = false
local isOnDuty = false

if Config.RequireJob then
    jobName = Config.Job
else
    jobName = nil
end

--[[CreateThread(function()
    if Config.Blip.Show then
        if Config.RequireJob then
            if ESX.PlayerData.job.name == Config.Job then
                blip = AddBlipForCoord(Config.JobClock)

                SetBlipSprite(blip, Config.Blip.Sprite)
                SetBlipScale(blip, Config.Blip.Scale)
                SetBlipColour(blip, Config.Blip.Color)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName('STRING')
                AddTextComponentSubstringPlayerName('Déchetterie')
                EndTextCommandSetBlipName(blip)
            end
        else
            blip = AddBlipForCoord(Config.JobClock)

            SetBlipSprite(blip, Config.Blip.Sprite)
            SetBlipScale(blip, Config.Blip.Scale)
            SetBlipColour(blip, Config.Blip.Color)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('Déchetterie')
            EndTextCommandSetBlipName(blip)
        end
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    if Config.RequireJob then
        if job.name == 'garbage' and blip == nil then
            blip = AddBlipForCoord(Config.JobClock)

            SetBlipSprite(blip, Config.Blip.Sprite)
            SetBlipScale(blip, Config.Blip.Scale)
            SetBlipColour(blip, Config.Blip.Color)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName('Déchetterie')
            EndTextCommandSetBlipName(blip)
        elseif job.name ~= 'garbage' and blip ~= nil then
            RemoveBlip(blip)
            blip = nil
        end
    end
end)]]

exports.ox_target:addModel(Config.Models, {
    {
        label = 'Prendre le sac poubelle',
        icon = 'fas fa-trash',
        distance = 2.0,
        onSelect = function(data)
            local playerPed = PlayerPedId()

            if bagsTaken[data.entity] == nil then
                bagsTaken[data.entity] = 0
            end

            loadAnimDict("anim@heists@narcotics@trash")
            ProgressBar(5000, 'Prend le sac poubelle', { scenario = 'PROP_HUMAN_BUM_BIN' },
                { move = true, mouse = false, combat = true, sprint = true, car = true })

            isHoldingBag = true
            bagProp = CreateObject(GetHashKey("prop_cs_street_binbag_01"), 0, 0, 0, true, true, true)
            AttachEntityToEntity(bagProp, playerPed, GetPedBoneIndex(playerPed, 57005), 0.4, 0, 0, 0, 270.0, 60.0, true,
                true, false, true, 1, true)

            bagsTaken[data.entity] += 1

            TaskPlayAnim(playerPed, 'anim@heists@narcotics@trash', 'walk', 1.0, -1.0, -1, 49, 0, 0, 0, 0)
        end,
        canInteract = function(entity)
            return not isHoldingBag and isOnDuty and bagsTaken[entity] ~= 3 and bags < Config.MaxBags
        end
    }
})

exports.ox_target:addGlobalVehicle({
    {
        label = 'Déposer le sac poubelle',
        icon = 'fas fa-trash',
        bones = 'boot',
        distance = 2.0,
        onSelect = function(data)
            ProgressBar(800, 'Jette la sac poubelle dans le camion',
                { dict = 'anim@heists@narcotics@trash', clip = 'throw_b' },
                { move = true, mouse = false, combat = true, sprint = true, car = true })
            DeleteEntity(bagProp)
            bagProp = nil
            isHoldingBag = false
            bags += 1

            if bags == Config.MaxBags then
                Notify('information', 'Tu as atteint le nombre maximum de sac. Retourne à la déchetterie te faire payer.')
            end
        end,
        canInteract = function(entity)
            return isHoldingBag and GetEntityModel(entity) == GetHashKey(Config.VehicleModel)
        end
    }
})

exports.ox_target:addSphereZone({
    coords = Config.JobClock,
    radius = 1.0,
    debug = false,
    options = {
        {
            label = 'Prise de poste',
            icon = 'fas fa-clipboard',
            groups = jobName,
            distance = 2.0,
            onSelect = function(data)
                ProgressBar(2000, 'Prise de poste', nil,
                    { move = true, mouse = false, combat = true, sprint = true, car = true })

                ESX.Game.SpawnVehicle(Config.VehicleModel, Config.VehicleSpawn.xyz, Config.VehicleSpawn.w,
                    function(vehicle)
                        Notify('information', 'Tu as pris ton poste et ton véhicule de service a été sorti')
                        receiveCarKeys(vehicle, GetVehicleNumberPlateText(vehicle))
                        jobVehicle = vehicle
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1) -- -1 pour le siège conducteur
                        Wait(3000)
                        exports['sy_carkeys']:CarKey()
                    end)
                isOnDuty = true
            end,
            canInteract = function()
                return not isOnDuty
            end
        },
        {
            label = 'Fin de poste',
            icon = 'fas fa-clipboard',
            groups = jobName,
            distance = 2.0,
            onSelect = function(data)
                ProgressBar(2000, 'Fin de poste', nil, { move = true, mouse = false, combat = true, sprint = true, car = true })
                Notify('information', 'Tu as terminé ton poste et ton véhicule a été rangé')
        
                -- Supprimer la clé du véhicule
                local plate = GetVehicleNumberPlateText(jobVehicle)
                local model = GetEntityModel(jobVehicle)
                local name = GetDisplayNameFromVehicleModel(model)
                TriggerServerEvent('sy_carkeys:DeleteKey', 1, plate, name)
        
                -- Effectuer le paiement et supprimer l'entité du véhicule
                TriggerServerEvent('DE_garbage:pay', bags)
                DeleteEntity(jobVehicle)
        
                -- Réinitialiser les variables
                jobVehicle = nil
                bagsTaken = {}
                bags = 0
                isOnDuty = false
            end,
            canInteract = function()
                return isOnDuty
            end
        }
        
    }
})
