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

# Do the effects

# Helmet
execute if entity @a[scores={ench_helm=1..}] run function c_ench:helm

# Chestplate
execute if entity @a[scores={ench_chest=1..}] run function c_ench:chest

# Leggings
execute if entity @a[scores={ench_legs=1..}] run function c_ench:legs

# Boots
execute if entity @a[scores={ench_boot=1..}] run function c_ench:boot