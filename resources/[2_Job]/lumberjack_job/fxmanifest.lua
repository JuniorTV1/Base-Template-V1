fx_version 'cerulean'
game 'gta5'

version '2.1.0'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

server_scripts {
    'server/*.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    '@es_extended/imports.lua'
}

lua54 'yes'

dependencies {
    'ox_lib',
}