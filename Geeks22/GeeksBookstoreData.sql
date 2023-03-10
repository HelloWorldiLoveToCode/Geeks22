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
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
