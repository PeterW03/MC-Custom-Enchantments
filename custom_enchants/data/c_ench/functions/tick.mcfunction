# Desc: Calls enchantment functions if required
#
# Called by: #minecraft:tick

# Track who has the custom enchants
execute as @a store result score @s ench_helm run data get entity @s Inventory[{Slot:103b}].tag.ench
execute as @a store result score @s ench_chest run data get entity @s Inventory[{Slot:102b}].tag.ench
execute as @a store result score @s ench_legs run data get entity @s Inventory[{Slot:101b}].tag.ench
execute as @a store result score @s ench_boot run data get entity @s Inventory[{Slot:100b}].tag.ench

# Update our dummy trackers
execute as @a store result score @s ench_falling run data get entity @s FallDistance
execute as @a store result score @s ench_hurt run data get entity @s HurtTime

# Track stuff for the smithing table upgrade
scoreboard players set @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] isNetherStar 1

# Do the effects
# Helmet
execute if entity @a[scores={ench_helm=1..}] run function c_ench:helm
# Chestplate
execute if entity @a[scores={ench_chest=1..}] run function c_ench:chest
# Leggings
execute if entity @a[scores={ench_legs=1..}] run function c_ench:legs
# Boots
execute if entity @a[scores={ench_boot=1..}] run function c_ench:boot

# Smithing table upgrades (Weird order for tick ordering)
# Part 2
execute as @e[tag=smithing_table_exec] at @s run function c_ench:table_upgrade2
# Part 1
execute as @e[scores={isNetherStar=1}] at @s if block ~ ~-1 ~ minecraft:smithing_table run function c_ench:table_upgrade