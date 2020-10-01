require 'ruby2d'

set title: 'Moving Things', background: 'black'

@square = Square.new size:25, color: 'white'

@v_x = @v_y = 0

on :key_down do |event|
	case event.key
	when 'w'
		@v_x, @v_y = 0, -2
	when 'a'
		@v_x, @v_y = -2, 0
	when 's'
		@v_x, @v_y = 0, 2
	when 'd'
		@v_x, @v_y = 2, 0
	end
end

update do
	@square.x += @v_x
	@square.y += @v_y

	@square.x = (@square.x + 25) % (Window.width  + 25) - 25
	@square.y = (@square.y + 25) % (Window.height + 25) - 25
end

show