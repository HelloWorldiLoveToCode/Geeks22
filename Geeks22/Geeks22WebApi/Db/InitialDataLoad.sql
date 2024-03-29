USE [GeeksBookstore]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [Biography], [Publisher]) VALUES (1, N'John', N'Green', NULL, N'MyBooksCo')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [Biography], [Publisher]) VALUES (2, N'Bugs', N'Bunny', NULL, N'DisneyBooks')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [Biography], [Publisher]) VALUES (3, N'Larry', N'David', NULL, N'CurbBooks')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [Biography], [Publisher]) VALUES (4, N'Mike', N'Jones', NULL, N'ABCPublishers')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [Biography], [Publisher]) VALUES (5, N'Steven', N'Richardson', NULL, N'DEFPublishers')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [Biography], [Publisher]) VALUES (6, N'Kevin', N'McCallister', NULL, N'YourBooksOrg')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName], [Biography], [Publisher]) VALUES (7, N'Ricky', N'Gervase', NULL, N'StackBooksCo')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([Id], [Name]) VALUES (1, N'Horror')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (2, N'Fantasy')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (3, N'Comedy')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (4, N'Romance')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (5, N'SciFi')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (3, 1, N'IT', 4, CAST(15.00 AS Decimal(5, 2)), N'978-3-16-148410-0', N'Scaries Book Ever', 2015, 100000)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (6, 2, N'The Sword and the Stone', 2, CAST(12.00 AS Decimal(5, 2)), N'978-3-16-145610-0', N'Great Kids Book', 1985, 250698)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1006, 1, N'Dracula', 6, CAST(20.25 AS Decimal(5, 2)), N'912-2-20-544322-1', N'Incredible Vampire Story', 1965, 5000000)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1008, 1, N'Frankenstein', 1, CAST(12.50 AS Decimal(5, 2)), N'982-54-33121-1', N'Scientific Horror Story', 2000, 10500)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1010, 2, N'Game Of Thrones', 3, CAST(30.99 AS Decimal(5, 2)), N'872-3-222193-9', N'Dragons and Fantasy Story', 2011, 20000000)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1011, 2, N'Lord of the Rings', 5, CAST(45.99 AS Decimal(5, 2)), N'102-1-33221-3', N'The Middle Earth Chronics', 1988, 25000000)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1013, 3, N'The World’s Worst Assistant', 7, CAST(17.50 AS Decimal(5, 2)), N'620-3-509811-2', N'Funniest book ever', 2022, 15170)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1014, 3, N'Jokes to Offend Men', 7, CAST(14.99 AS Decimal(5, 2)), N'810-7-223991-6', N'Dark Humor book', 2010, 3000000)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1018, 3, N'How to Be Perfect', 1, CAST(17.99 AS Decimal(5, 2)), N'501-8-120001-8', N'One of the smartest books', 2005, 50000)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1019, 4, N'Pride and Prejudice', 2, CAST(20.99 AS Decimal(5, 2)), N'311-6-294501-4', N'Arguably the greatest romance novel of all time', 1813, 25500000)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1020, 4, N'Morning Glory', 3, CAST(30.99 AS Decimal(5, 2)), N'410-2-309981-7', N'Love story that takes place in small town Whitney, Georgia on the eve of World War II', 1993, 195000)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1021, 4, N'A Hunger Like No Other', 5, CAST(25.99 AS Decimal(5, 2)), N'643-1-888311-2', N'Love and Vampires Story', 2006, 300500)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1023, 5, N'The Complete Robot', 6, CAST(16.00 AS Decimal(5, 2)), N'257-8-901120-5', N'37 short SciFi stories', 1966, 90000)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1025, 5, N'Brave New World', 1, CAST(49.99 AS Decimal(5, 2)), N'997-2-400001-2', N'Thrilling story about nonconformity and individuality', 2002, 9500000)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold]) VALUES (1026, 5, N'1984', 4, CAST(20.00 AS Decimal(5, 2)), N'10001-2-588881', N'In a world where concerns about privacy, government overreach, and freedom of information are more relevant than ever, 1984 continues to frighten and astound.', 1949, 10000000)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[CreditCard] ON 

INSERT [dbo].[CreditCard] ([Id], [Name], [Number], [Expiration], [CVV]) VALUES (1, N'Tom Smith', N'3788390715677487', N'0927', N'776')
INSERT [dbo].[CreditCard] ([Id], [Name], [Number], [Expiration], [CVV]) VALUES (4, N'Bugs Bunny', N'8262456733345534', N'0534', N'671')
INSERT [dbo].[CreditCard] ([Id], [Name], [Number], [Expiration], [CVV]) VALUES (6, N'Inspector Gadge', N'4745390876254345', N'0935', N'569')
INSERT [dbo].[CreditCard] ([Id], [Name], [Number], [Expiration], [CVV]) VALUES (8, N'Tom Brokaw', N'579045678923', N'0278', N'456')
SET IDENTITY_INSERT [dbo].[CreditCard] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [StreetAddress], [City], [State], [Zipcode], [CreditCardId], [IsAdmin]) VALUES (1, N'mjones', N'blabla', N'Mike', N'Jones', N'mjones@donotreply.org', N'1 S Aave', N'Miami', N'FL', N'33301', 1, 0)
INSERT [dbo].[User] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [StreetAddress], [City], [State], [Zipcode], [CreditCardId], [IsAdmin]) VALUES (2, N'psmith', N'sdfoidfasl', N'Paul', N'Smith', N'spmith@notanemail.com', N'76 NW 10th Ave', N'Coral Spring', N'FL', N'33075', 4, 0)
INSERT [dbo].[User] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [StreetAddress], [City], [State], [Zipcode], [CreditCardId], [IsAdmin]) VALUES (5, N'jdoe', N'dfjgfd9888', N'John', N'Doe', N'jdoe@notanemailreally.org', N'45 SW 10th St', N'New York', N'NY', N'11757', 6, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCart] ON 

INSERT [dbo].[ShoppingCart] ([Id], [UserId], [BookId]) VALUES (1, 5, 3)
INSERT [dbo].[ShoppingCart] ([Id], [UserId], [BookId]) VALUES (2, 5, 1018)
INSERT [dbo].[ShoppingCart] ([Id], [UserId], [BookId]) VALUES (3, 5, 1021)
INSERT [dbo].[ShoppingCart] ([Id], [UserId], [BookId]) VALUES (4, 1, 1025)
INSERT [dbo].[ShoppingCart] ([Id], [UserId], [BookId]) VALUES (5, 1, 1026)
SET IDENTITY_INSERT [dbo].[ShoppingCart] OFF
GO
