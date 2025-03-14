
Citizen.CreateThread(function()
	local blips = {}
	local blipsVisible= false
	while true do
		Citizen.Wait(1000)
		if ESX.PlayerData.job and ESX.PlayerData.job.name =='lumberjack' and not blipsVisible then
			for k,v in pairs(Config.Blips) do
				local Blip = AddBlipForCoord(v.coords)
            SetBlipSprite (Blip, v.SetBlipSprite)
            SetBlipDisplay(Blip, v.SetBlipDisplay)
            SetBlipScale  (Blip, v.SetBlipScale)
            SetBlipAsShortRange(Blip, false)
            SetBlipColour(Blip, v.SetBlipColour)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v.BlipLabel)
            EndTextCommandSetBlipName(Blip)
            Config.Blips[k].blip = Blip
			end
			  for k,v in pairs(Config.TreeLocations) do 
            local Blip = AddBlipForCoord(v.coords)
            SetBlipSprite (Blip, 79)
            SetBlipDisplay(Blip, 6)
            SetBlipScale  (Blip, 0.8)
            SetBlipAsShortRange(Blip, false)
            SetBlipColour(Blip, 2)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName("Arbre")
            EndTextCommandSetBlipName(Blip)
            Config.TreeLocations[k].blip = Blip
        end
			Config.UseBlips = true
		end

		if next(blips) ~= nil and ESX.PlayerData.job.name ~='lumberjack' then
			for i, blip in pairs(blips) do
				RemoveBlip(blip)
				table.remove(blips, i)
			end
			Config.UseBlips = false
		end
	end
end)