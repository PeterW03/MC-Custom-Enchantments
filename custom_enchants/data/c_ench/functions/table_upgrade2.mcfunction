# Desc: sets up the upgraded smithing tables (Part 2, after the armor stand has centered)
#
# Called by: c_ench:tick

# Kill ourselves if the table got moved or broken (And return the nether star)
execute if block ~ ~-1 ~ air run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:nether_star",Count:1b}}
execute if block ~ ~-1 ~ air run kill @s

# Visual effects
particle minecraft:portal ~ ~-0.5 ~ 0 0 0 0.2 4

# Snap items to enchant to us
execute unless entity @e[type=item, distance=..0.01, scores={ench_itemTrack=6..}] run tp @e[type=item,limit=1,distance=..1, scores={ench_itemTrack=6..}] @s
tp @e[type=item, distance=..1, scores={ench_itemTrack=2}] ~0.5 ~ ~
tp @e[type=item, distance=..1, scores={ench_itemTrack=3}] ~-0.5 ~ ~
tp @e[type=item, distance=..1, scores={ench_itemTrack=4}] ~ ~ ~0.5
tp @e[type=item, distance=..1, scores={ench_itemTrack=5}] ~ ~ ~-0.5
