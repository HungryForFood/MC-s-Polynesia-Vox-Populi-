--==========================================================================================================================
-- BUILDINGCLASSES
--==========================================================================================================================
---- BuildingClasses
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM BuildingClasses WHERE Type IN('BUILDINGCLASS_MC_HEIAU', 'BUILDINGCLASS_MC_HAWAII_UA_CULTURE');

INSERT INTO BuildingClasses
		(Type, DefaultBuilding, Description)
VALUES	('BUILDINGCLASS_MC_HEIAU_CIVIL_SERVANT', 'BUILDING_MC_HEIAU_CIVIL_SERVANT', 'TXT_KEY_BUILDING_MC_HEIAU_CIVIL_SERVANT'),
		('BUILDINGCLASS_MC_HEIAU_MERCHANT', 'BUILDING_MC_HEIAU_MERCHANT', 'TXT_KEY_BUILDING_MC_HEIAU_MERCHANT'),
		('BUILDINGCLASS_MC_HEIAU_ENGINEER', 'BUILDING_MC_HEIAU_ENGINEER', 'TXT_KEY_BUILDING_MC_HEIAU_ENGINEER'),
		('BUILDINGCLASS_MC_HEIAU_SCIENTIST', 'BUILDING_MC_HEIAU_SCIENTIST', 'TXT_KEY_BUILDING_MC_HEIAU_SCIENTIST'),
		('BUILDINGCLASS_MC_HEIAU_ARTIST', 'BUILDING_MC_HEIAU_ARTIST', 'TXT_KEY_BUILDING_MC_HEIAU_ARTIST'),
		('BUILDINGCLASS_MC_HEIAU_WRITER', 'BUILDING_MC_HEIAU_WRITER', 'TXT_KEY_BUILDING_MC_HEIAU_WRITER'),
		('BUILDINGCLASS_MC_HEIAU_MUSICIAN', 'BUILDING_MC_HEIAU_MUSICIAN', 'TXT_KEY_BUILDING_MC_HEIAU_MUSICIAN');
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
---- Buildings
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM Buildings WHERE Type IN('BUILDING_MC_HAWAIIAN_HEIAU_TRUE_TEMPLE', 'BUILDING_MC_HAWAII_UA_CULTURE');

-- Main Heiau
UPDATE Buildings SET
	BuildingClass = 'BUILDINGCLASS_TEMPLE',
	Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_TEMPLE') * 0.75,
	GoldMaintenance = (SELECT GoldMaintenance FROM Buildings WHERE Type = 'BUILDING_TEMPLE'),
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_TEMPLE'),
	ReligiousPressureModifier = (SELECT ReligiousPressureModifier FROM Buildings WHERE Type = 'BUILDING_TEMPLE'),
	GreatWorkSlotType = (SELECT GreatWorkSlotType FROM Buildings WHERE Type = 'BUILDING_TEMPLE'),
	GreatWorkCount = (SELECT GreatWorkCount FROM Buildings WHERE Type = 'BUILDING_TEMPLE'),
	MutuallyExclusiveGroup = -1
WHERE Type = 'BUILDING_MC_HAWAIIAN_HEIAU';

-- Player's choice of specialist for Heiau
INSERT INTO Buildings
		(Type, BuildingClass, SpecialistType, IconAtlas, PortraitIndex, Description, Civilopedia, Strategy, Help)
VALUES	('BUILDING_MC_HEIAU_CIVIL_SERVANT', 'BUILDINGCLASS_MC_HEIAU_CIVIL_SERVANT', 'SPECIALIST_CIVIL_SERVANT', 'MC_POLYNESIA_ATLAS', 11, 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_CIVIL_SERVANT', 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_PEDIA', 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_STRATEGY', 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_CIVIL_SERVANT_HELP');

UPDATE Buildings SET 
	BuildingClass = 'BUILDINGCLASS_MC_HEIAU_MERCHANT',
	Description = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_MERCHANT',
	Help = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_MERCHANT_HELP'
WHERE Type = 'BUILDING_MC_HEIAU_MERCHANT';

UPDATE Buildings SET
	BuildingClass = 'BUILDINGCLASS_MC_HEIAU_ENGINEER',
	Description = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_ENGINEER',
	Help = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_ENGINEER_HELP'
WHERE Type = 'BUILDING_MC_HEIAU_ENGINEER';

UPDATE Buildings SET
	BuildingClass = 'BUILDINGCLASS_MC_HEIAU_SCIENTIST',
	Description = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_SCIENTIST',
	Help = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_SCIENTIST_HELP'
WHERE Type = 'BUILDING_MC_HEIAU_SCIENTIST';

UPDATE Buildings SET
	BuildingClass = 'BUILDINGCLASS_MC_HEIAU_ARTIST',
	Description = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_ARTIST',
	Help = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_ARTIST_HELP'
WHERE Type = 'BUILDING_MC_HEIAU_ARTIST';

UPDATE Buildings SET
	BuildingClass = 'BUILDINGCLASS_MC_HEIAU_WRITER',
	Description = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_WRITER',
	Help = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_WRITER_HELP'
WHERE Type = 'BUILDING_MC_HEIAU_WRITER';

UPDATE Buildings SET
	BuildingClass = 'BUILDINGCLASS_MC_HEIAU_MUSICIAN',
	Description = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_MUSICIAN',
	Help = 'TXT_KEY_BUILDING_MC_HAWAIIAN_HEIAU_MUSICIAN_HELP'
WHERE Type = 'BUILDING_MC_HEIAU_MUSICIAN';

UPDATE Buildings SET
	CivilizationRequired = 'CIVILIZATION_POLYNESIA',
	MutuallyExclusiveGroup = 43673,
	SpecialistCount = 2,
	ConquestProb = 0,
	GoldMaintenance = 0,
	Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_TEMPLE') * 0.25,
	FreeBuildingThisCity = null,
	MaxStartEra = null,
	NoUnhappfromXSpecialists = 2,
	ShowInPedia = 0,
	PrereqTech = (SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_TEMPLE'),
	HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_TEMPLE')
WHERE Type IN('BUILDING_MC_HEIAU_CIVIL_SERVANT', 'BUILDING_MC_HEIAU_MERCHANT', 'BUILDING_MC_HEIAU_ENGINEER', 'BUILDING_MC_HEIAU_SCIENTIST', 'BUILDING_MC_HEIAU_ARTIST', 'BUILDING_MC_HEIAU_WRITER', 'BUILDING_MC_HEIAU_MUSICIAN');
----------------------------------------------------------------------------------------------------------------------------
---- Building_ResourceYieldChanges
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, YieldType, Yield)
SELECT	'BUILDING_MC_HAWAIIAN_HEIAU', ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';
----------------------------------------------------------------------------------------------------------------------------
---- Building_UnhappinessNeedsFlatReduction
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_UnhappinessNeedsFlatReduction
		(BuildingType, YieldType, Yield)
SELECT	'BUILDING_MC_HAWAIIAN_HEIAU', YieldType, Yield
FROM Building_UnhappinessNeedsFlatReduction WHERE BuildingType = 'BUILDING_TEMPLE';
----------------------------------------------------------------------------------------------------------------------------
---- Building_YieldChanges
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType IN('BUILDING_MC_HAWAIIAN_HEIAU', 'BUILDING_MC_HEIAU_MERCHANT', 'BUILDING_MC_HEIAU_ENGINEER', 'BUILDING_MC_HEIAU_SCIENTIST', 'BUILDING_MC_HEIAU_ARTIST', 'BUILDING_MC_HEIAU_WRITER', 'BUILDING_MC_HEIAU_MUSICIAN', 'BUILDING_MC_HAWAII_UA_CULTURE');

INSERT INTO Building_YieldChanges
		(BuildingType, YieldType, Yield)
SELECT	'BUILDING_MC_HAWAIIAN_HEIAU', YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_YieldChanges
		(BuildingType, Yield, Yield)
VALUES	('BUILDING_MC_HEIAU_MERCHANT', 'YIELD_FOOD', 5),
		('BUILDING_MC_HEIAU_MERCHANT', 'YIELD_GOLD', 5),
		('BUILDING_MC_HEIAU_ENGINEER', 'YIELD_PRODUCTION', 3),
		('BUILDING_MC_HEIAU_ENGINEER', 'YIELD_GREAT_GENERAL_POINTS', 3),
		('BUILDING_MC_HEIAU_ENGINEER', 'YIELD_GREAT_ADMIRAL_POINTS', 3),
		('BUILDING_MC_HEIAU_SCIENTIST', 'YIELD_SCIENCE', 2),
		('BUILDING_MC_HEIAU_ARTIST', 'YIELD_CULTURE', 2),
		('BUILDING_MC_HEIAU_WRITER', 'YIELD_CULTURE', 2),
		('BUILDING_MC_HEIAU_MUSICIAN', 'YIELD_CULTURE', 2),
		('BUILDING_MC_HEIAU_CIVIL_SERVANT', 'YIELD_GOLD', 3),
		('BUILDING_MC_HEIAU_CIVIL_SERVANT', 'YIELD_SCIENCE', 1);
----------------------------------------------------------------------------------------------------------------------------
---- Building_ClassesNeededInCity
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity
		(BuildingType, BuildingClassType)
SELECT	Type, 'BUILDINGCLASS_TEMPLE'
FROM Buildings WHERE Type IN('BUILDING_MC_HEIAU_CIVIL_SERVANT', 'BUILDING_MC_HEIAU_MERCHANT', 'BUILDING_MC_HEIAU_ENGINEER', 'BUILDING_MC_HEIAU_SCIENTIST', 'BUILDING_MC_HEIAU_ARTIST', 'BUILDING_MC_HEIAU_WRITER', 'BUILDING_MC_HEIAU_MUSICIAN');
----------------------------------------------------------------------------------------------------------------------------
---- Building_Flavors
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors
		(BuildingType, FlavorType, Flavor)
SELECT Type, 'FLAVOR_GREAT_PEOPLE', 20
FROM Buildings WHERE Type IN('BUILDING_MC_HEIAU_CIVIL_SERVANT', 'BUILDING_MC_HEIAU_MERCHANT', 'BUILDING_MC_HEIAU_ENGINEER', 'BUILDING_MC_HEIAU_SCIENTIST', 'BUILDING_MC_HEIAU_ARTIST', 'BUILDING_MC_HEIAU_WRITER', 'BUILDING_MC_HEIAU_MUSICIAN');
--==========================================================================================================================	
-- UNITPROMOTIONS
--==========================================================================================================================
---- UnitPromotions
----------------------------------------------------------------------------------------------------------------------------
-- Koa
DELETE FROM UnitPromotions WHERE Type IN('PROMOTION_MC_KOA_XP', 'PROMOTION_MC_KOA_XP_CONSUMED', 'PROMOTION_MC_KAHUNA_EXPERIENCE');

INSERT INTO UnitPromotions
		(Type, Description, Help, Sound, CannotBeChosen, PortraitIndex, LostWithUpgrade, IconAtlas, PediaType, PediaEntry)
VALUES	('PROMOTION_MC_KAPU_KUIALUA', 'TXT_KEY_PROMOTION_MC_KAPU_KUIALUA', 'TXT_KEY_PROMOTION_MC_KAPU_KUIALUA_HELP', 'AS2D_IF_LEVELUP', 1, 59, 0, 'PROMOTION_ATLAS', 'PEDIA_MELEE', 'TXT_KEY_PROMOTION_MC_KAPU_KUIALUA');

UPDATE UnitPromotions SET
	PlagueChance = 100,
	PlaguePromotion = 'PROMOTION_MC_IMMOBILIZED',
	CombatPercent = 10
WHERE Type = 'PROMOTION_MC_KAPU_KUIALUA';

INSERT INTO UnitPromotions
		(Type, Description, Help, Sound, CannotBeChosen, PortraitIndex, LostWithUpgrade, IconAtlas, PediaType, PediaEntry, MovesChange, PromotionDuration, PlagueID, PlaguePriority)
SELECT	'PROMOTION_MC_IMMOBILIZED', 'TXT_KEY_PROMOTION_MC_IMMOBILIZED', 'TXT_KEY_PROMOTION_MC_IMMOBILIZED_HELP', Sound, CannotBeChosen, PortraitIndex, LostWithUpgrade, IconAtlas, 'PEDIA_MELEE', 'TXT_KEY_PROMOTION_MC_IMMOBILIZED', -1, PromotionDuration, PlagueID, PlaguePriority
FROM UnitPromotions WHERE Type = 'PROMOTION_BOARDED_I';

-- Kukini
INSERT INTO UnitPromotions
		(Type, Description, Help, Sound, CannotBeChosen, PortraitIndex, LostWithUpgrade, IconAtlas, PediaType, PediaEntry)
SELECT	'PROMOTION_MC_HU_KA_MAKANI', 'TXT_KEY_PROMOTION_MC_HU_KA_MAKANI', 'TXT_KEY_PROMOTION_MC_HU_KA_MAKANI_HELP', 'AS2D_IF_LEVELUP', 1, PortraitIndex, 0, IconAtlas, 'PEDIA_SCOUTING', 'TXT_KEY_PROMOTION_MC_HU_KA_MAKANI'
FROM UnitPromotions WHERE Type = 'PROMOTION_MOBILITY';

UPDATE UnitPromotions SET
	MovesChange = 1,
	CombatPercent = 15,
	CanMoveAfterAttacking = 1
WHERE Type = 'PROMOTION_MC_HU_KA_MAKANI';
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
---- Units
----------------------------------------------------------------------------------------------------------------------------
-- Koa
UPDATE Units SET
	PrereqTech = 'TECH_CHIVALRY',
	Combat = (SELECT Combat FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN') + 2,
	Cost = (SELECT Cost FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN'),
	FaithCost = (SELECT FaithCost FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN'),
	ObsoleteTech = (SELECT ObsoleteTech FROM Units WHERE Type = 'UNIT_SPANISH_TERCIO'),
	GoodyHutUpgradeUnitClass = (SELECT GoodyHutUpgradeUnitClass FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN')
WHERE Type = 'UNIT_MC_HAWAIIAN_KOA';

-- Kukini (4UC)
INSERT INTO Units 	
		(Type, 						PrereqTech, Special, Class, Combat,		RangedCombat, CombatClass, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, Domain, DefaultUnitAI,	HurryCostModifier, WorkRate, Domain, DefaultUnitAI, Description, 						Strategy, 										 Help, 										Civilopedia, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, RangedCombatLimit, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation, UnitArtInfo, 							UnitFlagAtlas,							UnitFlagIconOffset,	IconAtlas,						PortraitIndex,	MoveRate, BaseLandAirDefense)
SELECT	'UNIT_MC_HAWAIIAN_KUKINI',	PrereqTech,	Special, Class, Combat+2,	RangedCombat, CombatClass, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, Domain, DefaultUnitAI,	HurryCostModifier, WorkRate, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_MC_HAWAIIAN_KUKINI', 	'TXT_KEY_UNIT_MC_HAWAIIAN_KUKINI_STRATEGY',		'TXT_KEY_UNIT_MC_HAWAIIAN_KUKINI_HELP',		'TXT_KEY_UNIT_MC_HAWAIIAN_KUKINI_TEXT',		Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, RangedCombatLimit, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation, 'ART_DEF_UNIT_MC_HAWAIIAN_KUKINI',	'MC_POLYNESIA_VOXPOPULI_UNITFLAGATLAS',	0,					'MC_POLYNESIA_VOXPOPULI_ATLAS',	0, 				MoveRate, BaseLandAirDefense
FROM Units WHERE Type = 'UNIT_SCOUT';
----------------------------------------------------------------------------------------------------------------------------
---- Unit_AITypes
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes
		(UnitType, UnitAIType)
SELECT	'UNIT_MC_HAWAIIAN_KUKINI', UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SCOUT';
----------------------------------------------------------------------------------------------------------------------------
---- Unit_ClassUpgrades
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MC_HAWAIIAN_KOA';

INSERT INTO Unit_ClassUpgrades
		(UnitType, UnitClassType)
SELECT	'UNIT_MC_HAWAIIAN_KOA', UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LONGSWORDSMAN';

INSERT INTO Unit_ClassUpgrades
		(UnitType, UnitClassType)
SELECT	'UNIT_MC_HAWAIIAN_KUKINI', UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SCOUT';
----------------------------------------------------------------------------------------------------------------------------
---- Unit_Flavors
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors
		(UnitType, FlavorType, Flavor)
SELECT	'UNIT_MC_HAWAIIAN_KUKINI', FlavorType, Flavor+2
FROM Unit_Flavors WHERE UnitType = 'UNIT_SCOUT';
----------------------------------------------------------------------------------------------------------------------------
---- Unit_FreePromotions
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_MC_KOA_XP';

INSERT INTO Unit_FreePromotions
		(UnitType, PromotionType)
SELECT	'UNIT_MC_HAWAIIAN_KOA', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LONGSWORDSMAN';

INSERT INTO Unit_FreePromotions
		(UnitType, PromotionType)
SELECT	'UNIT_MC_HAWAIIAN_KUKINI', PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCOUT';

INSERT INTO Unit_FreePromotions
		(UnitType, PromotionType)
VALUES	('UNIT_MC_HAWAIIAN_KOA', 'PROMOTION_MC_KAPU_KUIALUA'),
		('UNIT_MC_HAWAIIAN_KUKINI', 'PROMOTION_MC_HU_KA_MAKANI');
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
---- Traits
----------------------------------------------------------------------------------------------------------------------------
UPDATE Traits SET IsOddEraScaler = 1 WHERE Type = 'TRAIT_KAHUNA_MASTERY';
----------------------------------------------------------------------------------------------------------------------------
---- Trait_BuildsUnitClasses
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_BuildsUnitClasses
		(TraitType, UnitClassType, BuildType)
SELECT 'TRAIT_KAHUNA_MASTERY', UnitClassType, BuildType
FROM Trait_BuildsUnitClasses WHERE TraitType = 'TRAIT_WAYFINDING';
----------------------------------------------------------------------------------------------------------------------------
---- Trait_AlternateResourceTechs
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_AlternateResourceTechs
		(TraitType, ResourceType, TechReveal)
VALUES	('TRAIT_KAHUNA_MASTERY', 'RESOURCE_FISH', 'TECH_AGRICULTURE');
----------------------------------------------------------------------------------------------------------------------------
---- Trait_SpecialistYieldChanges
----------------------------------------------------------------------------------------------------------------------------
UPDATE Trait_SpecialistYieldChanges SET Yield = 1 WHERE TraitType = 'TRAIT_KAHUNA_MASTERY';

INSERT INTO Trait_SpecialistYieldChanges
		(TraitType, SpecialistType, YieldType, Yield)
VALUES	('TRAIT_KAHUNA_MASTERY', 'SPECIALIST_CIVIL_SERVANT', 'YIELD_GOLD', 1);
----------------------------------------------------------------------------------------------------------------------------
---- Trait_RandomGreatPersonProgressFromKills
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Trait_RandomGreatPersonProgressFromKills
		(TraitType, GreatPersonType, Value)
SELECT	'TRAIT_KAHUNA_MASTERY', Type, 5
FROM GreatPersons WHERE Type IN('GREATPERSON_ENGINEER', 'GREATPERSON_SCIENTIST', 'GREATPERSON_MERCHANT', 'GREATPERSON_ARTIST', 'GREATPERSON_MUSICIAN', 'GREATPERSON_WRITER', 'GREATPERSON_DIPLOMAT');
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
---- Civilization_BuildingClassOverrides
----------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_BuildingClassOverrides SET BuildingType = 'BUILDING_MC_HAWAIIAN_HEIAU' WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE' AND CivilizationType = 'CIVILIZATION_POLYNESIA';
DELETE FROM Civilization_BuildingClassOverrides WHERE BuildingClassType = 'BUILDINGCLASS_MC_HEIAU';