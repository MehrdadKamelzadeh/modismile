USE [master]
GO
/****** Object:  Database [Smile]    Script Date: 1/22/2018 2:20:57 PM ******/
CREATE DATABASE [Smile]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Smile', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Smile.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Smile_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Smile_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Smile] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Smile].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Smile] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Smile] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Smile] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Smile] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Smile] SET ARITHABORT OFF 
GO
ALTER DATABASE [Smile] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Smile] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Smile] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Smile] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Smile] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Smile] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Smile] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Smile] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Smile] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Smile] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Smile] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Smile] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Smile] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Smile] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Smile] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Smile] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Smile] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Smile] SET RECOVERY FULL 
GO
ALTER DATABASE [Smile] SET  MULTI_USER 
GO
ALTER DATABASE [Smile] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Smile] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Smile] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Smile] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Smile] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Smile', N'ON'
GO
USE [Smile]
GO
/****** Object:  User [smile]    Script Date: 1/22/2018 2:20:57 PM ******/
CREATE USER [smile] FOR LOGIN [smile] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [smile]
GO
/****** Object:  Table [dbo].[Aggregates]    Script Date: 1/22/2018 2:20:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aggregates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL CONSTRAINT [DF_Aggregates_Description]  DEFAULT (''),
	[Version] [int] NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL CONSTRAINT [DF_Aggregates_Rate]  DEFAULT ((1)),
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[ExpiresDaysAfter] [int] NULL,
	[Priority] [int] NOT NULL CONSTRAINT [DF_Aggregates_Priority]  DEFAULT ((0)),
 CONSTRAINT [PK_Aggregates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Events]    Script Date: 1/22/2018 2:20:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AggregateId] [int] NOT NULL,
	[AggregateType] [nvarchar](100) NULL,
	[Value] [bigint] NULL,
	[EventDetails] [nvarchar](max) NULL,
	[UserId] [nvarchar](50) NULL,
	[ClientId] [nvarchar](50) NULL,
	[AddDate] [datetime] NOT NULL CONSTRAINT [DF_Events_AddDate]  DEFAULT (getdate()),
 CONSTRAINT [PKEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Aggregates] ON 

INSERT [dbo].[Aggregates] ([Id], [Title], [Description], [Version], [Rate], [FromDate], [ToDate], [ExpiresDaysAfter], [Priority]) VALUES (1, N'Login', N'', 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'1900-01-02 00:00:00.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Aggregates] ([Id], [Title], [Description], [Version], [Rate], [FromDate], [ToDate], [ExpiresDaysAfter], [Priority]) VALUES (2, N'Buy', N'', 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'1900-01-03 00:00:00.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Aggregates] ([Id], [Title], [Description], [Version], [Rate], [FromDate], [ToDate], [ExpiresDaysAfter], [Priority]) VALUES (3, N'ViewPage', N'', 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'1900-01-02 00:00:00.000' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Aggregates] OFF
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (1, 2, N'dftrh', 100, NULL, N'benyblack@gmail.com', N'sssss', CAST(N'2018-09-11 00:00:00.000' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (2, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:30.857' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (3, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:48.233' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (4, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:48.713' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (5, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:49.187' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (6, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:49.400' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (7, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:49.610' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (8, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:49.803' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (9, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:49.957' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (10, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:50.123' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (11, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:50.283' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (12, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:50.450' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (13, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:50.633' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (14, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:50.777' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (15, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:50.970' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (16, 3, N'', 12, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:51.127' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (17, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:51.290' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (18, 3, N'', 1, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-25 09:02:51.443' AS DateTime))
INSERT [dbo].[Events] ([Id], [AggregateId], [AggregateType], [Value], [EventDetails], [UserId], [ClientId], [AddDate]) VALUES (19, 3, NULL, 0, NULL, N'benyblack@gmail.com', NULL, CAST(N'2017-12-26 12:15:32.037' AS DateTime))
SET IDENTITY_INSERT [dbo].[Events] OFF
USE [master]
GO
ALTER DATABASE [Smile] SET  READ_WRITE 
GO
