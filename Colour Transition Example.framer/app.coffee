module = require "colourTransition"

background = new BackgroundLayer backgroundColor: 'rgba(40, 193, 204, 1)'

# List of button colours
colours = ['rgba(40, 193, 204, 1)', 'rgba(41, 166, 224, 1)' ,'rgba(235, 114, 120, 1)', 'rgba(151, 133, 221, 1)' ,'rgba(77, 75, 76, 1)']

# Layer for grouping and centering buttons
buttons = new Layer backgroundColor : "transparent"
buttons.width = 580
buttons.height = 200
buttons.center()
buttons.y = buttons.y + 580

# Set variables for placement and last button pressed
placement = 0
lastButton = null

# Create buttons
for colour in colours
	button = new Layer backgroundColor : "#FFF"
	button.colour = colour
	
	# Set button position
	button.x = placement
	
	# Set button colour and styling
	button.buttonColour = new Layer backgroundColor : colour
	button.buttonColour.superLayer = button
	button.buttonColour.width = button.width/1.64
	button.buttonColour.height = button.width/1.64
	button.buttonColour.center()
	button.buttonColour.borderRadius = button.buttonColour.width/2
	button.borderRadius = button.width/2
	button.shadowColor = 'rgba(0, 0, 0, .1)'
	button.shadowX = 4
	button.shadowY = 4
	button.shadowBlur = 16
	
	# Set in container layer
	button.superLayer = buttons
	
	# Set click behavior of buttons using colour transition module
	button.on Events.Click, (event, button)->
		module.colourTransition(background, button.colour, 1, 60)
		button.buttonColour.animate({
			properties: {scale:0.4}
			time: .6
		})
		
		# Toggle previous button
		if lastButton?
			lastButton.animate({
				properties: {scale:1}
				time: .6
				})
		lastButton = button.buttonColour
		
	# Increment placment variable
	placement = placement + 120
