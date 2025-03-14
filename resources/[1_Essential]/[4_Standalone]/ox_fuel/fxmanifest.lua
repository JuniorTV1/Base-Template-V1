fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

name 'ox_fuel'
version '1.5.1'

dependencies {
	'ox_lib',
	'ox_inventory',
}

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

server_scripts {
	'server.lua'
}

client_script 'client/init.lua'

files {
	'locales/*.json',
	'data/stations.lua',
	'client/*.lua',
}

ox_libs {
	'math',
	'locale',
}
