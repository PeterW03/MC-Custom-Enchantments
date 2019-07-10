# Desc: takes an input as a scoreboard int, and changes it to a random number between 1 and that value includsive
#
# Called by: c_ench:table_enchant

# Create an AEC
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["rng_entity","","rng_entity_new"]}
# Give it our score
scoreboard players operation @e[tag=rng_entity_new] ench_RNG = @s ench_RNG
# Do it again (if above 1)
execute as @e[tag=rng_entity_new, scores={ench_RNG=2..}] run function c_ench:random_internal
# Chose a number
scoreboard players operation @s ench_RNG = @e[tag=rng_entity,limit=1,sort=random] ench_RNG
