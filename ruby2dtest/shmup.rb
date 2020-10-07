require 'ruby2d'

V = 2

set title: 'SHMUP', width: 320, height: 480

player_sprite = Sprite.new(
    'shmup_player_sprites.png',
    clip_width: 32, time: 250, width: 32, height: 48,
    animations: {straight:  0..1, roll_left: 2..3})

@vx = @vy = 0
player_sprite.x = (Window.width  - player_sprite.clip_width) / 2
player_sprite.y =  Window.height - player_sprite.clip_height

def launch_projectile

end

on :key_held do |event|
  case event.key
  when 'a'
    @vx = -V
    player_sprite.play animation: :roll_left, loop: true
  when 'd'
    @vx =  V
    player_sprite.play animation: :roll_left, loop: true, flip: :horizontal
  end
end

update do
  player_sprite.x += @vx
  if @vx == 0 then player_sprite.play animation: :straight, loop:true end
  @vx = 0
end

show
