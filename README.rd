# Gestion de Bibliothèque

Ce projet vise à créer un système de gestion de bibliothèque utilisant Microsoft SQL Server comme base de données.

## Contenu

1. [Conception du Projet](#conception-du-projet)

   - [Diagramme de Classes:](#diagramme-de-classes)
     - Livres : Stocke les informations sur les livres, avec des attributs tels que Titre, AuteurID (clé étrangère), ISBN, etc.
     - Auteurs : Contient les détails des auteurs, y compris le nom et d'autres informations.
     - Emprunteurs : Enregistre les détails des emprunteurs, y compris le nom, l'adresse, etc.
     - Transactions : Suit les transactions d'emprunt et de retour, avec des détails tels que la date d'emprunt, la date de retour prévue, etc.
   - [Diagramme de Données](#diagramme-de-données)

     - ## Livres

       - LivreID (PK)
       - Titre
       - AuteurID (FK)
       - ISBN
       - ...

     - ## Auteurs

       - AuteurID (PK)
       - Nom
       - ...

     - ## Emprunteurs

       - EmprunteurID (PK)
       - Nom
       - Adresse
       - ...

     - ## Transactions

     * TransactionID (PK)
     * LivreID (FK)
     * EmprunteurID (FK)
     * DateEmprunt
     * DateRetourPrevue
     * DateRetourEffective
     * ...

- [Diagramme de Cas d'Utilisation](#diagramme-de-cas-dutilisation)

      - Gérer Livres :

      Ajouter Livre
      Modifier Livre
      Supprimer Livre

      - Gérer Auteurs :

      Ajouter Auteur
      Modifier Auteur
      Supprimer Auteur

      - Gérer Emprunteurs :

      Ajouter Emprunteur
      Modifier Emprunteur
      Supprimer Emprunteur

      - Gérer Transactions :

      Enregistrer Emprunt
      Enregistrer Retour

      - Rechercher :

      Rechercher Livres Disponibles
      Rechercher Emprunteurs
      Rechercher Transactions

2. [Scripts SQL](#scripts-sql)
   - [Création de la Base de Données](#création-de-la-base-de-données)
   - [Insertion de Données Initiales](#insertion-de-données-initiales)
   - [Requêtes Avancées](#requêtes-avancées)
   - [Procédures Stockées](#procédures-stockées)
3. [Déploiement](#déploiement)

4. [Documentation](#documentation)

## Conception du Projet

### Diagramme de Classes

![Diagramme de Classes](lien_vers_votre_image_classes.png)

### Diagramme de Données

```plaintext
// Inclure ici votre modèle de données en texte
```
