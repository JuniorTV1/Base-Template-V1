Config = {}

Config.Debug = true
--Fake ID configuration
Config.NPCLocation = vec3(1639.5414, 4879.4336, 41.1407) -- Where should the FakeID NPC be?
Config.NPCLocationheading = 99.99 -- Which was is the NPC looking? 
Config.NPCModel = 'a_m_m_business_01' -- Model of the NPC that sells the ID.
Config.Price = 75000 -- How much of the item below should the player have?
Config.PaymentType = "black_money" -- Input an item.
Config.Item = true -- Do you want the player to receive the FakeID upon payment?
Config.DeleteAfterRestart = false -- Wipes FakeID from DB after restart.

--Legal ID Redeem NPC
Config.EnableRedeemNpc = true
Config.Blip = true
Config.NPCLicenseLocation = vec3(-234.5775, -922.5319, 31.3122) -- Where should the NPC be?
Config.NPCLicenseLocationheading = 346.66 -- Which was is the NPC looking?
Config.NPCLicenseModel = 'a_m_m_business_01' -- Model of the NPC that gives the ID.

--Full list/Command Configuration.
Config.CommandOn = false  -- Turns the command on or off.
Config.Command = "licenses" -- Command to open the menu.

-- Item names for all IDS
Config.ItemNames = {
    fakeid = 'fake_id', --License item name or false to disable it.
    id = "id",
    drivers = "driver",
    weapon = "weapon",
    medic = "medic"
}
Config.UseableItems = true -- Do you want the items to open up their seperate menus when used? (true) or are you okay with just metadata on the items? (false)

Config.LicenseNames = {
    medic = "mediku_pazyma",
    weapon = "weapon",
    drivers = "drive"
}

Config.Language = {
    buy = 'Acheter une fausse identité/permis !',
    buydescription = 'Demandez une carte d\'identité au contact !',
    idmenu = 'Acheter une carte d\'identité',
    name = 'Prénom',
    namedesc = 'Ajoutez votre prénom ici',
    lname = 'Nom de famille',
    lnamedesc = 'Ajoutez votre nom de famille ici',
    dobas = 'Date de naissance',
    gender = 'Genre',
    male = 'Homme',
    female = 'Femme',
    category = 'Catégorie',
    height = 'Taille',
    notifytitle = 'Sunrise License',
    notifysucces = 'Vous avez reçu une fausse carte d\'identité/permis!',
    notifyalready = 'Vous avez déjà une licence !',
    notifymoney = 'Vous n\'avez pas assez d\'argent !',
    pedname = 'Faussaire',
    menudesc = 'Personne à proximité !',
    titlemenu = 'Faux documents',
    menutitle = 'Vendeur de Faux document',
    categorya = 'A',
    categoryb = 'B',
    idtitle = 'Documents officiels',
    categoryc = 'C',
    checktitle = 'Voir votre fausse carte d\'identité/permis',
    checkdesc = 'Récupérer votre carte',
    showtitle = 'Montrez votre fausse carte d\'identité/permis',
    showkdesc = 'Montre votre carte d\'identité à la personne la plus proche',
    eyepedname = 'Faussaire',
    pricemeta = 'Prix d\'une carte d\'identité $',
    nolicense = 'Vous n\'avez pas cette licence !',
    checkmedic = "Voir votre licence médicale",
    showmedic = "Montrez votre licence médicale",
    checkweapon = "Voir votre licence d\'arme",
    showweapon = "Montrez votre licence d\'arme",
    checkdrivers = "Voir votre permis de conduire",
    showdrivers = "Montrez votre permis de conduire",
    checkid = "Voir votre carte d'identité",
    showid = "Montrez votre carte d'identité",
    redeemid = "Récupérez votre carte d'identité",
    redeemdid = "Récupérez votre permis de conduire",
    redeewdid = "Récupérez votre licence d\'arme",
    redeehdid = "Récupérez votre licence médicale.",
    mediclicenseitemmeta = "Licence Médicale",
    weaponlicenseitemmeta = "Licence d\'Arme",
    driverslicenseitemmeta = "Permis de Conduire",
    redeemlicensestarget = "Récupérer vos documents",
    redeemnpcblip = 'Documents'
}
