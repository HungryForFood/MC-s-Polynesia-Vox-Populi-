/*
--------------------------------
From https://forums.civfanatics.com/threads/how-to-delete-stuff.463429/
--------------------------------
When you delete an item, if you do nothing else you will have "gaps" in a table where the IDs are now noncontinuous.
Depending on the particular table, noncontinuous IDs will: 1) crash the game outright, 2) cause nearly silent nonsensical 
errors that are hard to track, or 3) have no effect. Rather than try to figure out which table fits in which category, it 
is easiest to re-sequence IDs for any table for which you may have introduced noncontinuous IDs (i.e., you deleted something).

I am only reordering the primary tables, since those are the only ones which the order matter (they are the only ones with an ID).

MUST come after all deletes in this mod.
*/
--==========================================================================================================================
-- BUILDINGCLASSES
--==========================================================================================================================
-- BuildingClasses
--------------------------------
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM BuildingClasses ORDER BY ID;
UPDATE BuildingClasses SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE BuildingClasses.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Buildings ORDER BY ID;
UPDATE Buildings SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Buildings.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
--==========================================================================================================================
-- UNITPROMOTIONS
--==========================================================================================================================
-- UnitPromotions
--------------------------------
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM UnitPromotions ORDER BY ID;
UPDATE UnitPromotions SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE UnitPromotions.Type = IDRemapper.Type);
DROP TABLE IDRemapper;
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------
CREATE TABLE IDRemapper ( id INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT );
INSERT INTO IDRemapper (Type) SELECT Type FROM Civilizations ORDER BY ID;
UPDATE Civilizations SET ID =	( SELECT IDRemapper.id-1 FROM IDRemapper WHERE Civilizations.Type = IDRemapper.Type);
DROP TABLE IDRemapper;