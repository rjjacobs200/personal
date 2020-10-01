require 'ruby2d'

set title: 'Walking Sprite Test', background: 'gray', width: 800, height: 800

@tile_size = 100
@velocity  = 5

@trump = Sprite.new(
	'trump_run.png',
	animations: {
		stand: [
			{x: 100, y: 0, width: 100, height: 100}
		]
	}
)

@v_x = @v_y = 0

on :key_held do |event|
	case event.key
	when 'w'
		@v_x, @v_y = 0, -@velocity if @v_x == 0 && @v_y == 0
	when 'a'
		@v_x, @v_y = -@velocity, 0 if @v_x == 0 && @v_y == 0
	when 's'
		@v_x, @v_y = 0, @velocity  if @v_x == 0 && @v_y == 0
	when 'd'
		@v_x, @v_y = @velocity, 0  if @v_x == 0 && @v_y == 0
	end
end

update do
	@trump.x += @v_x
	@trump.y += @v_y


	@v_x = 0 if (@trump.x % @tile_size == 0) && !(@trump.x >= Window.width  || @trump.x < 0)
	@v_y = 0 if (@trump.y % @tile_size == 0) && !(@trump.y >= Window.height || @trump.y < 0)

	@trump.x = (@trump.x + @trump.clip_width ) % (Window.width  + @trump.clip_width ) - @trump.clip_width
	@trump.y = (@trump.y + @trump.clip_height) % (Window.height + @trump.clip_height) - @trump.clip_height

end

@trump.play animation: :stand, loop: true

show






