# Desc: Runs all functions related to enchants
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
# # Sight
effect give @a[scores={ench_helm=1}] minecraft:night_vision 11 0 true
# # Hardened
execute as @a[scores={ench_helm=2}] at @a[scores={ench_helm=2}] unless block ~ ~1 ~ air run effect give @s minecraft:regeneration 1 4 true

# Chestplate
# # Adrenaline
execute as @a[scores={ench_chest=1,ench_hurt=1..}] run effect give @s minecraft:strength 5 0 true

# Leggings
# # Adrenaline
execute as @a[scores={ench_legs=1,ench_hurt=1..}] run effect give @s minecraft:speed 5 0 true

# Boots
# # Rabbit
effect give @a[scores={ench_boot=1}] minecraft:jump_boost 1 0 true
# # Safety
execute as @a[scores={ench_boot=2,ench_falling=8..}] run effect give @s minecraft:slow_falling 10 0 true
execute as @a[scores={ench_boot=2,ench_falling=8..}] run effect give @s minecraft:levitation 1 244 true