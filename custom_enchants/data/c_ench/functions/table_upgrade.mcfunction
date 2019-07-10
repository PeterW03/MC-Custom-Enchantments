# Desc: sets up the upgraded smithing tables (Part 1, we have to wait a tick for the armor stand to center)
#
# Called by: c_ench:tick

execute as @s run summon minecraft:item_frame ~ ~-1 ~ {Tags:["smithing_table"]}
execute as @s run tp @s @e[tag=smithing_table,limit=1,distance=..1]
execute as @s run summon armor_stand ~ ~ ~ {Tags:["smithing_table2", "smithing_table_exec"], Invisible:1b, Marker:1b}
execute as @s run tp @e[tag=smithing_table2,limit=1] @e[tag=smithing_table,limit=1]
execute as @s run kill @e[tag=smithing_table]
execute as @s run tag @e remove smithing_table2
execute as @s run kill @s
