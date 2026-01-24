local ringleader_atlas_key = "Ringleader"

-- Registers Ringleaders spritesheet in SMODS Atlas.
SMODS.Atlas({
    key = ringleader_atlas_key,
    path = "Ringleaders.png",
    px = 71,
    py = 95,
    raw_key = true,
})

-- Creates Ringleader pool and tells SMODS how to handle them
SMODS.ObjectType({
    key = "Ringleader",
    default = "rldr_tester", -- Handles fallback if we ever fail to find. TODO: update to actual first ringleader once implemented
    inject_class = function(self)
        G.P_CENTER_POOLS.Ringleader = {}
    end
})

-- Creates base Ringleader class
SMODS.Ringleader = SMODS.Center:extend({
     set = "Ringleader",
     atlas = ringleader_atlas_key,
     discovered = false,
     unlocked = false,
     rarity = 1,
     cost = 0,
     blueprint_compat = false,
     perishable_compat = false,
     eternal_compat = false,
     config = {},

 })