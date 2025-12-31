local createCollectionRef = create_UIBox_your_collection
local setDiscoverTallies = set_discover_tallies

-- Creates a Collection Ringleaders Button node.
function create_UIBox_your_collection_ringleaders_button()
	return UIBox_button({
		-- TODO: Uncomment line below once your_collection_ringleaders is implemented.
		-- button = 'your_collection_ringleaders',
		label = { localize('b_ringleaders') },
		count = G.DISCOVER_TALLIES.ringleaders,
		minw = 5,
		minh = 1.7,
		scale = 0.6,
		id = 'your_collection_ringleaders'
	})
end

-- Renders the Ringleaders Collection view.
function create_UIBox_your_collection_ringleaders()
	local deck_tables = {}

	G.your_collection = {}

	table.insert(deck_tables, {})
	
	-- TODO: Finish implementation.
end

-- Button callback for Collection Ringleaders button.
G.FUNCS.your_collection_ringleaders = function(e)
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu{
    definition = create_UIBox_your_collection_ringleaders(),
  }
end

-- Overwrites the global set_discover_tallies method in order to append a tally for Ringleaders.
function set_discover_tallies()
	setDiscoverTallies()

	G.DISCOVER_TALLIES.ringleaders = {
		tally = 0,
		of = 10, -- TODO: Remove usage of static number.
	}
end

-- Overwrites the global create_UIBox_your_collection to render the Rindleaders button.
function create_UIBox_your_collection()
  contents = createCollectionRef()

  table.insert(contents.nodes[1].nodes[1].nodes[1].nodes[1].nodes, #contents.nodes[1].nodes[1].nodes[1].nodes[1].nodes[1] + 2, create_UIBox_your_collection_ringleaders_button())
  
	return contents
end