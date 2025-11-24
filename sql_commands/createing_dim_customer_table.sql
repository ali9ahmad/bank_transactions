CREATE TABLE Dim_Customer (
    CustomerSK INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate key
    CustomerID INT NOT NULL,                   -- Unique identifier for the customer
    Name NVARCHAR(100) NOT NULL,               -- Customer's name
    Address NVARCHAR(255),                      -- Current address
    Start_Date DATE NOT NULL,                  -- Date when the customer started
    End_Date DATE,                             -- Date when the customer ended
    Is_Current BIT NOT NULL DEFAULT 1,        -- Indicates if the customer is currently active
    Old_Address NVARCHAR(255)                  -- Previous address
);