--==========================================================================================================================
-- BUILDINGCLASSES
--==========================================================================================================================
---- BuildingClasses
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_MC_MALAE_FOOD';
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
---- Buildings
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM Buildings WHERE Type = 'BUILDING_MC_MALAE_FOOD';

UPDATE Buildings SET
	FoodKept = (SELECT FoodKept FROM Buildings WHERE Type = 'BUILDING_GRANARY'),
	Cost = (SELECT Cost FROM Buildings WHERE Type = 'BUILDING_GRANARY'),
	GoldMaintenance = (SELECT GoldMaintenance FROM Buildings WHERE Type = 'BUILDING_GRANARY'),
	HurryCostModifier = (SELECT HurryCostModifier FROM Buildings WHERE Type = 'BUILDING_GRANARY'),
	Water = 0,
	Civilopedia = 'TXT_KEY_BUILDING_MC_TONGAN_MALAE_PEDIA'
WHERE Type = 'BUILDING_MC_TONGAN_MALAE';
----------------------------------------------------------------------------------------------------------------------------
---- Building_YieldChanges
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MC_MALAE_FOOD';
----------------------------------------------------------------------------------------------------------------------------
---- Building_ResourceYieldChanges
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_MC_TONGAN_MALAE';

INSERT INTO Building_ResourceYieldChanges
		(BuildingType, ResourceType, YieldType, Yield)
SELECT	'BUILDING_MC_TONGAN_MALAE', ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GRANARY';
----------------------------------------------------------------------------------------------------------------------------
---- Building_FeatureYieldChanges
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_FeatureYieldChanges
		(BuildingType, FeatureType, YieldType, Yield)
VALUES	('BUILDING_MC_TONGAN_MALAE', 'FEATURE_ATOLL', 'YIELD_FOOD', 1),
		('BUILDING_MC_TONGAN_MALAE', 'FEATURE_ATOLL', 'YIELD_PRODUCTION', 1);
----------------------------------------------------------------------------------------------------------------------------
---- Building_ImprovementYieldChanges
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ImprovementYieldChanges
		(BuildingType, ImprovementType, YieldType, Yield)
VALUES	('BUILDING_MC_TONGAN_MALAE', 'IMPROVEMENT_FISHING_BOATS', 'YIELD_FOOD', 1),
		('BUILDING_MC_TONGAN_MALAE', 'IMPROVEMENT_FISHING_BOATS', 'YIELD_PRODUCTION', 1);
----------------------------------------------------------------------------------------------------------------------------
---- Building_InstantYield
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_InstantYield
		(BuildingType, YieldType, Yield)
SELECT	'BUILDING_MC_TONGAN_MALAE', YieldType, Yield
FROM Building_InstantYield WHERE BuildingType = 'BUILDING_GRANARY';
----------------------------------------------------------------------------------------------------------------------------
---- Building_ResourcePlotsToPlace
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourcePlotsToPlace
		(BuildingType, ResourceType, NumPlots, ResourceQuantityToPlace)
VALUES	('BUILDING_MC_TONGAN_MALAE', 'RESOURCE_FISH', 2, 1);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
---- Civilizations
----------------------------------------------------------------------------------------------------------------------------
UPDATE Civilizations SET Playable = 0, AIPlayable = 0 WHERE Type = 'CIVILIZATION_MC_TONGA';