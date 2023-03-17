USE GeeksBookstore
GO

ALTER TABLE Book
ADD Rating int;
GO

UPDATE Book SET Rating = 1
GO

ALTER TABLE Book
ALTER COLUMN Rating int NOT NULL;
