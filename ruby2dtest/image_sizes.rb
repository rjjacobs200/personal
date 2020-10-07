require 'ruby2d'

SCALING_FACTOR   = 4.0
TILE_SIZE_ORIG   = 16
TILE_SIZE_SCALED = TILE_SIZE_ORIG * SCALING_FACTOR
VELOCITY         = 5 * SCALING_FACTOR


set resizable: true, width: 1200, height: 800
@world = Image.new 'Cherrygrove_City_HGSS.webp'

@world.width, @world.height = @world.width * SCALING_FACTOR, @world.height * SCALING_FACTOR

@moving   = false
@vx = @vy = 0

def move_north
	@moving = true
	@vx = 0
	@vy = -VELOCITY
end

def move_west
	@moving = true
	@vx = -VELOCITY
	@vy = 0
end

def move_south
	@moving = true
	@vx = 0
	@vy = VELOCITY	
end

def move_east
	@moving = true
	@vx = VELOCITY
	@vy = 0
end

on :key_held do |event|
	unless @moving
		case event.key
		when 'w'
			move_north
		when 'a'
			move_west
		when 's'
			move_south
		when 'd'
			move_east
		end
	end
end

def in_center_of_tile
	@world.x % TILE_SIZE_SCALED == 0 && @world.y % TILE_SIZE_SCALED == 0
end

def stop_walking() 
	@vx = @vy = 0
	@moving = false
end

update do
	@world.x, @world.y = @world.x - @vx, @world.y - @vy
	if in_center_of_tile then stop_walking end
end

show