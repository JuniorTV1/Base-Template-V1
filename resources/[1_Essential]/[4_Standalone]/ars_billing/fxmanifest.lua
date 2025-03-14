--#--
--Fx info--
--#--
fx_version   "cerulean"
use_fxv2_oal "yes"
lua54        "yes"
game         "gta5"
version      "1.0.0"

--#--
--Resource info--
--#--
name "ars_billing"

--#--
--Manifest--
--#--
client_scripts {
    "client/*.lua",
    "client/functions/*.lua"
}
server_scripts {
    "server/*.lua",
}

shared_scripts {
    "@ox_lib/init.lua", 
    "config.lua"
}