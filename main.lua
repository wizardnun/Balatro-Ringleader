assert(SMODS.load_file("objects/ringleader_type.lua"))()
assert(SMODS.load_file("functions/misc_functions.lua"))()
assert(SMODS.load_file("functions/ui_functions.lua"))()
assert(SMODS.load_file("functions/button_callbacks.lua"))()
assert(SMODS.load_file("ringleaders/the_tester.lua"))()

local game_load_ref = Game.main_menu
function Game:main_menu(change_context)
    game_load_ref(self, change_context)
    -- Wait till game is fully loaded, can't access injected content till SMODS has fully loaded
    -- Print all ringleaders key and name  
    for i, ringleader in ipairs(G.P_CENTER_POOLS.Ringleader) do
        print(ringleader.key, get_ringleader_name(ringleader))
    end
end