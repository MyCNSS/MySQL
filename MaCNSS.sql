DROP DATABASE IF EXISTS MaCNSS;

CREATE DATABASE MaCNSS;

USE MaCNSS;


CREATE TABLE Admin (
                        id int,
                        email varchar(255) UNIQUE KEY,
                        password varchar(255),
                        nom varchar(255),
                        prenom varchar(255)
);

CREATE TABLE Patient (
                         matrecule varchar(255) UNIQUE KEY,
                         nom_P varchar(255),
                         prenom_P varchar(255)
);

CREATE TABLE Agent (
                         id int AUTO_INCREMENT PRIMARY KEY,
                         email varchar(255) UNIQUE KEY,
                         password varchar(255),
                         nom_A varchar(255),
                         prenom_A varchar(255)
);


CREATE TABLE Dossier (
                         id int,
                         prix_retour float,
                         status varchar(255),
                         matrecule varchar(255),
                         id_A int,
                         id_medicament int,
                         id_consultation_medicale int
);



CREATE TABLE Medicament (
                         id int AUTO_INCREMENT PRIMARY KEY,
                         nom_m varchar(255),
                         prix_medicament float,
                         id_categorie int
);



CREATE TABLE ConsultationMedicale (
                         id int AUTO_INCREMENT PRIMARY KEY,
                         prix_consultation_medicale float,
                         id_type_consultation_medicale int
);



CREATE TABLE Categorie (
                         id int AUTO_INCREMENT PRIMARY KEY,
                         prix_reduction float,
                         nom_C varchar(255)
);



CREATE TABLE TypeConsultation (
                          id int AUTO_INCREMENT PRIMARY KEY,
                          prix_reduction float,
                          nom_CM varchar(255)
);



ALTER TABLE `dossier` ADD  CONSTRAINT `id_A` FOREIGN KEY (`id_A`) REFERENCES `Agent`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `dossier` ADD  CONSTRAINT `matrecule` FOREIGN KEY (`matrecule`) REFERENCES `patient`(`matrecule`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `dossier` ADD  CONSTRAINT `id_medicament` FOREIGN KEY (`id_medicament`) REFERENCES `medicament`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `dossier` ADD  CONSTRAINT `id_consultation_medicale` FOREIGN KEY (`id_consultation_medicale`) REFERENCES `consultationmedicale`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `medicament` ADD CONSTRAINT `id_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `consultationmedicale` ADD CONSTRAINT ` id_type_consultation_medicale` FOREIGN KEY (`id_type_consultation_medicale`) REFERENCES `typeconsultation`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `dossier` CHANGE `id` `id` INT(11) NULL DEFAULT NULL AUTO_INCREMENT;
ALTER TABLE `patient` ADD `email` VARCHAR(255) NOT NULL AFTER `prenom_P`;

-- Insert Admin
INSERT INTO `admin` (`id`, `email`, `password`, `nom`, `prenom`) VALUES ('0', 'USEREMAIL', 'HASHPASSWORD', 'NOM', 'PRENOM');

-- Insert Type Of Consultation Medicale
INSERT INTO `typeconsultation` (`id`, `prix_reduction`, `nom_CM`) VALUES (NULL, '0.5', 'Consultation de médecine générale'), (NULL, '0.75', 'Consultation chez le spécialiste'), (NULL, '1', 'Consultation pédiatrique'), (NULL, '0.5', 'Consultation gynécologique'), (NULL, '0', 'Sans Consultation');

-- Insert Consultation Medicale
INSERT INTO `consultationmedicale` (`id`, `prix_consultation_medicale`, `id_type_consultation_medicale`) VALUES (NULL, '200', '1'), (NULL, '500', '2'), (NULL, '400', '3'), (NULL, '600', '4'), (NULL, '0', '5');

-- Insert Category Of Medicament
INSERT INTO `categorie` (`id`, `prix_reduction`, `nom_C`) VALUES (NULL, '0.6', 'Médicaments en vente libre (OTC - Over-the-Counter)'), (NULL, '0.7', 'Médicaments sur ordonnance (Rx) '), (NULL, '0.3', 'Médicaments génériques'), (NULL, '0.9', 'Médicaments de marque');

-- Insert Medicament
INSERT INTO `medicament` (`id`, `nom_m`, `prix_medicament`, `id_categorie`) VALUES (NULL, 'Acétaminophène (paracétamol)', '8', '1'), (NULL, 'Amoxicilline', '34.60', '2'), (NULL, 'Simvastatine', '37.10', '3'), (NULL, 'Lipitor (atorvastatine)', '250', '4');

-- Insert Patient
INSERT INTO `patient` (`matrecule`, `nom_P`, `prenom_P`) VALUES ('BouMar2022', 'Bouchettoy', 'Marouane'), ('ElHakAmin2022', 'El Hakik', 'Amine'), ('SbaMyYouFor', 'Sbai', 'My Youssef');
