local setDiscoverTallies = set_discover_tallies

-- Overwrites the global set_discover_tallies method in order to append a tally for Ringleaders.
function set_discover_tallies()
	setDiscoverTallies()

	G.DISCOVER_TALLIES.ringleaders = {
		tally = 0,
		of = 10, -- TODO: Remove usage of static number.
	}
end