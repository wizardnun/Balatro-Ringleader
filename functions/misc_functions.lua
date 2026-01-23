local setDiscoverTallies = set_discover_tallies

-- Overwrites the global set_discover_tallies method in order to append a tally for Ringleaders.
function set_discover_tallies()
	setDiscoverTallies()
	G.DISCOVER_TALLIES.ringleaders = {tally = 0, of = 0}
	G.DISCOVER_TALLIES.ringleaders.tally = 0
	G.DISCOVER_TALLIES.ringleaders.of = 0
	for _, v in pairs(G.P_CENTER_POOLS.Ringleader) do
		G.DISCOVER_TALLIES.ringleaders.of = G.DISCOVER_TALLIES.ringleaders.of+1
		if v.discovered then
			G.DISCOVER_TALLIES.ringleaders.tally = G.DISCOVER_TALLIES.ringleaders.tally+1
		end
	end
end

-- Returns the name of a Ringleader 
function get_ringleader_name(ringleader)
	local loc = G.localization.descriptions.Ringleader[ringleader.key]
	return loc and loc.name or ringleader.key
end