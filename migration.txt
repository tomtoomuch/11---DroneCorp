-- ============================================================
-- migration.sql
-- Nettoyage et normalisation des données DroneCorp_TEST

-- ============================================================

USE DroneCorp_TEST;

-- Désactivation du safe mode pour permettre les UPDATE/DELETE sans WHERE sur clé
SET SQL_SAFE_UPDATES = 0;

-- ============================================================
-- ÉTAPE 1 — TABLE Drone
-- Normalisation des type_drone et modele
-- ============================================================

-- 1a. Supprimer les espaces et points parasites
UPDATE Drone SET type_drone = TRIM(REPLACE(type_drone, '.', ''));
UPDATE Drone SET modele     = TRIM(modele);

-- 1b. Normaliser type_drone → valeur canonique
UPDATE Drone
SET type_drone = 'Quadricoptère'
WHERE LOWER(REPLACE(REPLACE(REPLACE(type_drone, '.', ''), ' ', ''), 'e', 'è')) 
      IN ('quadri', 'quadricoptere', 'quadricoptère', 'quadricoptere')
   OR LOWER(TRIM(type_drone)) IN ('quadri', 'quadricoptère', 'quadricoptere', 'quadricoptere');

-- On passe par une comparaison plus robuste avec REGEXP
UPDATE Drone
SET type_drone = 'Quadricoptère'
WHERE LOWER(type_drone) REGEXP '^quadri';

UPDATE Drone
SET type_drone = 'Hexacoptère'
WHERE LOWER(type_drone) REGEXP '^hexa';

UPDATE Drone
SET type_drone = 'VTOL'
WHERE LOWER(REPLACE(REPLACE(type_drone, '.', ''), ' ', '')) REGEXP '^vtol';

-- 1c. Normaliser modele → valeur canonique
UPDATE Drone
SET modele = 'AX-100'
WHERE LOWER(REPLACE(REPLACE(modele, '-', ''), ' ', '')) = 'ax100';

UPDATE Drone
SET modele = 'HX-200'
WHERE LOWER(REPLACE(REPLACE(modele, '-', ''), ' ', '')) = 'hx200';

UPDATE Drone
SET modele = 'VTOL-X'
WHERE LOWER(REPLACE(REPLACE(REPLACE(modele, '-', ''), ' ', ''), 'x', 'x')) REGEXP 'vtol';

-- 1d. Mettre à NULL les valeurs aberrantes non récupérables
UPDATE Drone SET type_drone = NULL WHERE type_drone NOT IN ('Quadricoptère', 'Hexacoptère', 'VTOL');
UPDATE Drone SET poids      = NULL WHERE poids <= 0 OR poids > 20;
UPDATE Drone SET autonomie  = NULL WHERE autonomie > 200;
UPDATE Drone SET vitesse    = NULL WHERE vitesse > 200;


-- ============================================================
-- ÉTAPE 2 — TABLE Maintenance
-- Normalisation des pièces et des dates
-- ============================================================

-- 2a. Supprimer les espaces superflus
UPDATE Maintenance SET piece = TRIM(piece);
UPDATE Maintenance SET commentaire = NULLIF(TRIM(commentaire), '');  -- vide → NULL

-- 2b. Normaliser les noms de pièces → valeur canonique
UPDATE Maintenance
SET piece = 'Batterie'
WHERE LOWER(TRIM(piece)) IN ('batterie', 'battery', 'bat');

UPDATE Maintenance
SET piece = 'Moteur'
WHERE LOWER(TRIM(piece)) REGEXP '^m[o0]t[e3]{1,2}ur$';
-- couvre : moteur, Moteur, MOTEUR, moteeur, mOtEuR

UPDATE Maintenance
SET piece = 'Hélice'
WHERE LOWER(TRIM(piece)) IN ('hélice', 'helice', 'hélice', 'helice', 'hélices');

UPDATE Maintenance
SET piece = 'Contrôleur'
WHERE LOWER(TRIM(piece)) IN ('contrôleur', 'controleur', 'contrôleur', 'controlleur');

UPDATE Maintenance
SET piece = 'TransitionRotor'
WHERE LOWER(REPLACE(TRIM(piece), ' ', '')) IN ('transitionrotor', 'transrotor');

-- 2c. Normaliser les dates au format YYYY-MM-DD
-- Format DD/MM/YYYY
UPDATE Maintenance
SET date_maint = STR_TO_DATE(date_maint, '%d/%m/%Y')
WHERE date_maint REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$';

-- Format DD-MM-YYYY
UPDATE Maintenance
SET date_maint = STR_TO_DATE(date_maint, '%d-%m-%Y')
WHERE date_maint REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$';

-- Format YYYY/MM/DD
UPDATE Maintenance
SET date_maint = STR_TO_DATE(date_maint, '%Y/%m/%d')
WHERE date_maint REGEXP '^[0-9]{4}/[0-9]{2}/[0-9]{2}$';

-- Dates texte libres non récupérables → NULL
UPDATE Maintenance
SET date_maint = NULL
WHERE date_maint NOT REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';

-- 2d. Supprimer les lignes de maintenance orphelines (drone inexistant)
DELETE FROM Maintenance
WHERE drone NOT IN (SELECT idDrone FROM Drone);


-- ============================================================
-- ÉTAPE 3 — TABLE Mission
-- Normalisation des zones, matériels, quantités
-- ============================================================

-- 3a. Normaliser la zone → majuscule et suppression espaces
UPDATE Mission SET zone = UPPER(TRIM(zone));

-- 3b. Corriger les variantes mal saisies de zones
UPDATE Mission SET zone = 'Z1'  WHERE zone IN ('Z1', 'z1', 'ZONE1', 'ZONE 1');
UPDATE Mission SET zone = 'Z2'  WHERE zone IN ('Z2', 'z2', 'ZONE2', 'ZONE 2');
UPDATE Mission SET zone = 'Z3'  WHERE zone IN ('Z3', 'z3', 'ZONE3', 'ZONE 3');
UPDATE Mission SET zone = 'Z4'  WHERE zone IN ('Z4', 'z4', 'ZONE4', 'ZONE 4');
UPDATE Mission SET zone = 'Z5'  WHERE zone IN ('Z5', 'z5', 'ZONE5', 'ZONE 5');

-- 3c. Normaliser le matériel → valeur canonique
UPDATE Mission SET materiel = TRIM(materiel);

UPDATE Mission
SET materiel = 'Eau'
WHERE LOWER(TRIM(materiel)) IN ('eau', 'eaux', 'eau potable');

UPDATE Mission
SET materiel = 'Médicaments'
WHERE LOWER(TRIM(materiel)) IN ('médicaments', 'medicaments', 'médicament', 'medicament');

UPDATE Mission
SET materiel = 'Nourriture'
WHERE LOWER(TRIM(materiel)) IN ('nourriture', 'nouriture', 'vivres', 'alimentation');

UPDATE Mission
SET materiel = 'Tentes'
WHERE LOWER(TRIM(materiel)) IN ('tentes', 'tente');

-- 3d. Supprimer ou corriger les quantités aberrantes
UPDATE Mission SET quantite = NULL WHERE quantite <= 0;
UPDATE Mission SET quantite = NULL WHERE quantite > 1000;

-- 3e. Supprimer les missions sans drone valide
DELETE FROM Mission
WHERE drone IS NULL
   OR drone NOT IN (SELECT idDrone FROM Drone);


-- ============================================================
-- ÉTAPE 4 — TABLE Stock
-- Fusion des doublons par matériel
-- ============================================================

-- 4a. Normaliser les noms de matériels
UPDATE Stock SET materiel = TRIM(materiel);

UPDATE Stock SET materiel = 'Eau'         WHERE LOWER(TRIM(materiel)) IN ('eau', 'eaux', 'eau potable');
UPDATE Stock SET materiel = 'Médicaments' WHERE LOWER(TRIM(materiel)) IN ('médicaments', 'medicaments', 'médicament', 'medicament');
UPDATE Stock SET materiel = 'Nourriture'  WHERE LOWER(TRIM(materiel)) IN ('nourriture', 'vivres', 'alimentation');
UPDATE Stock SET materiel = 'Tentes'      WHERE LOWER(TRIM(materiel)) IN ('tentes', 'tente');
UPDATE Stock SET materiel = 'Carburant'   WHERE LOWER(TRIM(materiel)) IN ('carburant');
UPDATE Stock SET materiel = 'Batteries'   WHERE LOWER(TRIM(materiel)) IN ('batteries', 'batterie');
UPDATE Stock SET materiel = 'Couvertures' WHERE LOWER(TRIM(materiel)) IN ('couvertures', 'couverture');
UPDATE Stock SET materiel = 'Lampes'      WHERE LOWER(TRIM(materiel)) IN ('lampes', 'lampe');
UPDATE Stock SET materiel = 'Kits premiers secours'
    WHERE LOWER(TRIM(materiel)) IN ('kits premiers secours', 'kit premiers secours');

-- 4b. Normaliser les unités
UPDATE Stock SET unite = 'L'     WHERE LOWER(TRIM(unite)) IN ('l', 'litre', 'litres');
UPDATE Stock SET unite = 'kg'    WHERE LOWER(TRIM(unite)) IN ('kg', 'kilo', 'kilos', 'kilogramme');
UPDATE Stock SET unite = 'unité' WHERE LOWER(TRIM(unite)) IN ('unité', 'unite', 'pièce', 'piece', 'boite');

-- 4c. Fusionner les doublons : additionner les quantités, garder la ligne la plus récente
--     On crée une table temporaire propre
CREATE TEMPORARY TABLE Stock_propre AS
SELECT
    materiel,
    unite,
    SUM(quantite_dispo) AS quantite_dispo,
    MAX(derniere_maj)   AS derniere_maj
FROM Stock
GROUP BY materiel, unite;

-- Vider la table originale et réinsérer les données fusionnées
DELETE FROM Stock;

INSERT INTO Stock (materiel, unite, quantite_dispo, derniere_maj)
SELECT materiel, unite, quantite_dispo, derniere_maj FROM Stock_propre;

DROP TEMPORARY TABLE Stock_propre;


-- ============================================================
-- ÉTAPE 5 — TABLE PiecesStock
-- Fusion des doublons par référence + modèle normalisé
-- ============================================================

-- 5a. Normaliser les modèles compatibles
UPDATE PiecesStock SET modele_compatible = UPPER(TRIM(REPLACE(REPLACE(modele_compatible, ' ', ''), '_', '-')));
UPDATE PiecesStock SET modele_compatible = 'AX-100'  WHERE REPLACE(REPLACE(UPPER(modele_compatible), ' ', ''), '_', '') IN ('AX100', 'AX-100');
UPDATE PiecesStock SET modele_compatible = 'HX-200'  WHERE REPLACE(REPLACE(UPPER(modele_compatible), ' ', ''), '_', '') IN ('HX200', 'HX-200');
UPDATE PiecesStock SET modele_compatible = 'VTOL-X'  WHERE REPLACE(REPLACE(UPPER(modele_compatible), ' ', ''), '_', '') IN ('VTOLX', 'VTOL-X');

-- 5b. Fusionner les doublons (même référence + même modèle) en gardant le prix le plus bas
CREATE TEMPORARY TABLE PiecesStock_propre AS
SELECT
    reference,
    modele_compatible,
    SUM(quantite)       AS quantite,
    MIN(prix_unitaire)  AS prix_unitaire
FROM PiecesStock
GROUP BY reference, modele_compatible;

DELETE FROM PiecesStock;

INSERT INTO PiecesStock (reference, modele_compatible, quantite, prix_unitaire)
SELECT reference, modele_compatible, quantite, prix_unitaire FROM PiecesStock_propre;

DROP TEMPORARY TABLE PiecesStock_propre;


-- ============================================================
-- ÉTAPE 6 — Vérifications post-migration
-- ============================================================

-- Contrôle : types de drones restants
--SELECT DISTINCT type_drone, COUNT(*) AS nb FROM Drone GROUP BY type_drone;

-- Contrôle : modèles restants
--

-- Contrôle : pièces de maintenance restantes
--
-- Contrôle : matériels mission
--
-- Contrôle : stock fusionné
--
-- Contrôle : pièces stock fusionnées
--
-- ============================================================
-- FIN DE LA MIGRATION
-- ============================================================

-- Réactivation du safe mode
SET SQL_SAFE_UPDATES = 1;

SELECT '=== Migration terminée avec succès ===' AS message;