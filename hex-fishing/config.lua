Config = {}

Config.Framework = 'esx' -- 'esx' or 'qbcore'
Config.Inventory = 'ox' -- 'ox' (ox_inventory), 'esx' (esx default), 'qb' (qbcore default)

Config.MarkerSettings = {
    type = 21,
    size = vector3(0.4, 0.4, 0.4),
    color = vector4(255, 215, 255, 222),
    bobUpAndDown = false,
    rotateMarker = true
}

Config.Locations = {
    [1] = { coords = vector4(-1743.9780, -1132.8269, 13, 0), difficulty = { first = "easy", second = "medium", third = "medium" }},
    [2] = { coords = vector4(-1741.8182, -1130.3049, 13, 0), difficulty = { first = "easy", second = "medium", third = "medium" }},
    [3] = { coords = vector4(-1746.1216, -1135.5249, 13, 0), difficulty = { first = "easy", second = "medium", third = "medium" }},
    [4] = { coords = vector4(-1748.3146, -1138.1283, 13, 0), difficulty = { first = "easy", second = "medium", third = "medium" }},
    [5] = { coords = vector4(-1750.5188, -1140.6815, 13, 0), difficulty = { first = "easy", second = "medium", third = "medium" }},
    [6] = { coords = vector4(1061.9088, -618.0115, 56.6, 0), difficulty = { first = "easy", second = "medium", third = "medium" }},
    [7] = { coords = vector4(1060.2621, -619.6097, 56.6, 0), difficulty = { first = "easy", second = "medium", third = "medium" }},
    [8] = { coords = vector4(1058.4930, -621.3709, 56.6, 0), difficulty = { first = "easy", second = "medium", third = "medium" }},
    [9] = { coords = vector4(1056.7454, -623.0336, 56.6, 0), difficulty = { first = "easy", second = "medium", third = "medium" }},
}

Config.Items = {
    {name = 'bass', label = 'Bass', chance = 70},
    {name = 'catfish', label = 'Catfish', chance = 65},
    {name = 'trout', label = 'Trout', chance = 60},
    {name = 'salmon', label = 'Salmon', chance = 45},
    {name = 'tuna', label = 'Tuna', chance = 30},
    {name = 'cod', label = 'Cod', chance = 55},
    {name = 'mackerel', label = 'Mackerel', chance = 50},
    {name = 'halibut', label = 'Halibut', chance = 35},
    {name = 'swordfish', label = 'Swordfish', chance = 20},
    {name = 'mahi_mahi', label = 'Mahi-Mahi', chance = 25},
    {name = 'metal', label = 'Metal', chance = 90},
    {name = 'plastic', label = 'Plastic', chance = 90},
    {name = 'recyclables', label = 'Recyclables', chance = 90},
    {name = 'steel', label = 'Steel', chance = 85},
    {name = 'iron', label = 'Iron', chance = 85}
}

Config.FishMonger = {
    coords = vector4(46.0644, -1749.2839, 29.6393, 51.9226),
    model = 'a_m_m_farmer_01',
    prices = {
        bass = 510,
        catfish = 530,
        trout = 545,
        salmon = 630,
        tuna = 825,
        cod = 570,
        mackerel = 505,
        halibut = 695,
        swordfish = 845,
        mahi_mahi = 780
    } 
}