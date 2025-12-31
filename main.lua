assert(SMODS.load_file("functions/misc_functions.lua"))()
assert(SMODS.load_file("functions/ui_functions.lua"))()

-- Button callback for Collection Ringleaders button.
function G.FUNCS.your_collection_ringleaders(e)
  G.SETTINGS.paused = true

	local t = create_UIBox_your_collection_ringleaders()

  G.FUNCS.overlay_menu{definition = t}
end

