function sendLogs(webhook, title, message)
    local embed = {
        {
            ["color"] = 15269632,
            ["title"] = title,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Base Template V1 Sky Développement - Logs",
            },
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "Society Logs", embeds = embed}), { ['Content-Type'] = 'application/json' })
end