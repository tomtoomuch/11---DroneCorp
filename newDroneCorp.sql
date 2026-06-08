CREATE DATABASE IF NOT EXISTS gestion_drones;
USE gestion_drones;

-- 2. Tables sans dépendances (ou dépendances simples)
CREATE TABLE zone (
   idZone INT AUTO_INCREMENT PRIMARY KEY,
   nomZone VARCHAR(100) NOT NULL,
   niveauRisque DECIMAL(3,2) NOT NULL
);

CREATE TABLE stock (
   idStock INT PRIMARY KEY,
   materiel VARCHAR(100) NOT NULL,
   unite VARCHAR(20) NOT NULL,
   quantite INT NOT NULL,
   derniereMaj DATE NOT NULL
);

CREATE TABLE modele (
   idModele INT AUTO_INCREMENT PRIMARY KEY,
   modele VARCHAR(50) NOT NULL
);

-- 3. Tables avec dépendances
CREATE TABLE drone (
   idDrone INT AUTO_INCREMENT PRIMARY KEY,
   nom VARCHAR(100) NOT NULL,
   type VARCHAR(50) NOT NULL,
   autonomie INT NOT NULL,
   vitesse DECIMAL(15,2) NOT NULL,
   poids DECIMAL(15,2) NOT NULL,
   idModele INT NOT NULL,
   FOREIGN KEY(idModele) REFERENCES modele(idModele)
);

CREATE TABLE maintenance (
   idMaintenance INT AUTO_INCREMENT PRIMARY KEY,
   dateMaintenance DATE NOT NULL,
   commentaire VARCHAR(255),
   idDrone INT NOT NULL,
   FOREIGN KEY(idDrone) REFERENCES drone(idDrone)
);

CREATE TABLE missions (
   idMission INT AUTO_INCREMENT PRIMARY KEY,
   materiel VARCHAR(100) NOT NULL,
   quantite INT NOT NULL,
   idDrone INT NOT NULL,
   idZone INT NOT NULL,
   FOREIGN KEY(idDrone) REFERENCES drone(idDrone),
   FOREIGN KEY(idZone) REFERENCES zone(idZone)
);

CREATE TABLE piecesStock (
   idPieceStock INT AUTO_INCREMENT PRIMARY KEY,
   reference VARCHAR(50) NOT NULL,
   quantite INT NOT NULL,
   prixUnitaire DECIMAL(15,2) NOT NULL,
   idMaintenance INT NOT NULL,
   UNIQUE(idMaintenance),
   FOREIGN KEY(idMaintenance) REFERENCES maintenance(idMaintenance)
);

-- 4. Tables de jointure
CREATE TABLE approvisionne (
   idMission INT,
   idStock INT,
   PRIMARY KEY(idMission, idStock),
   FOREIGN KEY(idMission) REFERENCES missions(idMission),
   FOREIGN KEY(idStock) REFERENCES stock(idStock)
);

CREATE TABLE est_entourée_de (
   idZone INT,
   idZone_1 INT,
   PRIMARY KEY(idZone, idZone_1),
   FOREIGN KEY(idZone) REFERENCES zone(idZone),
   FOREIGN KEY(idZone_1) REFERENCES zone(idZone)
);

CREATE TABLE peut_avoir (
   idPieceStock INT,
   idModele INT,
   PRIMARY KEY(idPieceStock, idModele),
   FOREIGN KEY(idPieceStock) REFERENCES piecesStock(idPieceStock),
   FOREIGN KEY(idModele) REFERENCES modele(idModele)
);