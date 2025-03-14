resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	"stream/hud_reticle.gfx",
    "stream/minimap.gfx",
	'client.lua'
}

ui_page 'ui.html'

files {
	'ui.html'
}

dependencies {
	'es_extended',
    'esx_status',
}


-- Ce script est un script LEAK, il peut donc contenir une instabilité d'ms en jeux !
-- Le script est safe, vérifier par mes prorpes soins.