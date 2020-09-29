require 'ruby2d'

#Window Title
set title: "My test window"

#Testing out the background color
set background: 'navy'

#Will produce a gradient-colored triangle
Triangle.new x1: 320, y1: 50, x2: 540, y2: 430, x3: 100, y3: 430, color: ['red', 'green', 'blue']

#Going borderless?
set borderless: true

#Display the window
show