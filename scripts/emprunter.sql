CREATE PROCEDURE EmprunterLivre
    @LivreID INT,
    @EmprunteurID INT,
    @DateEmprunt DATE,
    @DateRetourPrevue DATE
AS
BEGIN
    INSERT INTO Transactions (LivreID, EmprunteurID, DateEmprunt, DateRetourPrevue)
    VALUES (@LivreID, @EmprunteurID, @DateEmprunt, @DateRetourPrevue);
END;

