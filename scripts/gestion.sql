-- Créer un rôle pour le superadministrateur
CREATE ROLE super_admin;


-- Autorisations pour le superadministrateur

-- Accès complet à toutes les tables et procédures stockées
GRANT CONTROL ON SCHEMA::dbo TO super_admin;

-- Autorisation pour exécuter des procédures stockées
GRANT EXECUTE ON SCHEMA::dbo TO super_admin;

-- Ajouter l'utilisateur superadministrateur au rôle
ALTER ROLE super_admin ADD MEMBER [superadmin];


-- Créer un rôle pour la gestion des emprunteurs
CREATE ROLE gestion_emprunteurs;


-- Autorisations pour le rôle de gestion des emprunteurs

-- Accès en lecture à la table des Emprunteurs
GRANT SELECT ON dbo.Emprunteurs TO gestion_emprunteurs;

-- Autorisation pour exécuter des procédures stockées spécifiques (par exemple, EmprunterLivre)
GRANT EXECUTE ON dbo.EmprunterLivre TO gestion_emprunteurs;

