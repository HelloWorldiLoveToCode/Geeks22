USE GeeksBookstore
GO

ALTER TABLE ShoppingCart
ADD CreatedOn datetime;
GO

UPDATE ShoppingCart SET CreatedOn = GETDATE()
GO

ALTER TABLE ShoppingCart
ALTER COLUMN CreatedOn datetime NOT NULL;
