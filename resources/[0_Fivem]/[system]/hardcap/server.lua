local playerCount = 0
local list = {}

RegisterServerEvent('hardcap:playerActivated')

AddEventHandler('hardcap:playerActivated', function()
  if not list[source] then
    playerCount = playerCount + 1
    list[source] = true
  end
end)

AddEventHandler('playerDropped', function()
  if list[source] then
    playerCount = playerCount - 1
    list[source] = nil
  end
end)

AddEventHandler('playerConnecting', function(name, setReason)
  local cv = GetConvarInt('sv_maxclients', 32)

  print('Base Template V1 - By Sky Développement [CEO - !Junior ] | Connexion du joueur : ' .. name .. '^7')

  if playerCount >= cv then
    print("Base Template V1 | Le serveur est actuellement plein. Veuillez patienter jusqu'à ce que des slots se libèrent.")

    setReason('Le serveur est plein (reste ' .. tostring(cv) .. ' joueurs).')
    CancelEvent()
  end
end)
