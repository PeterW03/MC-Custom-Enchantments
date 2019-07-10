# Desc: Enchants the items on smithing tables
#
# Called by: c_ench:table_upgrade2

particle minecraft:instant_effect ~ ~0.1 ~ 0 0 0 0.15 25
kill @e[type=item,distance=..1.5,scores={ench_itemTrack=2..5}]

# Helm
execute if entity @e[type=item,distance=..1.5,scores={ench_itemTrack=6}] run scoreboard players set @s ench_RNG 2
# Chest
execute if entity @e[type=item,distance=..1.5,scores={ench_itemTrack=7}] run scoreboard players set @s ench_RNG 2
# Legs
execute if entity @e[type=item,distance=..1.5,scores={ench_itemTrack=8}] run scoreboard players set @s ench_RNG 1
# Boot
execute if entity @e[type=item,distance=..1.5,scores={ench_itemTrack=9}] run scoreboard players set @s ench_RNG 2

# Generate the random number
function c_ench:random_main
# Apply the enchants
data modify entity @e[type=item,distance=..1.5,scores={ench_itemTrack=6..},limit=1] Item.tag.isCustom set value 1
execute if entity @s[scores={ench_RNG=1}] run data modify entity @e[type=item,distance=..1.5,scores={ench_itemTrack=6..},limit=1] Item.tag.ench set value 1
execute if entity @s[scores={ench_RNG=2}] run data modify entity @e[type=item,distance=..1.5,scores={ench_itemTrack=6..},limit=1] Item.tag.ench set value 2

# Add the Lore
#["{\"text\":\"Adrenaline\",\"color\":\"gray\",\"italic\":false}"]
# # Sight
execute if entity @s[scores={ench_RNG=1}] run data modify entity @e[type=item,distance=..2,scores={ench_itemTrack=6},limit=1] Item.tag.display.Lore set value ["{\"text\":\"Sight\",\"color\":\"gray\",\"italic\":false}"]
# # Hardened
execute if entity @s[scores={ench_RNG=2}] run data modify entity @e[type=item,distance=..2,scores={ench_itemTrack=6},limit=1] Item.tag.display.Lore set value ["{\"text\":\"Hardened\",\"color\":\"gray\",\"italic\":false}"]
# # Adrenaline (chest)
execute if entity @s[scores={ench_RNG=1}] run data modify entity @e[type=item,distance=..2,scores={ench_itemTrack=7},limit=1] Item.tag.display.Lore set value ["{\"text\":\"Adrenaline\",\"color\":\"gray\",\"italic\":false}"]
# # Immunity
execute if entity @s[scores={ench_RNG=2}] run data modify entity @e[type=item,distance=..2,scores={ench_itemTrack=7},limit=1] Item.tag.display.Lore set value ["{\"text\":\"Immunity\",\"color\":\"gray\",\"italic\":false}"]
# # Adrenaline (Legs)
execute if entity @s[scores={ench_RNG=1}] run data modify entity @e[type=item,distance=..2,scores={ench_itemTrack=8},limit=1] Item.tag.display.Lore set value ["{\"text\":\"Adrenaline\",\"color\":\"gray\",\"italic\":false}"]
# # Rabbit
execute if entity @s[scores={ench_RNG=1}] run data modify entity @e[type=item,distance=..2,scores={ench_itemTrack=9},limit=1] Item.tag.display.Lore set value ["{\"text\":\"Rabbit\",\"color\":\"gray\",\"italic\":false}"]
# # Safety
execute if entity @s[scores={ench_RNG=2}] run data modify entity @e[type=item,distance=..2,scores={ench_itemTrack=9},limit=1] Item.tag.display.Lore set value ["{\"text\":\"Safety\",\"color\":\"gray\",\"italic\":false}"]
