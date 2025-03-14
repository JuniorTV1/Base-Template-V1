RegisterNetEvent('DE_garbage:pay')
AddEventHandler('DE_garbage:pay', function(bagCount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local payAmount = Config.PayPerBag * bagCount

    if payAmount > 0 then
        xPlayer.addInventoryItem('money', payAmount)
        Notify(source, 'information', 'Tu as été payé $' .. payAmount)
    else
        Notify(source, 'information', "Tu n'as collécté aucun déchets et rien de t'as été payé")
    end
end)


------------------ SUPPRI KEYS BY JUNIOR SERVER

RegisterNetEvent('sy_carkeys:DeleteKey')
AddEventHandler('sy_carkeys:DeleteKey', function(_, plate, name)
    local xPlayer = ESX.GetPlayerFromId(source)
    print(('Tentative de suppression des clés pour la plaque : %s et le nom : %s'):format(plate, name))

    if xPlayer then
        local keyItem = xPlayer.getInventoryItem('carkeys')

        if keyItem.count > 0 then
            local success = xPlayer.removeInventoryItem('carkeys', 1)

            if success then
                print(('[Junior-Keys] La clé du véhicule %s (%s) a été supprimée.'):format(name, plate))
            else
                print(('[Junior-Keys] Échec de la suppression des clés pour la plaque : %s et le nom : %s'):format(plate, name))
            end
        else
            print(('[Junior-Keys] Le joueur n\'a pas de clé de véhicule à supprimer.'))
        end
    else
        print('[Junior-Keys] Joueur introuvable.')
    end
end)