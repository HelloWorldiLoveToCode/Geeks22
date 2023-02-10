USE [master]
GO
/****** Object:  Database [GeeksBookstore]    Script Date: 2/9/2023 9:03:02 PM ******/
CREATE DATABASE [GeeksBookstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GeeksBookstore', FILENAME = N'C:\Users\USERNAME\GeeksBookstore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GeeksBookstore_log', FILENAME = N'C:\Users\USERNAME\GeeksBookstore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Author]    Script Date: 2/9/2023 9:03:02 PM ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 2/9/2023 9:03:03 PM ******/
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
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCard]    Script Date: 2/9/2023 9:03:03 PM ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 2/9/2023 9:03:03 PM ******/
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
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 2/9/2023 9:03:03 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/9/2023 9:03:03 PM ******/
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
	[UserType] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
