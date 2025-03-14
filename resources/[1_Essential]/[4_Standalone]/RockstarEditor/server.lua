ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent("esx:rockstar:printConsole")
AddEventHandler("esx:rockstar:printConsole", function(message)
    print(message)
end)
