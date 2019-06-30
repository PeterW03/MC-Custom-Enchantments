# Desc: Runs all commands related to boots enchants
#
# Called by: c_ench:tick

# Rabbit
effect give @a[scores={ench_boot=1}] minecraft:jump_boost 1 0 true
# Safety
execute as @a[scores={ench_boot=2,ench_falling=8..}] run effect give @s minecraft:slow_falling 10 0 true
execute as @a[scores={ench_boot=2,ench_falling=8..}] run effect give @s minecraft:levitation 1 244 true