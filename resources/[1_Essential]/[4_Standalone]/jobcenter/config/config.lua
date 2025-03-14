Config = {}
Config.RenderDistance = 30.0
Config.Target = 'ox_target'

Config.Blip = {
	Text = 'Agence d\'emplois & Document',
	Sprite = 351,
	Size = 0.8,
	Color = 0,
	Display = 4
}

Config.Locations = {
	{
		Ped = `a_f_y_business_01`,
		Coords = vector4(-235.5928, -922.0876, 32.3122, 339.6660),
	}
}

--Optional fontawesome icons for jobs.
Config.JobIcons = {
	['unemployed'] = 'fa-solid fa-user',
	['taxi'] = 'fa-solid fa-taxi',
	['trucker'] = 'fa-solid fa-truck',
}

Config.Licenses = {
	--[[{
		Item = 'id',
		Label = 'Carte d\'identité',
		Icon = 'fa-solid fa-id-card',
		LicenseNeeded = false, --['license'/false] verify license ownership through esx_license
		Price = 250
	},
	{
		Item = 'drive',
		Label = 'Document de vos permis réussi',
		Icon = 'fa-solid fa-car',
		LicenseNeeded = 'drive', --['license'/false] verify license ownership through esx_license
		Price = 250
	},
	{
		Item = 'PPA',
		Label = 'Document de votre PPA',
		Icon = 'fa-solid fa-gun',
		LicenseNeeded = 'weapon', --['license'/false] verify license ownership through esx_license
		Price = 250
	},]]
}
