fx_version 'cerulean'
games {'gta5'}
author '!Junior'
description 'Core de véhicule by !Junior for Base Template V1'

files{
    "data/**/*.meta",
}

data_file 'HANDLING_FILE'			    'data/**/handling.meta'
data_file 'VEHICLE_LAYOUTS_FILE'	    'data/**/vehiclelayouts.meta'
data_file 'VEHICLE_METADATA_FILE'	    'data/**.meta'
data_file 'CARCOLS_FILE'			    'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE'	    'data/**/carvariations.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'data/**/unlocks.meta'


files({
	'data/**/carcols.meta',
	'data/**/carvariations.meta',
	'data/**/handling.meta',
	'data/**/vehicles.meta'
	
})

data_file('HANDLING_FILE')('data/**/handling.meta')
data_file('VEHICLE_METADATA_FILE')('data/**/vehicles.meta')
data_file('CARCOLS_FILE')('data/**/carcols.meta')
data_file('VEHICLE_VARIATION_FILE')('data/**/carvariations.meta')
