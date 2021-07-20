--==========================================================================================================================
-- GAME TEXT
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------

-- UB: Mala'e
UPDATE Language_en_US
SET Text = 
'+25 [ICON_FOOD] Food when completed. 15% of [ICON_FOOD] Food is carried over after a new [ICON_CITIZEN] Citizen is born. +1 [ICON_FOOD] Food and [ICON_PRODUCTION] Production to Atolls and Fishing Boats. Two [ICON_RES_FISH] Fish Resource will appear near the city when built, if valid.
[NEWLINE]
[NEWLINE]Allows [ICON_FOOD] Food to be moved from this city along trade routes inside your civilization.
[NEWLINE]
[NEWLINE]Nearby [ICON_RES_WHEAT] Wheat: +1 [ICON_FOOD] Food.
[NEWLINE]Nearby [ICON_RES_BANANA] Bananas: +1 [ICON_FOOD] Food.
[NEWLINE]Nearby [ICON_RES_DEER] Deer: +1 [ICON_FOOD] Food.
[NEWLINE]Nearby [ICON_RES_BISON] Bison: +1 [ICON_FOOD] Food.'
WHERE Tag = 'TXT_KEY_BUILDING_MC_TONGAN_MALAE_HELP';

UPDATE Language_en_US
SET Text = 'In addition to the bonuses of the Granary, the Mala''e also significantly boosts Coastal Cities by granting more yields to Atolls and Fishing Boats, as well as spawning [ICON_RES_FISH] Fish near the City.'
WHERE Tag = 'TXT_KEY_BUILDING_MC_TONGAN_MALAE_STRATEGY';