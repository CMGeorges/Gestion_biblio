-- create-database.sql

USE master;
GO

-- Créer la base de données
CREATE DATABASE Biblioteca;
GO

USE Biblioteca;
GO

-- Table des Auteurs
CREATE TABLE Auteurs (
    AuteurID INT PRIMARY KEY,
    Nom NVARCHAR(100) NOT NULL
);

-- Table des Livres
CREATE TABLE Livres (
    LivreID INT PRIMARY KEY,
    Titre NVARCHAR(255) NOT NULL,
    AuteurID INT FOREIGN KEY REFERENCES Auteurs(AuteurID),
    ISBN NVARCHAR(20) NOT NULL,
);

-- Table des Emprunteurs
CREATE TABLE Emprunteurs (
    EmprunteurID INT PRIMARY KEY,
    Nom NVARCHAR(100) NOT NULL,
    Adresse NVARCHAR(255) NOT NULL,
);

-- Table des Transactions
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    LivreID INT FOREIGN KEY REFERENCES Livres(LivreID),
    EmprunteurID INT FOREIGN KEY REFERENCES Emprunteurs(EmprunteurID),
    DateEmprunt DATE NOT NULL,
    DateRetourPrevue DATE,
    DateRetourEffective DATE,
);



-- Ajouter des colonnes pour les frais et le statut du livre à la table des Transactions
ALTER TABLE dbo.Transactions
ADD FraisRetard DECIMAL(10, 2) NULL,
    LivrePerdu BIT NULL;

-- Exemple d'ajustement des frais pour retard après 90 jours
UPDATE dbo.Transactions
SET FraisRetard = 10.00
WHERE DateRetourEffective IS NULL AND DATEDIFF(DAY, DateRetourPrevue, GETDATE()) > 90;

-- Exemple de mise à jour du statut du livre en cas de perte
UPDATE dbo.Transactions
SET LivrePerdu = 1
WHERE DateRetourEffective IS NULL AND DATEDIFF(DAY, DateRetourPrevue, GETDATE()) > 90;
