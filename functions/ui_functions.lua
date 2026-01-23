---@class RingleaderUI
RingleaderUI = RingleaderUI or {}

-- Creates a Collection Ringleaders Button node.
function RingleaderUI.create_UIBox_your_collection_ringleaders_button()
	return UIBox_button({
		-- TODO: Uncomment line below once your_collection_ringleaders is implemented.
		button = 'your_collection_ringleaders',
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
	for j = 1, 2 do
    	G.your_collection[j] = CardArea(
    		G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
      		5*G.CARD_W,
      		0.95*G.CARD_H, 
      		{card_limit = 5, type = 'title', highlight_limit = 0, collection = true})
    	table.insert(deck_tables, 
    	{n=G.UIT.R, config={align = "cm", padding = 0.07, no_fill = true}, nodes={
      	{n=G.UIT.O, config={object = G.your_collection[j]}}
    }}
    )
  end

	local ringleader_options = {}
	for i = 1, math.ceil(#G.P_CENTER_POOLS.Ringleader/(5*#G.your_collection)) do
    	table.insert(ringleader_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(#G.P_CENTER_POOLS.Ringleader/(5*#G.your_collection))))
  	end

	for i = 1, 5 do
    	for j = 1, #G.your_collection do
      		local center = G.P_CENTER_POOLS["Ringleader"][i+(j-1)*5]
			if not center then break end
      		local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, nil, center)
      		-- card.sticker = get_joker_win_sticker(center)
      		G.your_collection[j]:emplace(card)
    	end
  	end

	INIT_COLLECTION_CARD_ALERTS()

	local t =  create_UIBox_generic_options({ back_func = 'your_collection', contents = {
    	{n=G.UIT.R, config={align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables}, 
    	{n=G.UIT.R, config={align = "cm"}, nodes={
        	create_option_cycle({options = ringleader_options, w = 4.5, cycle_shoulders = true, opt_callback = 'your_collection_ringleader_page', current_option = 1, colour = G.C.RED, no_pips = true, focus_args = {snap_to = true, nav = 'wide'}})
    	}}
    }})
	return t
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