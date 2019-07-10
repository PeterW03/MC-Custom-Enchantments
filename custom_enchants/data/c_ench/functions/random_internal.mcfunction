# Desc: Recursive part of RNG
#
# Called by: c_ench:random_main

# Remove the new tag from the old one
tag @e remove rng_entity_new
# Create an AEC
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["rng_entity","","rng_entity_new"]}
# Give it our score
scoreboard players operation @e[tag=rng_entity_new] ench_RNG = @s ench_RNG
# Reduce the score by 1
scoreboard players operation @e[tag=rng_entity_new] ench_RNG -= @e[name="c_ench Constants"] ench_RNG
# Do it again (if above 1)
execute as @e[tag=rng_entity_new, scores={ench_RNG=2..}] run function c_ench:random_internal
