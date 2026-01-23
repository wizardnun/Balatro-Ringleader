-- Button callback for Collection Ringleaders button.
function G.FUNCS.your_collection_ringleaders(e)
  G.SETTINGS.paused = true
	local t = RingleaderUI.create_UIBox_your_collection_ringleaders()
  G.FUNCS.overlay_menu{definition = t}
end

-- Page callback for navigating between pages
function G.FUNCS.your_collection_ringleader_page(args)
  if not args or not args.cycle_config then return end
  for j = 1, #G.your_collection do
    for i = #G.your_collection[j].cards,1, -1 do
      local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
      c:remove()
      c = nil
    end
  end
  for i = 1, 5 do
    for j = 1, #G.your_collection do
      local center = G.P_CENTER_POOLS["Ringleader"][i+(j-1)*5 + (5*#G.your_collection*(args.cycle_config.current_option - 1))]
      if not center then break end
      local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center)
      --card.sticker = get_joker_win_sticker(center)
      G.your_collection[j]:emplace(card)
    end
  end
  INIT_COLLECTION_CARD_ALERTS()
end