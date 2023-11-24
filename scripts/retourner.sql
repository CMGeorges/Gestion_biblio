CREATE PROCEDURE RetournerLivre
    @TransactionID INT,
    @DateRetourEffective DATE
AS
BEGIN
    UPDATE Transactions
    SET DateRetourEffective = @DateRetourEffective
    WHERE TransactionID = @TransactionID;
END;
