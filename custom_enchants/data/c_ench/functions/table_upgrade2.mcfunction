# Desc: sets up the upgraded smithing tables (Part 2, after the armor stand has centered)
#
# Called by: c_ench:tick

# Remove ourselves if the table got moved or broken (And return the nether star)
execute if block ~ ~-1 ~ air run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:nether_star",Count:1b}}
execute if block ~ ~-1 ~ air run kill @s

# Visual effects
particle minecraft:portal ~ ~-0.5 ~ 0 0 0 0.2 4

# Snap items to enchant to us
execute unless entity @e[type=item, distance=..0.2, scores={ench_itemTrack=6..}] run tp @e[type=item,limit=1,distance=..1, scores={ench_itemTrack=6..}] ~ ~0.1 ~
tp @e[type=item, distance=..1.5, scores={ench_itemTrack=2}] ~0.4 ~0.1 ~
tp @e[type=item, distance=..1.5, scores={ench_itemTrack=3}] ~-0.4 ~0.1 ~
tp @e[type=item, distance=..1.5, scores={ench_itemTrack=4}] ~ ~0.1 ~0.4
tp @e[type=item, distance=..1.5, scores={ench_itemTrack=5}] ~ ~0.1 ~-0.4


# Count how many items are snapped to us
scoreboard players set @s ench_itemCount 0
execute as @e[type=item,distance=..1.5,scores={ench_itemTrack=2..5}] run scoreboard players add @e[tag=smithing_table_exec,distance=..1.5,limit=1] ench_itemCount 1
execute if entity @s[scores={ench_itemCount=4}] if entity @e[type=item, scores={ench_itemTrack=6..}, distance=..1.5] run function c_ench:table_enchant
