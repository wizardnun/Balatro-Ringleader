---@class RingleaderUI
RingleaderUI = RingleaderUI or {}

-- Creates a Collection Ringleaders Button node.
function RingleaderUI.create_UIBox_your_collection_ringleaders_button()
	return UIBox_button({
		-- TODO: Uncomment line below once your_collection_ringleaders is implemented.
		-- button = 'your_collection_ringleaders',
		label = { localize('b_ringleaders') },
		count = G.DISCOVER_TALLIES.ringleaders,
		minw = 5,
		minh = 1.7,
		scale = 0.6,
		id = 'your_collection_ringleaders',
	})
end

-- Renders the Ringleaders Collection view.
function RingleaderUI.create_UIBox_your_collection_ringleaders()
	local deck_tables = {}

	G.your_collection = {}

	table.insert(deck_tables, {})
	
	-- TODO: Finish implementation.
end

local create_collection_ref = create_UIBox_your_collection

-- Overwrites the global create_UIBox_your_collection to render the Rindleaders button.
function create_UIBox_your_collection()
  local contents = create_collection_ref()
	local buttons_container = contents.nodes[1].nodes[1].nodes[1].nodes[1].nodes
	local insertion_index = 2 -- Insert button at second position 
	local button = RingleaderUI.create_UIBox_your_collection_ringleaders_button()
	
  table.insert(buttons_container, insertion_index, button)
  
	return contents
end