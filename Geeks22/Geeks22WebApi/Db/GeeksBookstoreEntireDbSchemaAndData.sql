USE [master]
GO
/****** Object:  Database [GeeksBookstore]    Script Date: 3/16/2023 9:26:38 PM ******/
CREATE DATABASE [GeeksBookstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GeeksBookstore', FILENAME = N'C:\Users\Chris\GeeksBookstore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GeeksBookstore_log', FILENAME = N'C:\Users\Chris\GeeksBookstore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GeeksBookstore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GeeksBookstore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GeeksBookstore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GeeksBookstore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GeeksBookstore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GeeksBookstore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GeeksBookstore] SET ARITHABORT OFF 
GO
ALTER DATABASE [GeeksBookstore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GeeksBookstore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GeeksBookstore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GeeksBookstore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GeeksBookstore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GeeksBookstore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GeeksBookstore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GeeksBookstore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GeeksBookstore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GeeksBookstore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GeeksBookstore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GeeksBookstore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GeeksBookstore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GeeksBookstore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GeeksBookstore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GeeksBookstore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GeeksBookstore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GeeksBookstore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GeeksBookstore] SET  MULTI_USER 
GO
ALTER DATABASE [GeeksBookstore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GeeksBookstore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GeeksBookstore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GeeksBookstore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GeeksBookstore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GeeksBookstore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GeeksBookstore] SET QUERY_STORE = OFF
GO
USE [GeeksBookstore]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 3/16/2023 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Biography] [varchar](max) NULL,
	[Publisher] [varchar](48) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/16/2023 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GenreId] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Price] [decimal](5, 2) NOT NULL,
	[ISBN] [varchar](48) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Year] [int] NOT NULL,
	[CopiesSold] [int] NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCard]    Script Date: 3/16/2023 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Number] [varchar](16) NOT NULL,
	[Expiration] [varchar](5) NOT NULL,
	[CVV] [varchar](3) NOT NULL,
 CONSTRAINT [PK_CreditCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 3/16/2023 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](96) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 3/16/2023 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/16/2023 9:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](48) NOT NULL,
	[Password] [varchar](48) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Email] [varchar](50) NULL,
	[StreetAddress] [varchar](max) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zipcode] [varchar](5) NULL,
	[CreditCardId] [int] NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (3, 1, N'IT', 4, CAST(15.00 AS Decimal(5, 2)), N'978-3-16-148410-0', N'Scaries Book Ever', 2015, 100000, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (6, 2, N'The Sword and the Stone', 2, CAST(12.00 AS Decimal(5, 2)), N'978-3-16-145610-0', N'Great Kids Book', 1985, 250698, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1006, 1, N'Dracula', 6, CAST(20.25 AS Decimal(5, 2)), N'912-2-20-544322-1', N'Incredible Vampire Story', 1965, 5000000, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1008, 1, N'Frankenstein', 1, CAST(12.50 AS Decimal(5, 2)), N'982-54-33121-1', N'Scientific Horror Story', 2000, 10500, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1010, 2, N'Game Of Thrones', 3, CAST(30.99 AS Decimal(5, 2)), N'872-3-222193-9', N'Dragons and Fantasy Story', 2011, 20000000, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1011, 2, N'Lord of the Rings', 5, CAST(45.99 AS Decimal(5, 2)), N'102-1-33221-3', N'The Middle Earth Chronics', 1988, 25000000, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1013, 3, N'The World’s Worst Assistant', 7, CAST(17.50 AS Decimal(5, 2)), N'620-3-509811-2', N'Funniest book ever', 2022, 15170, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1014, 3, N'Jokes to Offend Men', 7, CAST(14.99 AS Decimal(5, 2)), N'810-7-223991-6', N'Dark Humor book', 2010, 3000000, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1018, 3, N'How to Be Perfect', 1, CAST(17.99 AS Decimal(5, 2)), N'501-8-120001-8', N'One of the smartest books', 2005, 50000, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1019, 4, N'Pride and Prejudice', 2, CAST(20.99 AS Decimal(5, 2)), N'311-6-294501-4', N'Arguably the greatest romance novel of all time', 1813, 25500000, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1020, 4, N'Morning Glory', 3, CAST(30.99 AS Decimal(5, 2)), N'410-2-309981-7', N'Love story that takes place in small town Whitney, Georgia on the eve of World War II', 1993, 195000, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1021, 4, N'A Hunger Like No Other', 5, CAST(25.99 AS Decimal(5, 2)), N'643-1-888311-2', N'Love and Vampires Story', 2006, 300500, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1023, 5, N'The Complete Robot', 6, CAST(16.00 AS Decimal(5, 2)), N'257-8-901120-5', N'37 short SciFi stories', 1966, 90000, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1025, 5, N'Brave New World', 1, CAST(49.99 AS Decimal(5, 2)), N'997-2-400001-2', N'Thrilling story about nonconformity and individuality', 2002, 9500000, 1)
INSERT [dbo].[Book] ([Id], [GenreId], [Title], [AuthorId], [Price], [ISBN], [Description], [Year], [CopiesSold], [Rating]) VALUES (1026, 5, N'1984', 4, CAST(20.00 AS Decimal(5, 2)), N'10001-2-588881', N'In a world where concerns about privacy, government overreach, and freedom of information are more relevant than ever, 1984 continues to frighten and astound.', 1949, 10000000, 1)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[CreditCard] ON 

INSERT [dbo].[CreditCard] ([Id], [Name], [Number], [Expiration], [CVV]) VALUES (1, N'Tom Smith', N'3788390715677487', N'0927', N'776')
INSERT [dbo].[CreditCard] ([Id], [Name], [Number], [Expiration], [CVV]) VALUES (4, N'Bugs Bunny', N'8262456733345534', N'0534', N'671')
INSERT [dbo].[CreditCard] ([Id], [Name], [Number], [Expiration], [CVV]) VALUES (6, N'Inspector Gadge', N'4745390876254345', N'0935', N'569')
INSERT [dbo].[CreditCard] ([Id], [Name], [Number], [Expiration], [CVV]) VALUES (8, N'Tom Brokaw', N'579045678923', N'0278', N'456')
SET IDENTITY_INSERT [dbo].[CreditCard] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([Id], [Name]) VALUES (1, N'Horror')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (2, N'Fantasy')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (3, N'Comedy')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (4, N'Romance')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (5, N'SciFi')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCart] ON 

INSERT [dbo].[ShoppingCart] ([Id], [UserId], [BookId]) VALUES (1, 5, 3)
INSERT [dbo].[ShoppingCart] ([Id], [UserId], [BookId]) VALUES (2, 5, 1018)
INSERT [dbo].[ShoppingCart] ([Id], [UserId], [BookId]) VALUES (3, 5, 1021)
INSERT [dbo].[ShoppingCart] ([Id], [UserId], [BookId]) VALUES (4, 1, 1025)
INSERT [dbo].[ShoppingCart] ([Id], [UserId], [BookId]) VALUES (5, 1, 1026)
SET IDENTITY_INSERT [dbo].[ShoppingCart] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [StreetAddress], [City], [State], [Zipcode], [CreditCardId], [IsAdmin]) VALUES (1, N'mjones', N'blabla', N'Mike', N'Jones', N'mjones@donotreply.org', N'1 S Aave', N'Miami', N'FL', N'33301', 1, 0)
INSERT [dbo].[User] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [StreetAddress], [City], [State], [Zipcode], [CreditCardId], [IsAdmin]) VALUES (2, N'psmith', N'sdfoidfasl', N'Paul', N'Smith', N'spmith@notanemail.com', N'76 NW 10th Ave', N'Coral Spring', N'FL', N'33075', 4, 0)
INSERT [dbo].[User] ([Id], [Username], [Password], [FirstName], [LastName], [Email], [StreetAddress], [City], [State], [Zipcode], [CreditCardId], [IsAdmin]) VALUES (5, N'jdoe', N'dfjgfd9888', N'John', N'Doe', N'jdoe@notanemailreally.org', N'45 SW 10th St', N'New York', N'NY', N'11757', 6, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Genre]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Book]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_CreditCard] FOREIGN KEY([CreditCardId])
REFERENCES [dbo].[CreditCard] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_CreditCard]
GO
USE [master]
GO
ALTER DATABASE [GeeksBookstore] SET  READ_WRITE 
GO
