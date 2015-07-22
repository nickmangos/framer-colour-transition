# Framer Colour Transition Module 
A framer module that transitions the background colour of a layer.

Allows you to use the ```colourTransition()``` function.
The function accepts 4 parameters.

1. layer name
2. colour (rgba)
3. duration (in seconds)
4. Frames per second (optional)

Example 
```module.colourTransition(background, 'rgba(255, 136, 116, 1)', 1, 30)```

This will transition a layer called "background" from its original rgba colour to the new colour with a 1 second duration.

The frames per second parameter is optional; it will default to 30fps 

To use this module add ```module = require "colourTransition"``` to the head of your project.
