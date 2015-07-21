module = require "colourTransition"

background = new BackgroundLayer backgroundColor: 'rgba(255, 206, 31, 1)'

background.on Events.Click, ->
	module.colourTransition(background, 'rgba(255, 136, 116, 1)', 1, 30)
	
