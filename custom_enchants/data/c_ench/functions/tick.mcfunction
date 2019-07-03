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
# # # Ids
# 0 - Not Tracking (Set all to this, overwrite later for correct items)
# 1 - Nether Star
# 2 - Bottle O' Enchanting
# 3 - Blaze Rod
# 4 - Ender Pearl
# 5 - Glowstone dust
# 6+ - Enchantable items
# # #
scoreboard players set @e[type=minecraft:item] ench_itemTrack 0
scoreboard players set @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] ench_itemTrack 1
scoreboard players set @e[type=minecraft:item,nbt={Item:{id:"minecraft:experience_bottle",Count:1b}}] ench_itemTrack 2
scoreboard players set @e[type=minecraft:item,nbt={Item:{id:"minecraft:blaze_rod",Count:1b}}] ench_itemTrack 3
scoreboard players set @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_pearl",Count:1b}}] ench_itemTrack 4
scoreboard players set @e[type=minecraft:item,nbt={Item:{id:"minecraft:glowstone_dust",Count:1b}}] ench_itemTrack 5
scoreboard players set @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_helmet",Count:1b}}] ench_itemTrack 6
scoreboard players set @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_chestplate",Count:1b}}] ench_itemTrack 7
scoreboard players set @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_leggings",Count:1b}}] ench_itemTrack 8
scoreboard players set @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond_boots",Count:1b}}] ench_itemTrack 9

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
execute as @e[scores={ench_itemTrack=1}] at @s if block ~ ~-1 ~ minecraft:smithing_table run function c_ench:table_upgrade