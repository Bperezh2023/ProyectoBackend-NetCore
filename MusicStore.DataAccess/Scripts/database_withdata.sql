USE [master]
GO
/****** Object:  Database [MusicStoreDatabase]    Script Date: 2/20/2023 9:57:17 PM ******/
CREATE DATABASE [MusicStoreDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicStoreDatabase', FILENAME = N'C:\Users\erick\MusicStoreDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MusicStoreDatabase_log', FILENAME = N'C:\Users\erick\MusicStoreDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MusicStoreDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicStoreDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicStoreDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MusicStoreDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicStoreDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicStoreDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MusicStoreDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicStoreDatabase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MusicStoreDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MusicStoreDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [MusicStoreDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicStoreDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicStoreDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicStoreDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MusicStoreDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MusicStoreDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MusicStoreDatabase] SET QUERY_STORE = OFF
GO
USE [MusicStoreDatabase]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/20/2023 9:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Concert]    Script Date: 2/20/2023 9:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concert](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GenreId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[DateEvent] [datetime2](7) NOT NULL,
	[ImageUrl] [varchar](1000) NULL,
	[Place] [nvarchar](100) NOT NULL,
	[TicketsQuantity] [int] NOT NULL,
	[UnitPrice] [decimal](11, 2) NOT NULL,
	[Finalized] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Concert] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/20/2023 9:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 2/20/2023 9:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 2/20/2023 9:57:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFk] [int] NOT NULL,
	[ConcertId] [int] NOT NULL,
	[SaleDate] [datetime2](7) NOT NULL,
	[OperationNumber] [varchar](20) NOT NULL,
	[Total] [decimal](11, 2) NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230207022436_InitialMigration', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230207025909_FixGenres', N'7.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230209010306_MoreTables', N'7.0.2')
GO
SET IDENTITY_INSERT [dbo].[Concert] ON 

INSERT [dbo].[Concert] ([Id], [GenreId], [Title], [Description], [DateEvent], [ImageUrl], [Place], [TicketsQuantity], [UnitPrice], [Finalized], [Status]) VALUES (1, 2, N'Adele', N'Concierto de Adele ganadora del Grammy', CAST(N'2023-02-28T22:00:00.0000000' AS DateTime2), N'https://mitocodestorage.blob.core.windows.net/musicproject/adele.jpg', N'Madison Square Garden', 10000, CAST(600.00 AS Decimal(11, 2)), 0, 1)
INSERT [dbo].[Concert] ([Id], [GenreId], [Title], [Description], [DateEvent], [ImageUrl], [Place], [TicketsQuantity], [UnitPrice], [Finalized], [Status]) VALUES (2, 1, N'AC/DC', N'El mejor grupo de Rock', CAST(N'2023-02-28T22:00:00.0000000' AS DateTime2), N'https://mitocodestorage.blob.core.windows.net/musicproject/acdc.jpg', N'Wimbledon', 5000, CAST(240.99 AS Decimal(11, 2)), 0, 1)
INSERT [dbo].[Concert] ([Id], [GenreId], [Title], [Description], [DateEvent], [ImageUrl], [Place], [TicketsQuantity], [UnitPrice], [Finalized], [Status]) VALUES (3, 3, N'The Piano guys', N'Concierto Instrumental a favor de los refugiados', CAST(N'2023-02-28T22:00:00.0000000' AS DateTime2), N'https://mitocodestorage.blob.core.windows.net/musicproject/ThePianoGuys.jpg', N'Wimbledon', 5000, CAST(240.99 AS Decimal(11, 2)), 0, 1)
INSERT [dbo].[Concert] ([Id], [GenreId], [Title], [Description], [DateEvent], [ImageUrl], [Place], [TicketsQuantity], [UnitPrice], [Finalized], [Status]) VALUES (4, 6, N'Blackpink', N'Blackpink en tu area', CAST(N'2023-03-20T20:30:00.0000000' AS DateTime2), N'https://mitocodestorage.blob.core.windows.net/musicproject/blackpink.jpg', N'Madison Square Garden', 10000, CAST(340.80 AS Decimal(11, 2)), 0, 1)
INSERT [dbo].[Concert] ([Id], [GenreId], [Title], [Description], [DateEvent], [ImageUrl], [Place], [TicketsQuantity], [UnitPrice], [Finalized], [Status]) VALUES (5, 1, N'Skillet', N'Musica Rock a todo volumen', CAST(N'2023-04-11T21:30:00.0000000' AS DateTime2), N'https://mitocodestorage.blob.core.windows.net/musicproject/skillet.jpg', N'Madison Square Garden', 9000, CAST(250.90 AS Decimal(11, 2)), 0, 1)
SET IDENTITY_INSERT [dbo].[Concert] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Email], [FullName], [Status]) VALUES (1, N'erickorlando@outlook.com', N'Test', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([Id], [Name], [Status]) VALUES (1, N'Rock', 1)
INSERT [dbo].[Genre] ([Id], [Name], [Status]) VALUES (2, N'Pop', 1)
INSERT [dbo].[Genre] ([Id], [Name], [Status]) VALUES (3, N'Jazz', 1)
INSERT [dbo].[Genre] ([Id], [Name], [Status]) VALUES (4, N'Metal', 1)
INSERT [dbo].[Genre] ([Id], [Name], [Status]) VALUES (5, N'Blues', 1)
INSERT [dbo].[Genre] ([Id], [Name], [Status]) VALUES (6, N'K-Pop', 1)
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([Id], [CustomerFk], [ConcertId], [SaleDate], [OperationNumber], [Total], [Quantity], [Status]) VALUES (1, 1, 1, CAST(N'2023-02-20T20:19:55.1864482' AS DateTime2), N'000001', CAST(6000.00 AS Decimal(11, 2)), 10, 1)
INSERT [dbo].[Sale] ([Id], [CustomerFk], [ConcertId], [SaleDate], [OperationNumber], [Total], [Quantity], [Status]) VALUES (2, 1, 2, CAST(N'2023-02-20T20:22:44.5190134' AS DateTime2), N'000002', CAST(481.98 AS Decimal(11, 2)), 2, 1)
INSERT [dbo].[Sale] ([Id], [CustomerFk], [ConcertId], [SaleDate], [OperationNumber], [Total], [Quantity], [Status]) VALUES (3, 1, 3, CAST(N'2023-02-20T20:26:30.4391153' AS DateTime2), N'000003', CAST(240.99 AS Decimal(11, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
/****** Object:  Index [IX_Concert_GenreId]    Script Date: 2/20/2023 9:57:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_Concert_GenreId] ON [dbo].[Concert]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sale_ConcertId]    Script Date: 2/20/2023 9:57:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_Sale_ConcertId] ON [dbo].[Sale]
(
	[ConcertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sale_CustomerFk]    Script Date: 2/20/2023 9:57:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_Sale_CustomerFk] ON [dbo].[Sale]
(
	[CustomerFk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Concert]  WITH CHECK ADD  CONSTRAINT [FK_Concert_Genre_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([Id])
GO
ALTER TABLE [dbo].[Concert] CHECK CONSTRAINT [FK_Concert_Genre_GenreId]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Concert_ConcertId] FOREIGN KEY([ConcertId])
REFERENCES [dbo].[Concert] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Concert_ConcertId]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Customer_CustomerFk] FOREIGN KEY([CustomerFk])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Customer_CustomerFk]
GO
USE [master]
GO
ALTER DATABASE [MusicStoreDatabase] SET  READ_WRITE 
GO
