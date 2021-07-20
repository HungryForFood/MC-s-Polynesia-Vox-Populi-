--==========================================================================================================================
-- GAME TEXT
--==========================================================================================================================
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
-- UA: Kahuna Mastery
UPDATE Language_en_US
SET Text = '+1 Yield from Specialists, increasing by +1 in Medieval, Industrial, and Atomic Eras. Gain 5% progress towards a [ICON_GREAT_PEOPLE] Great Person in the [ICON_CAPITAL] Capital when you defeat an Enemy. [ICON_RES_FISH] Fish are revealed immediately, and melee Naval Units can construct Fishing Boats.'
WHERE Tag = 'TXT_KEY_TRAIT_KAHUNA_MASTERY';

-- UB: Heiau
UPDATE Language_en_US
SET Text = '-1 [ICON_HAPPINESS_3] Unhappiness from [ICON_PEACE] Religious Unrest. +25% Religious Pressure. Contains 1 slot for a Great Work of Music.[NEWLINE][NEWLINE]Nearby [ICON_RES_INCENSE] Incense: +1 [ICON_CULTURE] Culture, +1 [ICON_GOLD] Gold.[NEWLINE]Nearby [ICON_RES_WINE] Wine: +1 [ICON_CULTURE] Culture, +1 [ICON_GOLD] Gold.[NEWLINE][NEWLINE]Unlocks access to 2 additional Specialist slots.'
WHERE Tag = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_HELP';

INSERT INTO Language_en_US
		(Tag, Text)
VALUES	('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_CIVIL_SERVANT', 'Kane Heiau'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_CIVIL_SERVANT_HELP', '2 Specialists in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from Urbanization.'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_MERCHANT', 'Paka''a Heiau'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_MERCHANT_HELP', '2 Specialists in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from Urbanization.'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_ENGINEER', 'Ku Heiau'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_ENGINEER_HELP', '2 Specialists in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from Urbanization.'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_SCIENTIST', 'Poli''ahu Heiau'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_SCIENTIST_HELP', '2 Specialists in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from Urbanization.'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_ARTIST', 'Pele Heiau'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_ARTIST_HELP', '2 Specialists in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from Urbanization.'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_WRITER', 'Kanaloa Heiau'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_WRITER_HELP', '2 Specialists in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from Urbanization.'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_MUSICIAN', 'Lono Heiau'),
		('TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_MUSICIAN_HELP', '2 Specialists in this City no longer produces [ICON_HAPPINESS_3] Unhappiness from Urbanization.');

-- UU: Koa
UPDATE Language_en_US
SET Text = 'Unique Longswordsman replacement. Does not require [ICON_RES_IRON] Iron. Begins with the Amphibious promotion, and temporarily reduces the enemy''s [ICON_MOVES] Movement during melee combat. Only the Hawaiians may build it.'
WHERE Tag = 'TXT_KEY_UNIT_MC_HAWAIIAN_KOA_HELP';

UPDATE Language_en_US
SET Text = 'The Koa is a Hawaiian Unique Unit with an emphasis on amphibious warfare. In addition to the amphibious promotion, the Koa causes enemy units to have reduced [ICON_MOVES] Movement for 1 Turn during melee combat. It also does not require Iron, unlike the Longswordsmen which it replaces.'
WHERE Tag = 'TXT_KEY_UNIT_MC_HAWAIIAN_KOA_STRATEGY';

INSERT INTO Language_en_US
		(Tag, Text)
VALUES	('TXT_KEY_PROMOTION_MC_KAPU_KUIALUA', 'Kapu Ku''ialua'),
		('TXT_KEY_PROMOTION_MC_KAPU_KUIALUA_HELP', '+10% [ICON_STRENGTH] Combat Strength.[NEWLINE]Inflicts the [COLOR_POSITIVE_TEXT]Immobilized[ENDCOLOR] status on enemies during melee combat, reducing their [ICON_MOVES] Movement by 1 for 1 Turn.'),
		('TXT_KEY_PROMOTION_MC_IMMOBILIZED', 'Immobilized'),
		('TXT_KEY_PROMOTION_MC_IMMOBILIZED_HELP', '-1 [ICON_MOVES] Movement for 1 Turn.');

-- UU: Kukini
INSERT INTO Language_en_US
		(Tag, Text)
VALUES	('TXT_KEY_UNIT_MC_HAWAIIAN_KUKINI', 'Kukini'),
		('TXT_KEY_UNIT_MC_HAWAIIAN_KUKINI_STRATEGY', 'Kukinis are the Hawaiian''s unique replacement for the Scout. Since they have more [ICON_MOVES] Movement and can move after attacking, use them, use them in a similar manner to cavalry units.'),
		('TXT_KEY_UNIT_MC_HAWAIIAN_KUKINI_HELP', 'Unique Scout replacement. Has increased [ICON_MOVES] Movement, and can move after attacking. Only the Hawaiians may build it.'),
		('TXT_KEY_UNIT_MC_HAWAIIAN_KUKINI_TEXT',
		'In ancient Hawaii, Kukini were an elite class of men selected to undergo strenuous physical and mental training to become swift foot runners. Such runners were used in battles, as messengers, spies, and as athletes in foot racing in the Makahiki games.[NEWLINE]
		
		[NEWLINE]In recent times, this term has become popular to use as a label for various things. For example, the shoe corporation Nike used the name Kukini for one of the models of their running shoes.'),
		('TXT_KEY_PROMOTION_MC_HU_KA_MAKANI', 'Hu Ka Makani'),
		('TXT_KEY_PROMOTION_MC_HU_KA_MAKANI_HELP', '+1 [ICON_MOVES] Movement. +15% [ICON_STRENGTH] Combat Strength. Can move after attacking.');