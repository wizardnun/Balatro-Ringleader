local setDiscoverTallies = set_discover_tallies

-- Overwrites the global set_discover_tallies method in order to append a tally for Ringleaders.
function set_discover_tallies()
	setDiscoverTallies()

	G.DISCOVER_TALLIES.ringleaders = {
		tally = 0,
		of = 10, -- TODO: Remove usage of static number.
	}
end

-- Returns the name of a Ringleader 
function get_ringleader_name(ringleader)
	local loc = G.localization.descriptions.Ringleader[ringleader.key]
	return loc and loc.name or ringleader.key
end