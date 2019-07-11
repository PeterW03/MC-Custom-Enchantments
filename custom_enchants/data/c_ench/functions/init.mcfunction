# Desc: Creates required global scores
#
# Called by: #main:init

# Track our enchants
scoreboard objectives add ench_helm dummy
scoreboard objectives add ench_chest dummy
scoreboard objectives add ench_legs dummy
scoreboard objectives add ench_boot dummy

# Dummy tracker stats for some enchants (they get updated with NBT data in our tick function)
scoreboard objectives add ench_falling dummy
scoreboard objectives add ench_hurt dummy

# Stat trackers
scoreboard objectives add ench_shift minecraft.custom:minecraft.crouch_one_cm

# Identifiers for the smithing table upgrade
scoreboard objectives add ench_itemTrack dummy
scoreboard objectives add ench_itemCount dummy

# Scoreboard for RNG
scoreboard objectives add ench_RNG dummy

# Math Constants
execute unless entity @e[name="c_ench Constants"] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invisible:1b,PersistenceRequired:1b,Tags:["ench_constants"],CustomName:"{\"text\":\"c_ench Constants\"}"}
scoreboard players set @e[name="c_ench Constants"] ench_RNG 1