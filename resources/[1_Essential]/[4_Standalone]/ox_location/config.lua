config = {}

-- target resource (only one of these can be true)
-------------------------------------------------------
config.qbtarget =false 
config.oxtarget = true  
-------------------------------------------------------


config.pedmodel = 'a_m_m_prolhost_01' -- ped model hash

config.scenario = 'WORLD_HUMAN_CLIPBOARD' -- scenario for ped to play, false to disable

config.locations = {
    ['legion'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-212.2351, -1005.3043, 29.3001, 159.3656),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['faggio']    = {
                price = 250, 
                image = '',
            },
            ['asbo']        = {     
                price = 500,        
                image = '',    
            },
            ['kanjo']       = {
                price = 1000, 
                image = '',
            },

        },

        vehiclespawncoords = vector4(-217.0525, -1006.9150, 29.2420, 339.3851), -- where vehicle spawns when rented

    },

    -- add as many locations as you'd like with any type of vehicle (air, water, land) follow same format as above
}

