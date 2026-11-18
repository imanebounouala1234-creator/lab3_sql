DROP DATABASE IF EXISTS bibliotheque;
CREATE DATABASE bibliotheque CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bibliotheque;

CREATE TABLE auteur (
    id_auteur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE
);

CREATE TABLE ouvrage (
    id_ouvrage INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    isbn CHAR(13) UNIQUE NOT NULL,
    disponible BOOL NOT NULL,
    id_auteur INT,
    FOREIGN KEY (id_auteur) REFERENCES auteur(id_auteur),
    CHECK (isbn REGEXP '^[0-9]{13}$')
);

CREATE TABLE abonnee (
    id_abonnee INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    date_inscription DATE NOT NULL,
    CHECK (email LIKE '%@%._%')
);

CREATE TABLE emprunt (
    id_ouvrage INT,
    id_abonnee INT,
    date_debut DATE,
    date_fin DATE NULL,
    date_retour_effective DATE NULL,
    FOREIGN KEY (id_ouvrage) REFERENCES ouvrage(id_ouvrage),
    FOREIGN KEY (id_abonnee) REFERENCES abonnee(id_abonnee),
    CHECK (date_fin >= date_debut)
);

-- تعمار الجداول الأربعة ببيانات صحيحة تحترم الشروط (ISBN و date_inscription)
INSERT INTO auteur (nom, prenom, date_naissance) VALUES 
('Hossain', 'Taha', '1889-11-15'),
('Mhfod', 'Najib', '1911-12-11'),
('Hakim', 'Tawfiq', '1898-09-09'),
('Kanfani', 'Ghassan', '1936-06-08');

INSERT INTO ouvrage (titre, isbn, disponible, id_auteur) VALUES 
('Les Misérables', '9782070409228', TRUE, 1),
('Le Fils du pauvre', '9782020006019', FALSE, 2),
('Le Prophète', '9782253006329', TRUE, 3),
('Les Hommes au soleil', '9782742702107', TRUE, 4);

INSERT INTO abonnee (nom, prenom, email, date_inscription) VALUES 
('Alami', 'Imane', 'imane.alami@gmail.com', '2026-01-15'),
('Dupont', 'Luc', 'luc.martin@example.com', '2026-02-10'),
('Bennani', 'Sara', 'sara.bennani@test.org', '2026-03-05'),
('Tazi', 'Omar', 'omar.tazi@yahoo.fr', '2026-04-20');

INSERT INTO emprunt (id_ouvrage, id_abonnee, date_debut, date_fin, date_retour_effective) VALUES 
(1, 1, '2026-10-01', '2026-10-15', NULL),
(2, 2, '2026-10-05', '2026-10-20', '2026-10-18'),
(3, 3, '2026-11-10', '2026-12-01', NULL);
USE bibliotheque;

-- 1. Classer les ouvrages par ordre décroissant et prendre les 3 derniers
SELECT * FROM ouvrage ORDER BY id_ouvrage DESC LIMIT 3;

-- 2. Lister les auteurs dont le nom contient au moins 5 caractères
SELECT * FROM auteur WHERE CHAR_LENGTH(nom) >= 5;

-- 3. Trouver les abonnés dont l'email ne provient pas de example.com ni de test.org
SELECT nom, email FROM abonnee WHERE email NOT LIKE '%@example.com' AND email NOT LIKE '%@test.org';

-- 4. Sélectionner les emprunts en retard (date de fin dépassée et non retournés)
SELECT * FROM emprunt WHERE date_fin < CURDATE() AND date_retour_effective IS NULL;
