# Desc: sets up the upgraded smithing tables (Part 2, after the armor stand has centered)
#
# Called by: c_ench:tick

execute if block ~ ~-1 ~ air run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:nether_star",Count:1b}}
execute if block ~ ~-1 ~ air run kill @s
particle minecraft:portal ~ ~-0.5 ~ 0 0 0 0.2 4