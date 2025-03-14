local Shared <const> = {

    debug = false, -- activates debug messages on the server and client sides
    menuSystem = 'target', -- 'target' = boss menu has precise target | 'touch' = boss menu via a key (anywhere on the map)
    keyOpenBossMenu = '',
    resourceName = GetCurrentResourceName(),
    whiteningPercentage = 1.00, -- Percentage received from the initial price after laundering, 0.80 corresponds to 80%
    maxSalary = 1000,
    unemployedJob = 'unemployed',
    unemployedGrade = 0,

    logs = { 
        recruit = '', -- Webhook a mettre entre ''
        announce = '',
        washMoney = '',
        reworkGrade = '',
        moneyInteraction = ''
    },

    society = { -- J'ai désactiver plusieurs job sur la base mais tu peut tres bien en ajouter par toi meme, oublie pas de mettre le job boss ici afin d'avoir le menu boss
        --{name = 'police', label = 'L.A.P.D', coords = vec3(-1100.3707, -829.3315, 34.2770), bossGrade = 8, washMoney = true},
        --{name = 'mechanic', label = 'LS Custom', coords = vec3(-350.5537, -125.1409, 44.1356), bossGrade = 4, washMoney = false},
        --{name = 'realestateagent', label = 'Agent Immobilier', coords = vec3(-126.0056, -641.1119, 168.8206), bossGrade = 2, washMoney = false},
        --{name = 'burgershot', label = 'Burgershot', coords = vec3(-1202.4078, -896.2018, 13.8862), bossGrade = 4, washMoney = false},
        --{name = 'vigneron', label = 'Vigneron', coords = vec3(-1876.0264, 2061.0769, 145.5736), bossGrade = 3, washMoney = false},
        --{name = 'taxi', label = 'T.A.X.I', coords = vec3(901.9359, -162.1414, 78.1628), bossGrade = 4, washMoney = false},
        {name = 'ambulance', label = 'L.A.M.C', coords = vec3(1150.0430, -1551.1556, 35.3806), bossGrade = 3, washMoney = false}

    }

}

_ENV.Shared = Shared

function sendNotify(title, description, icon, iconColor, type)

    if title == nil then
        title = ESX.PlayerData.job.label
    end

    if description == nil then
        description = 'Merci de bien définir la déscription dans la notification'
    end

    if icon == nil then
        icon = 'envelope'
    end

    if iconColor == nil then
        iconColor = '#FFFBFB'
    end

    if type == nil then
        type = 'inform'
    end

    lib.notify({
        title = title,
        description = description,
        position = 'top',
        icon = icon,
        iconColor = iconColor,
        duration = 4000,
        type = type
    })

end

function sendServerNotify(player, title, message, type)
    TriggerClientEvent('ox_lib:notify', player, {
        title = title,
        description = message,
        position = 'top',
        duration = 5000,
        type =  type,
    })
end
