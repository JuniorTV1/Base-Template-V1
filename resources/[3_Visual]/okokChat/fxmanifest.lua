fx_version 'adamant'

game 'gta5'

ui_page 'web/ui.html'

files {
	'web/*.*',
}

shared_script 'config.lua'

client_scripts {
	'client.lua',
	'ooc.lua',
}

server_scripts {
	'server.lua',
	'commands.lua',
}

-- Ce script est un script LEAK, il peut donc contenir une instabilité d'ms en jeux !
-- Le script est safe, vérifier par mes prorpes soins.