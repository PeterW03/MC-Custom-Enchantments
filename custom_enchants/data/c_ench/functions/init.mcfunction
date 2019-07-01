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

# Identifiers for the smithing table upgrade
scoreboard objectives add isNetherStar dummy
