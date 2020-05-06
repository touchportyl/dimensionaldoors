gamerule commandBlockOutput false


# initialize

scoreboard objectives remove DD_init
scoreboard objectives add DD_init dummy [{"text":"Initialize Checker for Dimensional Doors","color":"light_purple"}]


# loading

tellraw @a [{"text":"<"},{"text":" PRTL ","color":"red","bold":"true"},{"text":">"},{"text":" Loading the "},{"text":"[Dimensional Doors]","color":"aqua","hoverEvent":{"action":"show_text","value":"v1.0"}},{"text":" datapack..."}]


gamerule commandBlockOutput true