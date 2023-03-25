pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--fruit drop
--by nerdy teachers

basket_sprite=1

player_sprite=2
player_x=64
player_y=100

fruits={}
fruit_start=16
fruit_count=6
fruit_interval=16

gravity=1.5

level=1
points=0



function _init()
  for i=1,level do
    fruit={
      sprite=flr(rnd(fruit_count)+fruit_start),
      x=flr(rnd(120)+5),
      y=i*(-fruit_interval)
    }
    add(fruits,fruit)
  end
  sfx(0)
    
end

function _update()
  if btn(0) then player_x-=2 end
  if btn(1) then player_x+=2 end

  for fruit in all(fruits) do
    fruit.y+=gravity
    
    if fruit.y+4>player_y-8
    and fruit.y+4<player_y
    and fruit.x+4>player_x
    and fruit.x+4<player_x+8 then
      points+=1
      del(fruits,fruit)
    end
    
    if fruit.y>100 then
      points-=1
      del(fruits,fruit)
    end
  end
  
  if #fruits==0 then
    level+=1
    _init()
  end
  
end

function _draw()
  cls()
  rectfill(0,108,127,127,11)
  spr(player_sprite,player_x,player_y)
  spr(basket_sprite,player_x,player_y-8)

  for fruit in all(fruits) do
    spr(fruit.sprite,fruit.x,fruit.y)
  end

  print("score="..points)
end
__gfx__
000000000f000000000ff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000fff7007f0888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700cff7007ff088880f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700044fffffff008800f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770004444fffff088880f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007004444fff00011110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000044ff000010010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000ff000550055000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00400000000000000000ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00a4000000008000000f88f000000990009a9a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a8a40000078000000f88ff000009990009a9a00004ff00000000000000000000000000000000000000000000000000000000000000000000000000000000000
08aaa40007770e000f88fff000099900008a98000fff4f0000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aaa8a000777eee0f88fff00009990000088880004fff40000000000000000000000000000000000000000000000000000000000000000000000000000000000
0a8aa0000cccccc0f8fff00000f90000008888000fffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aa8000000cccc000ff000000f0000000008800000f4f00000000000000000000000000000000000000000000000000000000000000000000000000000000000
00a00000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaa33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666666666666666666666666666666666666666666666aaaaaaaa
aaaaaaaa33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666666666666666666666666666666666666666666666aaaaaaaa
aaaaaaaa33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666666666666666666666666666666666666666666666aaaaaaaa
aaaaaaaa33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666666666666666666666666666666666666666666666aaaaaaaa
aaaaaaaa33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666666666666666666666666666666666666666666666aaaaaaaa
aaaaaaaa33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666666666666666666666666666666666666666666666aaaaaaaa
aaaaaaaa33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666666666666666666666666666666666666666666666aaaaaaaa
aaaaaaaa33333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666666666666666666666666666666666666666666666aaaaaaaa
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa7777777700000000000000000000000000000000000000000000000066666666
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa7777777700000000000000000000000000000000000000000000000066666666
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa7777777700000000000000000000000000000000000000000000000066666666
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa7777777700000000000000000000000000000000000000000000000066666666
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa7777777700000000000000000000000000000000000000000000000066666666
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa7777777700000000000000000000000000000000000000000000000066666666
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa7777777700000000000000000000000000000000000000000000000066666666
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa7777777700000000000000000000000000000000000000000000000066666666
88888888eeeeeeee888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666677777777777777777777777777777777777777777777777755555555
88888888eeeeeeee888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666677777777777777777777777777777777777777777777777755555555
88888888eeeeeeee888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666677777777777777777777777777777777777777777777777755555555
88888888eeeeeeee888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666677777777777777777777777777777777777777777777777755555555
88888888eeeeeeee888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666677777777777777777777777777777777777777777777777755555555
88888888eeeeeeee888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666677777777777777777777777777777777777777777777777755555555
88888888eeeeeeee888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666677777777777777777777777777777777777777777777777755555555
88888888eeeeeeee888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666677777777777777777777777777777777777777777777777755555555
8888888888888888888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000666666660000000055555555
8888888888888888888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000666666660000000055555555
8888888888888888888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000666666660000000055555555
8888888888888888888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000666666660000000055555555
8888888888888888888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000666666660000000055555555
8888888888888888888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000666666660000000055555555
8888888888888888888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000666666660000000055555555
8888888888888888888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000666666660000000055555555
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666660000000066666666000000006666666600000000dddddddd55555555
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666660000000066666666000000006666666600000000dddddddd55555555
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666660000000066666666000000006666666600000000dddddddd55555555
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666660000000066666666000000006666666600000000dddddddd55555555
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666660000000066666666000000006666666600000000dddddddd55555555
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666660000000066666666000000006666666600000000dddddddd55555555
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666660000000066666666000000006666666600000000dddddddd55555555
aaaaaaaa888888888888888888888888aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa666666660000000066666666000000006666666600000000dddddddd55555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000dddddddd0000000055555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000dddddddd0000000055555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000dddddddd0000000055555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000dddddddd0000000055555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000dddddddd0000000055555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000dddddddd0000000055555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000dddddddd0000000055555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666666666666000000006666666600000000dddddddd0000000055555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666600000000dddddddd00000000dddddddd000000005555555555555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666600000000dddddddd00000000dddddddd000000005555555555555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666600000000dddddddd00000000dddddddd000000005555555555555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666600000000dddddddd00000000dddddddd000000005555555555555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666600000000dddddddd00000000dddddddd000000005555555555555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666600000000dddddddd00000000dddddddd000000005555555555555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666600000000dddddddd00000000dddddddd000000005555555555555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa6666666600000000dddddddd00000000dddddddd000000005555555555555555
aaaaaaaaaaaaaaaaaaaaaaaa4444444433333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaa555555555555555555555555555555555555555555555555aaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaa4444444433333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaa555555555555555555555555555555555555555555555555aaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaa4444444433333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaa555555555555555555555555555555555555555555555555aaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaa4444444433333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaa555555555555555555555555555555555555555555555555aaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaa4444444433333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaa555555555555555555555555555555555555555555555555aaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaa4444444433333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaa555555555555555555555555555555555555555555555555aaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaa4444444433333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaa555555555555555555555555555555555555555555555555aaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaa4444444433333333bbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaa555555555555555555555555555555555555555555555555aaaaaaaa
aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbaaaaaaaa33333333bbbbbbbbaaaaaaaaffffffffaaaaaaaa44444444444444444444444444444444aaaaaaaaffffffff
aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbaaaaaaaa33333333bbbbbbbbaaaaaaaaffffffffaaaaaaaa44444444444444444444444444444444aaaaaaaaffffffff
aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbaaaaaaaa33333333bbbbbbbbaaaaaaaaffffffffaaaaaaaa44444444444444444444444444444444aaaaaaaaffffffff
aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbaaaaaaaa33333333bbbbbbbbaaaaaaaaffffffffaaaaaaaa44444444444444444444444444444444aaaaaaaaffffffff
aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbaaaaaaaa33333333bbbbbbbbaaaaaaaaffffffffaaaaaaaa44444444444444444444444444444444aaaaaaaaffffffff
aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbaaaaaaaa33333333bbbbbbbbaaaaaaaaffffffffaaaaaaaa44444444444444444444444444444444aaaaaaaaffffffff
aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbaaaaaaaa33333333bbbbbbbbaaaaaaaaffffffffaaaaaaaa44444444444444444444444444444444aaaaaaaaffffffff
aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbaaaaaaaa33333333bbbbbbbbaaaaaaaaffffffffaaaaaaaa44444444444444444444444444444444aaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
aaaaaaaabbbbbbbb77777777bbbbbbbbbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaffffffffaaaaaaaaffffffffffffffffffffffffffffffffaaaaaaaaffffffff
bbbbbbbb77777777bbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaa888888888888888888888888ffffffffffffffff888888888888888888888888
bbbbbbbb77777777bbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaa888888888888888888888888ffffffffffffffff888888888888888888888888
bbbbbbbb77777777bbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaa888888888888888888888888ffffffffffffffff888888888888888888888888
bbbbbbbb77777777bbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaa888888888888888888888888ffffffffffffffff888888888888888888888888
bbbbbbbb77777777bbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaa888888888888888888888888ffffffffffffffff888888888888888888888888
bbbbbbbb77777777bbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaa888888888888888888888888ffffffffffffffff888888888888888888888888
bbbbbbbb77777777bbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaa888888888888888888888888ffffffffffffffff888888888888888888888888
bbbbbbbb77777777bbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaa888888888888888888888888ffffffffffffffff888888888888888888888888
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88888888888888888888888888888888aaaaaaaaaaaaaaaa
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88888888888888888888888888888888aaaaaaaaaaaaaaaa
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88888888888888888888888888888888aaaaaaaaaaaaaaaa
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88888888888888888888888888888888aaaaaaaaaaaaaaaa
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88888888888888888888888888888888aaaaaaaaaaaaaaaa
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88888888888888888888888888888888aaaaaaaaaaaaaaaa
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88888888888888888888888888888888aaaaaaaaaaaaaaaa
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa88888888888888888888888888888888aaaaaaaaaaaaaaaa
33333333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaa
33333333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaa
33333333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaa
33333333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaa
33333333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaa
33333333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaa
33333333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaa
33333333bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb33333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaa
aaaaaaaa33333333333333333333333333333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaa
aaaaaaaa33333333333333333333333333333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaa
aaaaaaaa33333333333333333333333333333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaa
aaaaaaaa33333333333333333333333333333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaa
aaaaaaaa33333333333333333333333333333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaa
aaaaaaaa33333333333333333333333333333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaa
aaaaaaaa33333333333333333333333333333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaa
aaaaaaaa33333333333333333333333333333333aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaaccccccccaaaaaaaaaaaaaaaa

