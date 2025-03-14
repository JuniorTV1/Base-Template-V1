Config = {}

Config.CommandName = "createbill"   -- Name of the command to open the create bill form
Config.ItemName = "facture"         -- Name of the item to give to player
Config.RemoveItem = false           -- Remove item when bill paid
Config.MetadataOnItem = true        -- if true it will show details of the bill on item hover
Config.UseDiscordLogs = true
Config.CreateBillWebhook = ""
Config.PayBillWebhook = ""

Config.AllowedJobs = {
    "police",
    "ambulance"
}

Config.UseForcePay = true

Config.FocePayJobs = {
    "police",
    "ambulance"
}




Config.Lang = {

    mreason         = ">> Raison",
    msociety        = ">> Société",
    mfrom           = ">> De",
    mamount         = ">> Montant",
    mdate           = ">> Créé le",
    mstatus         = ">> Statut",
    mPaidDate       = ">> Payé le",

    billingTitle    = "Créer une facture",
    reason          = "Raison",
    amount          = "Montant",
    sign            = "Signer",

    confermBill     = "Confirmer les détails de la facture",
    creatingBill    = "Création de la facture",
    billCreated     = "Facture créée pour $",
    billCanceled    = "[Erreur] Création de la facture annulée",
    noSign          = "[Erreur] Veuillez signer la facture",
    noReason        = "[Erreur] Veuillez fournir une raison",
    noAmount        = "[Erreur] Veuillez entrer un montant valide",
    noPlayer        = "[Erreur] Aucun joueur à proximité",

    noMoney         = "[Erreur] Vous n'avez pas assez d'argent",
    xnoMoney        = "Le client n'a pas assez d'argent",
    billPaid        = "La facture a été payée pour $",

    notPaid         = "Non payé",
    bill            = "Facture",

    createdFrom     = "Créé par : ",
    fSociety        = "  \n  Société : ",
    fAmount         = "  \n Montant : $",
    fReason         = "  \n  Raison : ",
    fDate           = "  \n  *Date:* ",

    checkingDetails = "Vérification des détails",
    paymentMethod   = "Méthode de paiement",
    selectMethod    = "Sélectionner une méthode",
    payCash         = "Payer en espèces",
    payBank         = "Payer par banque",
    noMethod        = "Veuillez sélectionner une méthode de paiement",
    conferPayment   = "Confirmer le paiement de $",
    wrong           = "Un problème est survenu !?",
    paid            = "Payé",
    alreadyPaid     = "Cette facture est déjà payée",
}

