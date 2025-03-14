function AddTextEntry(k, v)
   Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), k, v)
end

local server_name = "~y~Base Template V1~s~"
local map_category = "~y~Base Template SkyDev~s~"
local discord_link = "~b~Discord~s~ : ~y~discord.gg/WnDuZCJ3xA~s~"

local game_category = "~y~Prendre l'avion~s~"
local disconnect_submenu = "🧭 ~y~Se Déconnecter~s~"
local closegame_submenu = "🛫 ~y~Quitter Base Template V1~s~"

local info_category = "~y~Souvenirs~s~"
local statistics_category = "~y~Statistiques~s~"
local settings_category = "~y~Paramètre~s~"
local gallery_category = "~y~Photo~s~"
local rockstar_editor_category = "∑ Editor~s~"

local fivem_key_config_submenu = "~y~Touches Base Template by !Junior~s~"

Citizen.CreateThread(function()
   while true do
      local playerCount = #GetActivePlayers() 
      local fivem_title = server_name .. " |  ~b~Joueurs Connectés~s~ ~y~" .. playerCount .. " /64~s~ | " .. discord_link
      
      -- Ajouter les nouvelles entrées de texte
      AddTextEntry('FE_THDR_GTAO', fivem_title)
      AddTextEntry('PM_SCR_MAP', map_category)
      AddTextEntry('PM_SCR_GAM', game_category)
      AddTextEntry('PM_PANE_LEAVE', disconnect_submenu)
      AddTextEntry('PM_PANE_QUIT', closegame_submenu)
      AddTextEntry('PM_SCR_INF', info_category)
      AddTextEntry('PM_SCR_STA', statistics_category)
      AddTextEntry('PM_SCR_SET', settings_category)
      AddTextEntry('PM_SCR_GAL', gallery_category)
      AddTextEntry('PM_SCR_RPL', rockstar_editor_category)
      AddTextEntry('PM_SCR_CFX', fivem_key_config_submenu) 

      Citizen.Wait(10000) 
   end
end)


