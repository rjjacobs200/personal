require 'ruby2d'

move_distance = 5

set background: 'gray', title: "Image Test"

@ethan = Image.new 'ethan_soulsilver.png'

on :key_down do |event|
	case event.key
	when 'w'
		@ethan.y -= move_distance
	when 'a'
		@ethan.x -= move_distance
	when 's'
		@ethan.y += move_distance
	when 'd'
		@ethan.x += move_distance
	end
end

update do
	@ethan.x = (@ethan.x + @ethan.width)  % (Window.width  + @ethan.width)  - @ethan.width
	@ethan.y = (@ethan.y + @ethan.height) % (Window.height + @ethan.height) - @ethan.height
end

show