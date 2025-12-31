assert(SMODS.load_file("functions/ui_functions.lua"))()

local setDiscoverTallies = set_discover_tallies

-- Button callback for Collection Ringleaders button.
function G.FUNCS.your_collection_ringleaders(e)
  G.SETTINGS.paused = true

	local t = create_UIBox_your_collection_ringleaders()

  G.FUNCS.overlay_menu{definition = t}
end

-- Overwrites the global set_discover_tallies method in order to append a tally for Ringleaders.
function set_discover_tallies()
	setDiscoverTallies()

	G.DISCOVER_TALLIES.ringleaders = {
		tally = 0,
		of = 10, -- TODO: Remove usage of static number.
	}
end

