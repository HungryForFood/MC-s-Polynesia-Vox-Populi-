--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
---- Civilization_BuildingClassOverrides
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM Civilization_BuildingClassOverrides WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, BuildingClassType, BuildingType)
VALUES	('CIVILIZATION_POLYNESIA', 'BUILDINGCLASS_TEMPLE', 'BUILDING_MC_HAWAIIAN_HEIAU'),
		('CIVILIZATION_POLYNESIA', 'BUILDINGCLASS_GRANARY', 'BUILDING_MC_TONGAN_MALAE');
----------------------------------------------------------------------------------------------------------------------------
---- Civilization_UnitClassOverrides
----------------------------------------------------------------------------------------------------------------------------
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
VALUES	('CIVILIZATION_POLYNESIA', 'UNITCLASS_LONGSWORDSMAN', 'UNIT_MC_HAWAIIAN_KOA'),
		('CIVILIZATION_POLYNESIA', 'UNITCLASS_SCOUT', 'UNIT_MC_HAWAIIAN_KUKINI');