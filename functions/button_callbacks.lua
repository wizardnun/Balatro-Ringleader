-- Button callback for Collection Ringleaders button.
function G.FUNCS.your_collection_ringleaders(e)
  G.SETTINGS.paused = true

	local t = RingleaderUI.create_UIBox_your_collection_ringleaders()

  G.FUNCS.overlay_menu{definition = t}
end