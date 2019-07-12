# Desc: Runs all commands related to legging enchants
#
# Called by: c_ench:tick

# Adrenaline
execute as @a[scores={ench_legs=1,ench_hurt=1..}] run effect give @s minecraft:speed 5 0 true
# Regeneration
execute as @a[scores={ench_legs=2,ench_timer=100..}] run effect give @s minecraft:regeneration 1 2 true