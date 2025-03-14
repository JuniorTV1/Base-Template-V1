fx_version 'cerulean'
games { 'gta5' }


version '1.0.0'

lua54 'yes'

ui_page 'html/index.html'

client_scripts {
    'client/client.lua'
}
server_script {
    'server/server.lua',
    '@oxmysql/lib/MySQL.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/**.lua',
}

files {
	'html/index.html',
	'html/assets/css/*.css',
	'html/assets/js/*.js',
	'html/assets/fonts/roboto/*.woff',
	'html/assets/fonts/roboto/*.woff2',
	'html/assets/fonts/justsignature/JustSignature.woff',
	'html/assets/images/*.png'
}

dependencies {
	'loaf_headshot_base64',
	'ox_lib',
	'ox_inventory',
}