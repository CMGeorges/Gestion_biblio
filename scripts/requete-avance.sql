
--Trouvez les auteurs avec le plus grand nombre de livres dans la bibliothèque :
SELECT Auteurs.Nom, COUNT(*) AS NombreLivres
FROM Livres
INNER JOIN Auteurs ON Livres.AuteurID = Auteurs.AuteurID
GROUP BY Auteurs.Nom
ORDER BY NombreLivres DESC;


--Obtenez la liste des livres disponibles à l'emprunt :
SELECT Livres.Titre, Auteurs.Nom AS NomAuteur
FROM Livres
INNER JOIN Auteurs ON Livres.AuteurID = Auteurs.AuteurID
WHERE Livres.LivreID NOT IN (SELECT LivreID FROM Transactions WHERE DateRetourEffective IS NULL);


--Trouvez les emprunteurs qui ont le plus emprunté de livres :
SELECT Emprunteurs.Nom, COUNT(*) AS NombreLivresEmpruntes
FROM Transactions
INNER JOIN Emprunteurs ON Transactions.EmprunteurID = Emprunteurs.EmprunteurID
GROUP BY Emprunteurs.Nom
ORDER BY NombreLivresEmpruntes DESC;


--Affichez tous les livres empruntés actuellement :
SELECT Livres.Titre, Emprunteurs.Nom, Transactions.DateEmprunt, Transactions.DateRetourPrevue
FROM Transactions
INNER JOIN Livres ON Transactions.LivreID = Livres.LivreID
INNER JOIN Emprunteurs ON Transactions.EmprunteurID = Emprunteurs.EmprunteurID
WHERE Transactions.DateRetourEffective IS NULL;
