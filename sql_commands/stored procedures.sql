CREATE PROCEDURE usp_UpdateCustomerAddress
    @CustomerID INT,
    @NewAddress NVARCHAR(255),
    @CurrentDate DATE
AS
BEGIN

    BEGIN TRANSACTION;

    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Dim_Customer WHERE CustomerID = @CustomerID AND Is_Current = 1)
        BEGIN
            UPDATE Dim_Customer
            SET End_Date = @CurrentDate,
                Is_Current = 0
            WHERE CustomerID = @CustomerID AND Is_Current = 1;

            INSERT INTO Dim_Customer (CustomerID, Name, Address, Start_Date, Is_Current, Old_Address)
            SELECT
                CustomerID,  
                Name,        
                @NewAddress, 
                @CurrentDate, 
                1,           
                Address      
            FROM Dim_Customer
            WHERE CustomerID = @CustomerID AND Is_Current = 0; 
        END
        ELSE
        BEGIN
            RAISERROR('Customer not found or already inactive.', 16, 1);
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;