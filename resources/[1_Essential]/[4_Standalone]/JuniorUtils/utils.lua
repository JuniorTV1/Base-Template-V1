local recoils = {
    [453432689] = 1.5, [1593441988] = 1.5, [584646201] = 1.5, [2578377531] = 1.5, [3219281620] = 1.5, -- Pistolets
    [324215364] = 1.5, [736523883] = 1.5, [2024373456] = 1.5, [4024951519] = 1.5,                    -- SMGs
    [3220176749] = 10.5, [961495388] = 10.5, [2210333304] = 10.5, [4208062921] = 10.5,              -- Fusils d'assaut
    
}

CreateThread(function()
    local playerPed = PlayerPedId()
    while true do
        Wait(0)
        if IsPedShooting(playerPed) then
            local weapon = GetSelectedPedWeapon(playerPed)
            local recoil = recoils[weapon]
            if recoil then
                local pitch = GetGameplayCamRelativePitch()
                SetGameplayCamRelativePitch(pitch + recoil, 0.2)
            end
        end
    end
end)

-- Blips
local blips = {
    {name = "Dépot Bûcheron", color = 2, id = 85, pos = vector3(1167.73, -1347.27, 33.92)},
    {name = "Vente de bois", color = 2, id = 58, pos = vector3(257.2089, -3060.7234, 5.8560)},
    {name = "Forêt Bûcheron", color = 2, id = 88, pos = vector3(-511.1868, 5436.4990, 73.7043)},
    {name = "Déchetterie", color = 25, id = 318, pos = vector3(-321.5400, -1545.6489, 31.0198)},
}

for _, v in pairs(blips) do
    local blip = AddBlipForCoord(v.pos)
    SetBlipSprite(blip, v.id)
    SetBlipDisplay(blip, 6)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, v.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(v.name)
    EndTextCommandSetBlipName(blip)
    SetBlipPriority(blip, 5)
end

-- Texte 3D
local texts = {
    {coords = vector3(-204.6705, -1009.2494, 31.00), text = "Bienvenue sur ~y~Base Template V1~s~ 🌴"},
    {coords = vector3(-204.6705, -1009.2494, 30.80), text = "N'oubliez pas de récupérer vos documents, c'est juste à côté ;)"},
    {coords = vector3(-204.6705, -1009.2494, 30.60), text = "et surtout, amusez-vous bien !"}
}

CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local nearby = false
        for _, location in ipairs(texts) do
            if #(playerCoords - location.coords) < 10.0 then
                nearby = true
                DrawText3D(location.coords.x, location.coords.y, location.coords.z, location.text)
            end
        end
        if nearby then
            Wait(0) 
        else
            Wait(500) 
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 230)
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
