
# Scale all content by 50%
Framer.Device.contentScale = 0.33

background = new BackgroundLayer backgroundColor: 'rgba(244, 136, 121, 1)'



background.on Events.Click, ->
	colourTransition(background, 'rgba(133, 210, 149, 1)', 2)
	
colourTransition = (layer, colour, duration) ->
	# set old and new colours as variables
	oldColour = background.backgroundColor
	newColour = colour
	oldColour = oldColour.substring(5, oldColour.length - 1)
	oldColour = oldColour.split(', ')
	newColour = newColour.substring(5, newColour.length - 1)
	newColour = newColour.split(', ')
	print layer
	print duration
	print oldColour
	print newColour 
	background.backgroundColor = colour
	
myInterval = null
i = 0
startInterval = ->
	print "Go!"
	myInterval = Utils.interval 0.033, ->
		i = i + 
		background.backgroundColor = 'rgba('+i+', 210, 149, 1)'
		print i
		if i > 255
			clearInterval(myInterval)
startInterval()
			