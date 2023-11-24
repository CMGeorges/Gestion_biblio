-- Exemples d'insertion pour la table des Auteurs
DECLARE @i INT = 1
WHILE @i <= 50
BEGIN
    INSERT INTO Auteurs (AuteurID, Nom) VALUES
    (@i, 'Auteur' + CAST(@i AS NVARCHAR(10)));
    SET @i = @i + 1;
END;

-- Exemples d'insertion pour la table des Livres
DECLARE @j INT = 1
WHILE @j <= 50
BEGIN
    INSERT INTO Livres (LivreID, Titre, AuteurID, ISBN) VALUES
    (@j, 'Livre' + CAST(@j AS NVARCHAR(10)), @j, 'ISBN' + CAST(@j AS NVARCHAR(10)));
    SET @j = @j + 1;
END;

-- Exemples d'insertion pour la table des Emprunteurs
DECLARE @k INT = 1
WHILE @k <= 50
BEGIN
    INSERT INTO Emprunteurs (EmprunteurID, Nom, Adresse) VALUES
    (@k, 'Emprunteur' + CAST(@k AS NVARCHAR(10)), 'Adresse' + CAST(@k AS NVARCHAR(10)));
    SET @k = @k + 1;
END;

-- Exemples d'insertion pour la table des Transactions
DECLARE @l INT = 1
WHILE @l <= 50
BEGIN
    INSERT INTO Transactions (TransactionID, LivreID, EmprunteurID, DateEmprunt, DateRetourPrevue, DateRetourEffective) VALUES
    (@l, @l, @l, '2023-01-01', '2023-01-15', '2023-01-14');
    SET @l = @l + 1;
END;
