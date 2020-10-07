require 'ruby2d'

set title: 'Walking Sprite Test', background: 'gray', width: 800, height: 800

@tile_size  = 100
@velocity   = 2



@v_x = @v_y = 0
@trump_btwn_tiles = false

def walking_time() (@tile_size * 1000.0) / (@velocity * 60.0) end #returns number of frames spent walking

@trump = Sprite.new(
	'trump_run.png', width: 100, height: 100, clip_width: 100, clip_height: 100, time: -20 + walking_time / 6.0,
	animations: {
		walk_south: 1..6,
		walk_north: [{x: 0, y: 200}, {x: 100, y: 200}, {x: 200, y: 200}, {x: 300, y: 200}, {x: 400, y: 200}, {x: 500, y: 200}]
	}
)

on :key_held do |event|
	unless @trump_btwn_tiles
		case event.key
		when 'w'
			@v_x, @v_y = 0, -@velocity
			@trump_btwn_tiles = true
			@trump.play animation: :walk_north, loop: false
		when 'a'
			@v_x, @v_y = -@velocity, 0 
			@trump_btwn_tiles = true
		when 's'
			@v_x, @v_y = 0, @velocity  
			@trump_btwn_tiles = true
			@trump.play animation: :walk_south, loop: false
		when 'd'
			@v_x, @v_y = @velocity, 0 
			@trump_btwn_tiles = true 
		end
	end
end

update do
	
	@trump.x += @v_x
	@trump.y += @v_y

	@trump_btwn_tiles = (
		(!(@trump.x % @tile_size == 0) || (@trump.x >= Window.width  || @trump.x < 0)) || 
		(!(@trump.y % @tile_size == 0) || (@trump.y >= Window.height || @trump.y < 0))
	)

	@v_x = @v_y = 0 unless @trump_btwn_tiles

	if @trump.x >= Window.width  then end
	if @trump.x < 0              then end
	if @trump.y >= Window.height then @trump.play animation: :walk_south end
	if @trump.y < 0              then @trump.play animation: :walk_north end
	
	@trump.x = (@trump.x + @trump.clip_width ) % (Window.width  + @trump.clip_width)  - @trump.clip_width  
	@trump.y = (@trump.y + @trump.clip_height) % (Window.height + @trump.clip_height) - @trump.clip_height 

end

show
