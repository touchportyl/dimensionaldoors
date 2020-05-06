gamerule commandBlockOutput false


# initialize successful

scoreboard players set @a DD_init 1

tellraw @a[scores={DD_init=1}] [{"text":"<"},{"text":" PRTL ","color":"red","bold":"true"},{"text":">"},{"text":" Loaded the "},{"text":"[Dimensional Doors]","color":"aqua","hoverEvent":{"action":"show_text","value":"Created by touchportal!"}},{"text":" datapack successfully!"}]

execute as @a[scores={DD_init=1}] run scoreboard objectives remove DD_init


# door orientation detection and creation

#if floor + door + not on portal marker, add tag
execute in minecraft:overworld as @e[type=minecraft:item,name=Conduit,nbt={OnGround:1b}] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true] unless entity @e[type=minecraft:area_effect_cloud,tag=DD_portal,distance=..1] run tag @s add DD_generator


#if tag, create portal marker
execute in minecraft:overworld as @e[type=minecraft:item,tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_left","DD_NS","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute in minecraft:overworld as @e[type=minecraft:item,tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_left","DD_NS","DD_new","DD_close"],Rotation:[180f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute in minecraft:overworld as @e[type=minecraft:item,tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_left","DD_EW","DD_new","DD_close"],Rotation:[90f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute in minecraft:overworld as @e[type=minecraft:item,tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=left] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_left","DD_EW","DD_new","DD_close"],Rotation:[270f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute in minecraft:overworld as @e[type=minecraft:item,tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_right","DD_NS","DD_new","DD_close"],Rotation:[0f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute in minecraft:overworld as @e[type=minecraft:item,tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_right","DD_NS","DD_new","DD_close"],Rotation:[180f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}

execute in minecraft:overworld as @e[type=minecraft:item,tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_right","DD_EW","DD_new","DD_close"],Rotation:[90f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}
execute in minecraft:overworld as @e[type=minecraft:item,tag=DD_generator] at @s align xyz if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=right] run summon minecraft:area_effect_cloud ~0.5 ~ ~0.5 {Tags:["DimensionalDoors","DD_portal","DD_right","DD_EW","DD_new","DD_close"],Rotation:[270f,0f],Age:-2147483648,Duration:-1,WaitTime:-2147483648}


#if new, remove tag item
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_new] at @s run kill @e[type=minecraft:item,tag=DD_generator,distance=..1,limit=1]


#if new, remove new
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_new] at @s run tag @s remove DD_new


# door particles

execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.12 0.12 0.02 0 50 force
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.12 0.26 0.02 0 350 force
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_NS] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:portal ~ ~ ~ 0.12 0.26 0.02 0.35 1 normal

execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.7 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=false] run particle minecraft:underwater ~ ~ ~ 0.02 0.12 0.12 0 50 force
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:underwater ~ ~ ~ 0.02 0.26 0.12 0 350 force
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_EW] at @s positioned ^ ^1.1 ^0.425 if block ~ ~ ~ minecraft:oak_door[open=true] run particle minecraft:portal ~ ~ ~ 0.02 0.26 0.12 0.35 1 normal


# portal detection

execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.2 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.2 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.45 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.45 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.7 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.7 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^0.95 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^0.95 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_left] at @s positioned ^0.5 ^1.2 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_left] at @s positioned ^0.15 ^1.2 ^0.425 run tag @e[distance=..0.3] add DD_enter

execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.2 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.2 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.45 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.45 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.7 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.7 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^0.95 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^0.95 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_right] at @s positioned ^-0.5 ^1.2 ^0.425 run tag @e[distance=..0.3] add DD_enter
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_right] at @s positioned ^-0.15 ^1.2 ^0.425 run tag @e[distance=..0.3] add DD_enter


# portal execution

#close door
execute in minecraft:overworld as @e[tag=DD_enter] at @s run tag @e[type=minecraft:area_effect_cloud,tag=DD_portal,sort=nearest,limit=1] add DD_close

#teleport player
execute in minecraft:overworld as @e[tag=DD_enter] at @s run spreadplayers ~ ~ 0 100 false @s

#play teleport and closing door sound
execute in minecraft:overworld as @e[tag=DD_enter] at @s run playsound minecraft:item.chorus_fruit.teleport player @s ~ ~ ~ 1 1 1
execute in minecraft:overworld as @e[tag=DD_enter] at @s run playsound minecraft:block.wooden_door.close block @s ~ ~ ~ 1 1 1


# door closing

execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=north,hinge=left] replace
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=south,hinge=left] replace
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=east,hinge=left] replace
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=left] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=west,hinge=left] replace

execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=north,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=north,hinge=right] replace
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=south,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=south,hinge=right] replace
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=east,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=east,hinge=right] replace
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_close] at @s if block ~ ~ ~ minecraft:oak_door[open=true,facing=west,hinge=right] run setblock ~ ~ ~ minecraft:oak_door[open=false,facing=west,hinge=right] replace

execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal,tag=DD_close] at @s run playsound minecraft:block.wooden_door.close block @a ~ ~ ~ 1 1 1


# door removal

#if no door, remove portal marker
execute in minecraft:overworld as @e[type=minecraft:area_effect_cloud,tag=DD_portal] at @s if block ~ ~ ~ minecraft:air run kill @s


# clear cache

#if tag, remove tag
execute in minecraft:overworld as @e[tag=DD_enter] run tag @s remove DD_enter
execute in minecraft:overworld as @e[tag=DD_close] run tag @s remove DD_close


gamerule commandBlockOutput true