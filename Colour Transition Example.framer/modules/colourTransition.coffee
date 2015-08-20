exports.colourTransition = (layer, colour, duration, fps) ->
	oldColour = null
	newColour = null
	# set old and new colours as variables
	oldColour = layer.backgroundColor
	newColour = colour
	oldColour = oldColour.substring(5, oldColour.length - 1)
	oldColour = oldColour.split(', ')
	newColour = newColour.substring(5, newColour.length - 1)
	newColour = newColour.split(', ')
	
	r = parseFloat(oldColour[0])
	g = parseFloat(oldColour[1])
	b = parseFloat(oldColour[2])
	a = parseFloat(oldColour[3])
	
	# Calculates the difference between the two colours
	rDiff = oldColour[0] - newColour[0]
	gDiff = oldColour[1] - newColour[1]
	bDiff = oldColour[2] - newColour[2]
	aDiff = oldColour[3] - newColour[3]
	
	# Sets a frame default
	if fps == undefined
		fps = 30
		
	# Calculate the increments
	rDiff = rDiff / (fps * duration)
	gDiff = gDiff / (fps * duration)
	bDiff = bDiff / (fps * duration)
	aDiff = aDiff / (fps * duration)
	## print "(rDiff Increments)" + rDiff + "(gDiff Increments)" + gDiff + "(bDiff Increments)" + bDiff + "(aDiff Increments)" + aDiff
	i = 0
	myInterval = null
	startInterval = ->
		myInterval = Utils.interval (1/fps), ->
			i++
			r = r - rDiff
			g = g - gDiff
			b = b - bDiff
			a = a - aDiff
			# Numbers have to be whole to regester as a proper RGB value. 
			# Render colour using the changing variable.
			layer.backgroundColor = 'rgba('+Math.round(r)+', '+Math.round(g)+', '+Math.round(b)+', '+a+')'
			if i >= (fps*duration)
				clearInterval(myInterval)
			## print i + "(R)" + Math.round(r) + "(G)" + Math.round(g) + "(B)" + Math.round(b) + "(A)" + a
	startInterval()
	## TODO
	## Fix split string issue.
	## Set the true colour value after fade ends.
	## Ability to stop mid-fade.
	## Remove the need to set the original colour as rgba
