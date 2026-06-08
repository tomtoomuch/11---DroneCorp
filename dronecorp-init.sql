-- ============================================================
-- DroneCorp_init.sql
-- Base de données de départ — volontairement mal conçue
-- Environnement : DroneCorp_TEST
-- Outil cible   : MySQL Workbench

-- ============================================================

DROP DATABASE IF EXISTS DroneCorp_TEST;
CREATE DATABASE DroneCorp_TEST CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE DroneCorp_TEST;

-- ============================================================
-- TABLE : Drone

-- ============================================================
CREATE TABLE Drone (
    idDrone     INT PRIMARY KEY AUTO_INCREMENT,
    nom         VARCHAR(100),
    type_drone  VARCHAR(50),
    modele      VARCHAR(50),
    autonomie   INT,      -- en minutes (non documenté)
    vitesse     INT,      -- en km/h (non documenté)
    poids       FLOAT     -- en kg
);

INSERT INTO Drone (nom, type_drone, modele, autonomie, vitesse, poids) VALUES
-- AX-100 (quadricoptères) — types incohérents
('AigleX',       'Quadri',           'AX-100',  25, 45, 1.2),
('SkyMax',       'Quadricoptère',    'AX-100',  30, 50, 1.3),
('Mistral',      'quadri',           'AX100',   28, 47, 1.25),
('Boréal',       'QUADRI',           'ax-100',  26, 44, 1.2),
('Zéphyr',       'Quadricoptere',    'Ax100',   29, 48, 1.3),
('Sirocco',      'quadricoptère',    'AX 100',  27, 46, 1.2),
('Tramontane',   'Quadri.',          'AX-100',  30, 50, 1.35),
('Libeccio',     'QUADRICOPTERE',    'ax100',   25, 45, 1.2),

-- HX-200 (hexacoptères) — types et modèles incohérents
('Falcon',       'Hexa',             'HX-200',  40, 60, 2.1),
('Titan',        'Hexacoptère',      'HX200',   38, 58, 2.0),
('Condor',       'hexa',             'hx-200',  42, 62, 2.15),
('Raptor',       'HEXA',             'HX 200',  39, 59, 2.05),
('Vautour',      'Hexacoptere',      'Hx200',   41, 61, 2.1),
('Pygargue',     'hexacoptère',      'HX-200',  40, 60, 2.2),
('Balbuzard',    'HEXACOPTÈRE',      'hx200',   38, 58, 2.0),
('Circaète',     'Hexa.',            'HX200',   43, 63, 2.3),

-- VTOL-X (vtol) — types incohérents
('PhoenixV',     'VTOL',             'VTOL-X',  55, 80, 3.5),
('AresVTOL',     'Vtol',             'VtolX',   52, 78, 3.4),
('HermèsV',      'vtol',             'VTOL X',  57, 82, 3.6),
('ZeusV',        'V.T.O.L',         'vtol-x',  50, 75, 3.3),
('AtlasV',       'VTOL.',            'Vtol-X',  54, 79, 3.5),
('OdysseyV',     'Vtol',             'VTOLX',   56, 81, 3.55),

-- données aberrantes volontaires
('GhostDrone',   'Inconnu',          'XX-999',  999, 999, 0.0),  -- poids impossible
('MiniDrone',    'Nano',             'MN-50',   5,  15, 0.05),   -- autonomie très faible

-- AX-100 supplémentaires
('Autan',        'Quadri',           'AX-100',  27, 46, 1.22),
('Harmattan',    'quadricoptère',    'AX100',   28, 47, 1.28),
('Foehn',        'QUADRI',           'AX-100',  26, 45, 1.2),
('Chinook',      'Quadricoptere',    'ax100',   29, 49, 1.3),
('Ponant',       'Quadricoptère',    'AX-100',  30, 50, 1.35),
('Levant',       'quadri',           'Ax-100',  25, 44, 1.2),
('Nordet',       'QUADRICOPTERE',    'AX 100',  28, 48, 1.25),
('Galerne',      'Quadri.',          'ax-100',  27, 46, 1.2),
('Vent Solaire', 'quadricoptere',    'AX100',   29, 47, 1.3),
('Brise',        'Quadri',           'AX-100',  26, 45, 1.22),

-- HX-200 supplémentaires
('Albatros',     'Hexa',             'HX-200',  41, 61, 2.12),
('Faucon',       'hexacoptère',      'HX200',   39, 59, 2.02),
('Aigle',        'HEXA',             'hx-200',  42, 62, 2.18),
('Milan',        'Hexacoptere',      'Hx200',   40, 60, 2.08),
('Épervier',     'Hexacoptère',      'HX-200',  38, 58, 2.0),
('Busard',       'hexa',             'HX 200',  43, 63, 2.25),
('Harfang',      'HEXACOPTÈRE',      'hx200',   41, 61, 2.1),
('Autour',       'Hexa.',            'HX200',   39, 59, 2.05),
('Crécerelle',   'Hexacoptere',      'HX-200',  40, 60, 2.1),
('Bondrée',      'hexa',             'HX200',   42, 62, 2.2),

-- VTOL-X supplémentaires
('TitanV',       'VTOL',             'VTOL-X',  53, 78, 3.45),
('CronusV',      'vtol',             'VtolX',   55, 80, 3.5),
('HeliosV',      'Vtol',             'VTOL X',  51, 76, 3.35),
('ApolloV',      'V.T.O.L',         'vtol-x',  57, 82, 3.6),
('ArésV2',       'VTOL.',            'Vtol-X',  54, 79, 3.5),
('NikeV',        'Vtol',             'VTOLX',   52, 77, 3.4),
('HéphaïstosV',  'vtol',             'VTOL-X',  56, 81, 3.55),
('DéméterV',     'VTOL',             'VtolX',   50, 75, 3.3),

-- autres aberrantes
('NullDrone',    NULL,               'AX-100',  25, 45, 1.2),   -- type NULL
('PoidsFou',     'Quadri',           'AX-100',  25, 45, 99.9),  -- poids aberrant
('VitesseFolle', 'Hexa',             'HX-200',  40, 999, 2.1); -- vitesse aberrante


-- ============================================================
-- TABLE : Maintenance

-- ============================================================
CREATE TABLE Maintenance (
    idMaint     INT PRIMARY KEY AUTO_INCREMENT,
    drone       INT,
    date_maint  VARCHAR(20),   -- stockée en texte, pas en DATE
    piece       VARCHAR(100),
    commentaire VARCHAR(255)
);

INSERT INTO Maintenance (drone, date_maint, piece, commentaire) VALUES
(1,  '2024-01-10', 'Batterie',    'RAS'),
(1,  '2024-02-15', 'moteur',      'Vibrations détectées'),
(2,  '2024-02-20', 'Moteur',      'Bruit anormal'),
(3,  '2024-03-01', 'Hélice',      'Cassée'),
(4,  '2024-03-05', 'MOTEUR',      'Surchauffe'),
(5,  '2024-03-10', 'batterie',    'Capacité réduite'),
(6,  '2024-03-12', 'moteeur',     'Faute de frappe volontaire'),
(7,  '2024-03-15', 'Helice',      'Fissure'),
(8,  '2024-03-18', 'hélice',      'Déséquilibrage'),
(9,  '2024-04-01', 'Contrôleur',  'Reset effectué'),
(10, '2024-04-03', 'BATTERIE',    NULL),
(11, '2024-04-05', 'Moteur',      ''),
(12, '2024-04-07', 'helice',      'Vibrations'),
(13, '2024-04-10', 'batterie',    'RAS'),
(14, '2024-04-12', 'MOTEUR',      'Remplacement complet'),
(15, '2024-04-15', 'TransitionRotor', 'Usure normale'),
(16, '2024-04-18', 'transition rotor', 'Bruit'),
(17, '2024-04-20', 'Batterie',    'RAS'),
(18, '2024-04-22', 'Hélice',      'Cassée suite à atterrissage'),
(19, '2024-04-25', 'controleur',  'Mise à jour firmware'),
(20, '2024-04-28', 'Contrôleur',  'Panne'),
(1,  '2024-05-01', 'Batterie',    'Deuxième remplacement'),
(3,  '2024-05-03', 'Moteur',      'Roulement usé'),
(5,  '2024-05-06', 'HELICE',      NULL),
(7,  '2024-05-09', 'mOtEuR',      'Casse volontaire de casse'),
(9,  '2024-05-12', 'Batterie',    'RAS'),
(2,  '2024-05-15', 'Hélice',      'Fissure bord d''attaque'),
(4,  '2024-05-18', 'Contrôleur',  'Défaillance capteur'),
(6,  '2024-05-20', 'batterie',    'Gonflement détecté'),
(17, '2024-05-22', 'TransitionRotor', 'Remplacement préventif'),
(20, '2024-05-25', 'moteur',      'Vibrations hautes fréquences'),
-- Juin 2024
(21, '2024-06-01', 'Batterie',    'RAS'),
(22, '2024-06-02', 'HÉLICE',      'Fissure importante'),
(23, '2024-06-03', 'moteur',      'Bruit de roulement'),
(24, '2024-06-04', 'Contrôleur',  'Mise à jour firmware'),
(25, '2024-06-05', 'batterie',    NULL),
(26, '2024-06-06', 'Hélice',      'RAS'),
(10, '2024-06-07', 'MOTEUR',      'Surchauffe critique'),
(11, '2024-06-08', 'Helice',      'Cassée'),
(12, '2024-06-09', 'hélice',      'Vibrations'),
(13, '2024-06-10', 'Batterie',    'Capacité à 60%'),
(14, '2024-06-11', 'controleur',  'Reset'),
(15, '2024-06-12', 'TransitionRotor', 'RAS'),
(16, '2024-06-13', 'transition rotor', 'Bruit sourd'),
(17, '2024-06-14', 'moteur',      ''),
(18, '2024-06-15', 'BATTERIE',    'Remplacement'),
(19, '2024-06-16', 'Hélice',      'Ébréchée'),
(1,  '2024-06-17', 'Contrôleur',  'Panne GPS'),
(2,  '2024-06-18', 'batterie',    'RAS'),
(3,  '2024-06-19', 'Moteur',      'Vibrations'),
(4,  '2024-06-20', 'HELICE',      NULL),
-- Juillet 2024
(5,  '2024-07-01', 'Batterie',    'RAS'),
(6,  '2024-07-02', 'moteur',      'Roulement à remplacer'),
(7,  '2024-07-03', 'Hélice',      'Fissure'),
(8,  '2024-07-04', 'CONTRÔLEUR',  'Défaillance IMU'),
(9,  '2024-07-05', 'batterie',    'Gonflement léger'),
(10, '2024-07-06', 'Moteur',      'Bruit'),
(11, '2024-07-07', 'helice',      'RAS'),
(12, '2024-07-08', 'Batterie',    'Remplacement préventif'),
(13, '2024-07-09', 'MOTEUR',      'Surchauffe'),
(14, '2024-07-10', 'Contrôleur',  'Mise à jour'),
(15, '2024-07-11', 'TransitionRotor', 'Usure avancée'),
(16, '2024-07-12', 'transition rotor', 'RAS'),
(17, '2024-07-13', 'Hélice',      'Cassée lors mission'),
(18, '2024-07-14', 'BATTERIE',    NULL),
(19, '2024-07-15', 'moteur',      'Vibrations basses fréquences'),
(20, '2024-07-16', 'hélice',      'Déséquilibrage'),
(21, '2024-07-17', 'Contrôleur',  'RAS'),
(22, '2024-07-18', 'batterie',    'Capacité réduite'),
(23, '2024-07-19', 'MOTEUR',      ''),
(24, '2024-07-20', 'Helice',      'Inspection standard'),
(1,  '2024-07-21', 'Batterie',    'Troisième remplacement'),
(3,  '2024-07-22', 'moteur',      'RAS'),
(5,  '2024-07-23', 'Hélice',      NULL),
(7,  '2024-07-24', 'BATTERIE',    'Défaillance cellule'),
(9,  '2024-07-25', 'Contrôleur',  'Panne partielle'),
-- Août 2024
(25, '2024-08-01', 'Batterie',    'RAS'),
(26, '2024-08-02', 'MOTEUR',      'Bruit de friction'),
(27, '2024-08-03', 'hélice',      'Fissure bord fuite'),
(28, '2024-08-04', 'Contrôleur',  'Firmware obsolète'),
(29, '2024-08-05', 'batterie',    NULL),
(30, '2024-08-06', 'Moteur',      'Vibrations'),
(31, '2024-08-07', 'Hélice',      'Cassée'),
(32, '2024-08-08', 'BATTERIE',    'Remplacement'),
(33, '2024-08-09', 'controleur',  'Reset complet'),
(34, '2024-08-10', 'TransitionRotor', 'Bruit métallique'),
(35, '2024-08-11', 'moteur',      'RAS'),
(36, '2024-08-12', 'Hélice',      'Inspection'),
(2,  '2024-08-13', 'Batterie',    'Capacité 55%'),
(4,  '2024-08-14', 'MOTEUR',      'Surchauffe'),
(6,  '2024-08-15', 'helice',      'Vibrations excessives'),
(8,  '2024-08-16', 'Contrôleur',  'Panne capteur altitude'),
(10, '2024-08-17', 'batterie',    'RAS'),
(12, '2024-08-18', 'Moteur',      ''),
(14, '2024-08-19', 'HÉLICE',      'Ébréchée'),
(16, '2024-08-20', 'Batterie',    NULL),
-- dates au format incohérent (volontaire)
(1,  '10/01/2024',  'Batterie',   'Date format DD/MM/YYYY'),
(2,  '15-02-2024',  'Moteur',     'Date format DD-MM-YYYY'),
(3,  '2024/03/01',  'Hélice',     'Date format YYYY/MM/DD'),
(4,  'mars 2024',   'MOTEUR',     'Date en texte libre'),
(5,  '01 avril 24', 'batterie',   'Date approximative');


-- ============================================================
-- TABLE : Mission

-- ============================================================
CREATE TABLE Mission (
    idMission   INT PRIMARY KEY AUTO_INCREMENT,
    drone       INT,
    zone        VARCHAR(20),
    materiel    VARCHAR(100),
    quantite    INT
);

INSERT INTO Mission (drone, zone, materiel, quantite) VALUES
-- Zone Z1 Nord
(1,  'Z1',    'Eau',          20),
(1,  'Z1',    'eau',          10),   -- doublon avec casse différente
(2,  'Z1',    'EAU',          15),   -- encore un doublon
(3,  'Z1',    'Nourriture',   30),
(4,  'Z1',    'nourriture',   25),
(5,  'Z1',    'Médicaments',  10),
(6,  'Z1',    'Tentes',        5),
(7,  'Z1',    'Eau',          18),
(8,  'Z1',    'NOURRITURE',   40),
(9,  'Z1',    'médicaments',   7),
(10, 'Z1',    'Tentes',        3),
(11, 'Z1',    'Eau',          22),
(12, 'Z1',    'Nourriture',   35),
(13, 'Z1',    'Médicaments',  12),
(14, 'Z1',    'tentes',        4),
(15, 'z1',    'Eau',          16),   -- zone minuscule
(16, 'Z1',    'EAU',          11),

-- Zone Z2 Sud
(2,  'Z2',    'Médicaments',   5),
(7,  'Z2',    'medicaments',   8),   -- casse différente
(8,  'Z2',    'MEDICAMENTS',   3),
(9,  'Z2',    'Eau',          40),
(10, 'Z2',    'Nourriture',   50),
(11, 'Z2',    'Tentes',       10),
(12, 'z2',    'Eau',          20),   -- zone en minuscule
(13, 'Z2',    'nourriture',   45),
(14, 'Z2',    'TENTES',        8),
(15, 'Z2',    'Eau',          30),
(16, 'Z2',    'Médicaments',  15),
(17, 'Z2',    'Nourriture',   60),
(18, 'z2',    'médicaments',   6),
(1,  'Z2',    'Eau',          25),
(3,  'Z2',    'Tentes',        7),
(5,  'Z2',    'NOURRITURE',   55),

-- Zone Z3 Est
(3,  'Z3',    'Nourriture',   30),
(13, 'Z3',    'Eau',          25),
(14, 'Z3',    'Médicaments',  15),
(15, 'Z3',    'Tentes',        8),
(16, 'Zone3', 'Nourriture',   20),   -- zone mal saisie
(17, 'Z3',    'eau',          18),
(18, 'Z3',    'NOURRITURE',   35),
(19, 'Z3',    'médicaments',  10),
(20, 'z3',    'Tentes',        6),   -- zone minuscule
(2,  'Z3',    'Eau',          28),
(4,  'Z3',    'Nourriture',   42),
(6,  'Z3',    'Médicaments',   9),
(8,  'Zone 3','Tentes',        5),   -- zone mal saisie avec espace

-- Zone Z4 Ouest
(17, 'Z4',    'Eau',          35),
(18, 'Z4',    'Médicaments',  12),
(19, 'Z4',    'Nourriture',   48),
(20, 'Z4',    'Tentes',        9),
(21, 'Z4',    'eau',          22),
(22, 'Z4',    'MEDICAMENTS',   7),
(1,  'z4',    'Nourriture',   33),   -- zone minuscule
(3,  'Z4',    'Tentes',       11),

-- Zone Z5 Centre
(19, 'Z5',    'Tentes',        6),
(20, 'Z5',    'Nourriture',   45),
(21, 'Z5',    'Eau',          38),
(22, 'Z5',    'Médicaments',  20),
(23, 'z5',    'NOURRITURE',   50),   -- zone minuscule
(24, 'Z5',    'tentes',        4),
(25, 'Z5',    'Eau',          17),
(2,  'Zone5', 'Médicaments',  14),   -- zone mal saisie

-- Missions avec quantités aberrantes
(1,  'Z1',    'Eau',        5000),   -- poids total impossible pour ce drone
(9,  'Z2',    'Tentes',      500),   -- idem
(21, 'Z3',    'Nourriture',    0),   -- quantité nulle
(5,  'Z1',    'Eau',        -10),    -- quantité négative
(10, 'Z2',    'Nourriture', 9999),   -- aberrante

-- Missions sans drone valide
(99,  'Z1',   'Eau',          10),   -- drone inexistant
(NULL,'Z2',   'Médicaments',   5),   -- drone NULL
(150, 'Z3',   'Tentes',        3),   -- drone inexistant
(0,   'Z4',   'Nourriture',   20);   -- drone id=0 invalide


-- ============================================================
-- TABLE : Zone

-- ============================================================
CREATE TABLE Zone (
    idZone      VARCHAR(10) PRIMARY KEY,
    nom         VARCHAR(100),
    zone_voisine VARCHAR(10)
);

INSERT INTO Zone (idZone, nom, zone_voisine) VALUES
('Z1', 'Nord',         'Z2'),
('Z2', 'Sud',          'Z1'),
('Z3', 'Est',          NULL),
('Z4', 'Ouest',        'Z3'),
('Z5', 'Centre',       'Z1'),
('Z6', 'Nord-Est',     'Z3'),
('Z7', 'Nord-Ouest',   'Z4'),
('Z8', 'Sud-Est',      'Z3'),
('Z9', 'Sud-Ouest',    'Z4'),
('Z10','Haute Plaine', NULL);
-- Rappel : chaque zone a potentiellement plusieurs voisins réels
-- Z5 Centre touche Z1, Z2, Z3, Z4 — mais on ne peut stocker qu'un seul voisin
-- Z6 Nord-Est touche Z1, Z3, Z5 — même problème
-- Z10 Haute Plaine est enclavée, devrait avoir Z6 et Z8 comme voisins


-- ============================================================
-- TABLE : Stock (gestion manuelle, non automatisée)

-- ============================================================
CREATE TABLE Stock (
    idStock         INT PRIMARY KEY AUTO_INCREMENT,
    materiel        VARCHAR(100),
    unite           VARCHAR(20),
    quantite_dispo  INT,
    derniere_maj    VARCHAR(20)   -- date en texte
);

INSERT INTO Stock (materiel, unite, quantite_dispo, derniere_maj) VALUES
('Eau',          'L',      500,  '2024-05-01'),
('eau',          'litre',  100,  '2024-05-10'),   -- doublon avec casse et unité différentes
('Médicaments',  'kg',     200,  '2024-05-01'),
('Nourriture',   'kg',     800,  '2024-05-01'),
('nourriture',   'Kg',      50,  '2024-05-15'),   -- doublon
('Tentes',       'unité',   50,  '2024-05-01'),
('Tentes',       'pièce',   10,  '2024-05-12'),   -- doublon avec unité différente
('Carburant',    'L',      300,  '2024-04-20'),
('Batteries',    'unité',   80,  '2024-05-08'),
('BATTERIES',    'pièce',   20,  '2024-05-09'),   -- doublon majuscules
('EAU',          'L',       75,  '2024-06-01'),   -- troisième doublon Eau
('Medicaments',  'kg',      30,  '2024-06-05'),   -- doublon sans accent
('NOURRITURE',   'kg',     120,  '2024-06-10'),   -- doublon majuscules
('tentes',       'unité',   15,  '2024-06-15'),   -- doublon minuscules
('Carburant',    'litre',   50,  '2024-06-20'),   -- doublon unité différente
('couvertures',  'unité',   40,  '2024-05-20'),
('Couvertures',  'pièce',   25,  '2024-06-01'),   -- doublon casse + unité
('Lampes',       'unité',   60,  '2024-05-25'),
('lampes',       'pièce',   15,  '2024-06-08'),   -- doublon
('Kits premiers secours', 'unité', 35, '2024-05-18'),
('kit premiers secours',  'boite', 10, '2024-06-02'),  -- doublon casse + unité
('Eau potable',  'L',      200,  '2024-06-12'),   -- quasi-doublon sémantique avec Eau
('Vivres',       'kg',     150,  '2024-06-18'),   -- quasi-doublon avec Nourriture
('Médicament',   'kg',      20,  '2024-06-22');   -- quasi-doublon singulier/pluriel


-- ============================================================
-- TABLE : PiecesStock (stock pièces, non lié à une table pièce normalisée)

-- ============================================================
CREATE TABLE PiecesStock (
    idPieceStock    INT PRIMARY KEY AUTO_INCREMENT,
    reference       VARCHAR(50),
    modele_compatible VARCHAR(50),
    quantite        INT,
    prix_unitaire   DECIMAL(10,2)
);

INSERT INTO PiecesStock (reference, modele_compatible, quantite, prix_unitaire) VALUES
('BAT-AX100',   'AX-100',   30,  129.00),
('BAT-AX100',   'AX100',    10,  129.00),   -- doublon modele différent
('MOT-AX100',   'AX-100',   15,  249.00),
('MOT-AX100',   'ax-100',    4,  249.00),   -- doublon casse modele
('HEL-HX200',   'HX-200',   25,   89.00),
('HEL-HX200',   'HX200',     5,   89.00),   -- doublon
('HEL-HX200',   'hx-200',    3,   92.00),   -- doublon + prix différent
('CTRL-HX200',  'HX-200',   12,  199.00),
('CTRL-HX200',  'Hx200',     2,  199.00),   -- doublon casse
('TR-VTOLX',    'VTOL-X',    8,  399.00),
('TR-VTOLX',    'VtolX',     2,  399.00),   -- doublon
('TR-VTOLX',    'vtol-x',    1,  410.00),   -- doublon + prix différent
('BAT-AX100',   'ax-100',    5,  135.00),   -- doublon + prix différent
('BAT-HX200',   'HX-200',   18,  159.00),
('BAT-HX200',   'HX200',     6,  159.00),   -- doublon
('MOT-HX200',   'HX-200',   10,  289.00),
('MOT-HX200',   'hx200',     3,  295.00),   -- doublon + prix différent
('BAT-VTOLX',   'VTOL-X',   12,  220.00),
('BAT-VTOLX',   'VtolX',     4,  220.00),   -- doublon
('MOT-VTOLX',   'VTOL-X',    7,  450.00),
('MOT-VTOLX',   'vtol-x',    2,  460.00),   -- doublon + prix différent
('HEL-VTOLX',   'VTOL-X',   20,  120.00),
('CTRL-AX100',  'AX-100',    9,  179.00),
('CTRL-AX100',  'AX100',     3,  179.00),   -- doublon
('CTRL-VTOLX',  'VTOL-X',    5,  350.00),
('GPS-AX100',   'AX-100',   14,   99.00),
('GPS-HX200',   'HX-200',    8,  115.00),
('GPS-VTOLX',   'VTOL-X',    4,  140.00),
('CAM-AX100',   'AX-100',   11,  210.00),
('CAM-HX200',   'HX-200',    6,  260.00);


-- ============================================================
-- VUES 
-- ============================================================

-- Vue #1 : v_drones_legers
-- Censée retourner les drones de moins de 1.5kg

CREATE VIEW v_drones_legers AS
SELECT idDrone, nom, type_drone, modele, poids
FROM Drone
WHERE vitesse < 1.5;   -- ← BUG : devrait être poids < 1.5


-- Vue #2 : v_stats_types
-- Censée faire des stats par type de drone

CREATE VIEW v_stats_types AS
SELECT type_drone, COUNT(*) AS nb_drones, AVG(autonomie) AS autonomie_moyenne
FROM Drone
GROUP BY type_drone;



-- Vue #3 : v_missions_zone
-- Censée joindre missions et zones

CREATE VIEW v_missions_zone AS
SELECT m.idMission, m.drone, z.nom AS zone_nom, m.materiel, m.quantite
FROM Mission m
JOIN Zone z ON m.zone = z.idZone;


-- Vue #4 : v_maintenance_resume
-- Censée compter les maintenances par pièce
CREATE VIEW v_maintenance_resume AS
SELECT piece, COUNT(*) AS nb_interventions
FROM Maintenance
GROUP BY piece;


-- Vue #5 : v_stock_total
-- Censée afficher le stock total par matériel
CREATE VIEW v_stock_total AS
SELECT materiel, SUM(quantite_dispo) AS total, unite
FROM Stock
GROUP BY materiel, unite;


-- ============================================================
-- FIN DU SCRIPT
-- ============================================================
SELECT '=== DroneCorp_TEST initialisé avec succès ===' AS message;