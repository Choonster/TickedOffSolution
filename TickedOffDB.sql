USE [master]
GO
/****** Object:  Database [TickedOffDB]    Script Date: 7/12/2013 3:21:10 AM ******/
CREATE DATABASE [TickedOffDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TickedOffDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TickedOffDB.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TickedOffDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TickedOffDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TickedOffDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TickedOffDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TickedOffDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TickedOffDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TickedOffDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TickedOffDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TickedOffDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TickedOffDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TickedOffDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TickedOffDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TickedOffDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TickedOffDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TickedOffDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TickedOffDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TickedOffDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TickedOffDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TickedOffDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TickedOffDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TickedOffDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TickedOffDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TickedOffDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TickedOffDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TickedOffDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TickedOffDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TickedOffDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TickedOffDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TickedOffDB] SET  MULTI_USER 
GO
ALTER DATABASE [TickedOffDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TickedOffDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TickedOffDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TickedOffDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TickedOffDB', N'ON'
GO
USE [TickedOffDB]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 7/12/2013 3:21:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] NOT NULL,
	[PetID] [int] NULL,
	[StaffID] [int] NULL,
	[BookingDateTime] [datetime] NULL,
	[Symptoms] [text] NULL,
	[Treatments] [text] NULL,
	[Notes] [text] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/12/2013 3:21:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
	[Title] [nvarchar](10) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [nvarchar](1) NULL,
	[DOB] [date] NULL,
	[Email] [nvarchar](100) NULL,
	[Phone1] [nvarchar](20) NULL,
	[Phone2] [nvarchar](20) NULL,
	[Street1] [nvarchar](150) NULL,
	[Street2] [nvarchar](150) NULL,
	[Suburb] [nvarchar](80) NULL,
	[State] [nvarchar](3) NULL,
	[Postcode] [nvarchar](4) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 7/12/2013 3:21:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
	[ItemDescription] [nvarchar](250) NOT NULL,
	[NumberOnHand] [int] NOT NULL,
	[NumberOnOrder] [int] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pet]    Script Date: 7/12/2013 3:21:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet](
	[PetID] [int] NOT NULL,
	[PetName] [nvarchar](80) NULL,
	[Species] [nvarchar](50) NULL,
	[Breed] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[Gender] [nvarchar](1) NULL,
	[Weight] [float] NULL,
	[CustomerID] [int] NULL,
 CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED 
(
	[PetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 7/12/2013 3:21:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] NOT NULL,
	[Title] [nvarchar](10) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [nvarchar](1) NULL,
	[DOB] [date] NULL,
	[Email] [nvarchar](100) NULL,
	[Phone1] [nvarchar](20) NULL,
	[Phone2] [nvarchar](20) NULL,
	[Street1] [nvarchar](150) NULL,
	[Street2] [nvarchar](150) NULL,
	[Suburb] [nvarchar](80) NULL,
	[State] [nvarchar](3) NULL,
	[Postcode] [nvarchar](4) NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 7/12/2013 3:21:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[State] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stay]    Script Date: 7/12/2013 3:21:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stay](
	[StayID] [int] NOT NULL,
	[StayStartDate] [date] NULL,
	[StayEndDate] [date] NULL,
	[PetID] [int] NULL,
	[StayCost] [money] NULL,
 CONSTRAINT [PK_Stay] PRIMARY KEY CLUSTERED 
(
	[StayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (1, 84, 5, CAST(0x0000A0DB00DE7920 AS DateTime), N'hair loss', N'give a "good boy"', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (2, 84, 2, CAST(0x00009EB201038D50 AS DateTime), N'excessive tiredness', N'meditation', N'See again in 2 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (3, 97, 5, CAST(0x00009EBA00CDFE60 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (4, 34, 5, CAST(0x00009EDE00C5C100 AS DateTime), N'fleas', N'drugs', N'See again in 6 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (5, 49, 5, CAST(0x0000A0E700F73140 AS DateTime), N'excessive thirstiness', N'hydrotherapy', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (6, 80, 2, CAST(0x00009ECD00F31290 AS DateTime), N'uncontrollable peeing', N'hydrotherapy', N'See again in 6 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (7, 61, 3, CAST(0x0000A04D00C9DFB0 AS DateTime), N'', N'Routine vaccination', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (8, 75, 2, CAST(0x0000A08300A8EA30 AS DateTime), N'limping', N'meditation', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (9, 88, 2, CAST(0x0000A0500107AC00 AS DateTime), N'diarrhoea', N'give a "good boy"', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (10, 21, 3, CAST(0x00009ECC00986F70 AS DateTime), N'', N'Routine vaccination', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (11, 54, 3, CAST(0x00009FA900DE7920 AS DateTime), N'vomiting', N'acupuncture', N'See again in 2 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (12, 89, 3, CAST(0x00009FBB00C1A250 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (13, 82, 2, CAST(0x00009EF900C9DFB0 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (14, 48, 3, CAST(0x0000A0F4009C8E20 AS DateTime), N'poor eyesight, inappropriate defecation', N'bandage application', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (15, 81, 3, CAST(0x00009FEC00CDFE60 AS DateTime), N'deafness', N'hypnotherapy', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (16, 51, 5, CAST(0x0000A0B900D63BC0 AS DateTime), N'poor eyesight', N'medicinal bath', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (17, 95, 3, CAST(0x00009EDE00C9DFB0 AS DateTime), N'limping', N'tooth clean', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (18, 56, 5, CAST(0x0000A01400986F70 AS DateTime), N'excessive tiredness', N'electric shock therapy', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (19, 85, 3, CAST(0x0000A0180107AC00 AS DateTime), N'', N'Routine vaccination', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (20, 57, 3, CAST(0x0000A08E00D63BC0 AS DateTime), N'anxiety', N'non-invasive surgery', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (21, 25, 2, CAST(0x00009E6A00B964F0 AS DateTime), N'', N'Routine vaccination', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (22, 85, 5, CAST(0x0000A05201038D50 AS DateTime), N'constipation, deafness', N'tooth clean', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (23, 72, 3, CAST(0x00009F7D00BD83A0 AS DateTime), N'', N'Routine vaccination', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (24, 95, 5, CAST(0x0000A03A010FE960 AS DateTime), N'bottom scraping, deafness', N'massage', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (25, 28, 5, CAST(0x0000A05000D63BC0 AS DateTime), N'', N'Routine vaccination', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (26, 49, 2, CAST(0x00009F43009C8E20 AS DateTime), N'hair loss', N'a good corking', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (27, 102, 5, CAST(0x0000A043011826C0 AS DateTime), N'other parasites', N'suture', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (28, 110, 2, CAST(0x0000A12400E6B680 AS DateTime), N'other parasites', N'electric shock therapy', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (29, 9, 3, CAST(0x00009F0300CDFE60 AS DateTime), N'wheezing', N'stitches', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (30, 70, 3, CAST(0x0000A07300D21D10 AS DateTime), N'', N'Routine vaccination', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (31, 98, 5, CAST(0x0000A0F9009450C0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (32, 58, 5, CAST(0x00009FA8009C8E20 AS DateTime), N'', N'Routine vaccination', N'See again in 2 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (33, 92, 5, CAST(0x00009E8E00C5C100 AS DateTime), N'obesity', N'hydrotherapy', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (34, 26, 3, CAST(0x0000A04500DE7920 AS DateTime), N'poor eyesight, joint stiffness', N'wallet massage', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (35, 86, 2, CAST(0x00009FC300986F70 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (36, 92, 5, CAST(0x0000A13300F31290 AS DateTime), N'sneezing', N'tooth clean', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (37, 73, 3, CAST(0x0000A038009C8E20 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (38, 85, 5, CAST(0x00009FB300EEF3E0 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (39, 106, 5, CAST(0x00009EB3011826C0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (40, 107, 5, CAST(0x0000A0F300A8EA30 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (41, 88, 3, CAST(0x0000A14D00E6B680 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (42, 77, 2, CAST(0x0000A03C00A8EA30 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (43, 105, 5, CAST(0x0000A0AA009450C0 AS DateTime), N'sneezing', N'meditation', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (44, 98, 3, CAST(0x00009F0700B964F0 AS DateTime), N'vomiting', N'give a "good boy"', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (45, 106, 5, CAST(0x0000A09700DE7920 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (46, 51, 3, CAST(0x00009EFB00B964F0 AS DateTime), N'poor eyesight', N'hypnotherapy', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (47, 106, 3, CAST(0x00009F9300A4CB80 AS DateTime), N'', N'Routine vaccination', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (48, 52, 3, CAST(0x00009FC300E6B680 AS DateTime), N'', N'Routine vaccination', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (49, 101, 2, CAST(0x00009F6501038D50 AS DateTime), N'poor eyesight, other parasites', N'invasive surgery', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (50, 41, 2, CAST(0x0000A08100D63BC0 AS DateTime), N'obesity, constipation, fleas', N'medicinal bath', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (51, 60, 2, CAST(0x0000A0C10107AC00 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (52, 88, 3, CAST(0x00009F1200986F70 AS DateTime), N'', N'Routine vaccination', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (53, 14, 3, CAST(0x0000A0B800D21D10 AS DateTime), N'limping, inappropriate defecation', N'invasive surgery', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (54, 15, 5, CAST(0x00009FA600EEF3E0 AS DateTime), N'vomiting, crying', N'invasive surgery', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (55, 86, 5, CAST(0x0000A0A000CDFE60 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (56, 19, 5, CAST(0x00009FD600AD08E0 AS DateTime), N'', N'Routine vaccination', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (57, 2, 2, CAST(0x00009EB900EAD530 AS DateTime), N'sore paw', N'give a "good boy"', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (58, 69, 2, CAST(0x00009FBD00F31290 AS DateTime), N'diarrhoea', N'emetic procedure', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (59, 77, 2, CAST(0x00009E8E010FE960 AS DateTime), N'', N'Routine vaccination', N'See again in 6 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (60, 23, 2, CAST(0x0000A02A00D63BC0 AS DateTime), N'', N'Routine vaccination', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (61, 53, 3, CAST(0x00009E6300EAD530 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (62, 77, 3, CAST(0x0000A04F00BD83A0 AS DateTime), N'anxiety', N'tooth extraction', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (63, 58, 5, CAST(0x00009FFD009C8E20 AS DateTime), N'excessive thirstiness, constipation', N'suture', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (64, 3, 3, CAST(0x0000A13700B12790 AS DateTime), N'flatulence', N'electric shock therapy', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (65, 32, 2, CAST(0x0000A02E011826C0 AS DateTime), N'obesity', N'cuddles', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (66, 43, 2, CAST(0x0000A11900DA5A70 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (67, 16, 2, CAST(0x00009F5300C5C100 AS DateTime), N'limping', N'cuddles', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (68, 73, 5, CAST(0x00009ED000D63BC0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (69, 104, 3, CAST(0x0000A0FA00AD08E0 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (70, 72, 5, CAST(0x0000A10B00D63BC0 AS DateTime), N'crying', N'meditation', N'See again in 6 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (71, 81, 5, CAST(0x0000A07C00D63BC0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (72, 7, 2, CAST(0x0000A07C00D63BC0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (73, 75, 5, CAST(0x0000A11800A8EA30 AS DateTime), N'', N'Routine vaccination', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (74, 68, 2, CAST(0x00009EF100D21D10 AS DateTime), N'', N'Routine vaccination', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (75, 78, 3, CAST(0x0000A00900C1A250 AS DateTime), N'joint stiffness', N'cuddles', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (76, 1, 5, CAST(0x0000A0DD00BD83A0 AS DateTime), N'crying', N'a good corking', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (77, 7, 5, CAST(0x00009EFD00DE7920 AS DateTime), N'', N'Routine vaccination', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (78, 13, 2, CAST(0x00009F5200EAD530 AS DateTime), N'diarrhoea, anxiety', N'give a "good boy"', N'See again in 2 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (79, 110, 5, CAST(0x00009F4D010BCAB0 AS DateTime), N'limping', N'psychotherapy', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (80, 60, 5, CAST(0x0000A0B200A4CB80 AS DateTime), N'', N'Routine vaccination', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (81, 2, 3, CAST(0x0000A05F009C8E20 AS DateTime), N'', N'Routine vaccination', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (82, 105, 3, CAST(0x00009F4A00FB4FF0 AS DateTime), N'', N'Routine vaccination', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (83, 38, 2, CAST(0x00009E7900EEF3E0 AS DateTime), N'sore paw', N'saw pore', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (84, 58, 2, CAST(0x00009FE600F31290 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (85, 104, 3, CAST(0x0000A0C900D21D10 AS DateTime), N'', N'Routine vaccination', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (86, 49, 3, CAST(0x0000A00E01140810 AS DateTime), N'', N'Routine vaccination', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (87, 41, 2, CAST(0x0000A09700EEF3E0 AS DateTime), N'obesity, inappropriate defecation', N'suture', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (88, 107, 3, CAST(0x00009FE800EEF3E0 AS DateTime), N'sneezing', N'massage', N'See again in 6 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (89, 52, 5, CAST(0x00009FEA00A0ACD0 AS DateTime), N'hair loss, ticks', N'emetic procedure', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (90, 24, 2, CAST(0x00009F0D00BD83A0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (91, 78, 3, CAST(0x0000A06101038D50 AS DateTime), N'other parasites', N'electric shock therapy', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (92, 33, 3, CAST(0x0000A05E00C1A250 AS DateTime), N'sore paw, crying', N'acupuncture', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (93, 55, 3, CAST(0x00009F83010FE960 AS DateTime), N'obesity', N'massage', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (94, 97, 3, CAST(0x0000A0DB00D21D10 AS DateTime), N'anxiety', N'tooth extraction', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (95, 17, 2, CAST(0x0000A0C70107AC00 AS DateTime), N'constipation, flatulence', N'tooth extraction', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (96, 14, 5, CAST(0x00009FA300C9DFB0 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (97, 87, 2, CAST(0x00009FBF011826C0 AS DateTime), N'limping', N'suture', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (98, 107, 3, CAST(0x00009EA700C5C100 AS DateTime), N'deafness', N'tooth extraction', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (99, 83, 5, CAST(0x00009ED500C5C100 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (100, 21, 3, CAST(0x0000A05300EAD530 AS DateTime), N'', N'Routine vaccination', N'')
GO
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (101, 98, 5, CAST(0x0000A00900BD83A0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (102, 52, 5, CAST(0x00009F16011826C0 AS DateTime), N'crying', N'non-invasive surgery', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (103, 26, 5, CAST(0x0000A05B01140810 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (104, 89, 3, CAST(0x0000A1480107AC00 AS DateTime), N'', N'Routine vaccination', N'See again in 6 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (105, 60, 2, CAST(0x00009FAA00D21D10 AS DateTime), N'fleas', N'suture', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (106, 91, 2, CAST(0x00009F4600A8EA30 AS DateTime), N'', N'Routine vaccination', N'See again in 6 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (107, 39, 2, CAST(0x0000A0E100D21D10 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (108, 26, 5, CAST(0x00009EBF00D21D10 AS DateTime), N'vomiting, other parasites', N'bandage application', N'See again in 6 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (109, 73, 3, CAST(0x00009E6D00FB4FF0 AS DateTime), N'other parasites', N'psychotherapy', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (110, 30, 2, CAST(0x0000A0A8009C8E20 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (111, 108, 3, CAST(0x00009F62011826C0 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (112, 105, 2, CAST(0x00009EEB009C8E20 AS DateTime), N'', N'Routine vaccination', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (113, 13, 3, CAST(0x0000A1230107AC00 AS DateTime), N'', N'Routine vaccination', N'See again in 2 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (114, 29, 5, CAST(0x00009F2E00B964F0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (115, 17, 5, CAST(0x00009F01009450C0 AS DateTime), N'', N'Routine vaccination', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (116, 23, 2, CAST(0x00009FE700B54640 AS DateTime), N'anxiety', N'invasive surgery', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (117, 91, 5, CAST(0x0000A07B00DE7920 AS DateTime), N'joint stiffness', N'tooth clean', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (118, 110, 2, CAST(0x00009FF400D63BC0 AS DateTime), N'constipation', N'stitches', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (119, 48, 2, CAST(0x0000A03300B12790 AS DateTime), N'hair loss', N'tooth clean', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (120, 28, 3, CAST(0x00009E8800C9DFB0 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (121, 56, 2, CAST(0x00009F9900F73140 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (122, 65, 3, CAST(0x0000A0BD00FF6EA0 AS DateTime), N'', N'Routine vaccination', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (123, 103, 2, CAST(0x00009F5100BD83A0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (124, 65, 5, CAST(0x00009EC100A0ACD0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (125, 61, 5, CAST(0x0000A08300FF6EA0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (126, 62, 3, CAST(0x00009F2400A8EA30 AS DateTime), N'excessive thirstiness', N'stitches', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (127, 36, 2, CAST(0x00009E9200E6B680 AS DateTime), N'sore paw, sneezing', N'invasive surgery', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (128, 41, 2, CAST(0x0000A00901038D50 AS DateTime), N'constipation', N'electric shock therapy', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (129, 9, 3, CAST(0x0000A15000B964F0 AS DateTime), N'fleas', N'psychotherapy', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (130, 107, 2, CAST(0x00009E9000B54640 AS DateTime), N'', N'Routine vaccination', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (131, 8, 2, CAST(0x00009F3501140810 AS DateTime), N'joint stiffness', N'non-invasive surgery', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (132, 3, 3, CAST(0x00009FC200AD08E0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (133, 69, 3, CAST(0x0000A03300CDFE60 AS DateTime), N'', N'Routine vaccination', N'See again in 2 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (134, 94, 3, CAST(0x0000A0E800E297D0 AS DateTime), N'', N'Routine vaccination', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (135, 26, 3, CAST(0x00009F8600986F70 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (136, 19, 2, CAST(0x0000A0BC00BD83A0 AS DateTime), N'joint stiffness', N'give a "good boy"', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (137, 39, 3, CAST(0x0000A0AD00A0ACD0 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (138, 86, 5, CAST(0x0000A04000F31290 AS DateTime), N'', N'Routine vaccination', N'See again in 6 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (139, 53, 3, CAST(0x00009F4D00CDFE60 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (140, 47, 3, CAST(0x0000A0F0010BCAB0 AS DateTime), N'excessive thirstiness', N'acupuncture', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (141, 47, 2, CAST(0x0000A0BE00D21D10 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (142, 67, 5, CAST(0x00009F8300F31290 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (143, 61, 5, CAST(0x0000A00600D21D10 AS DateTime), N'inappropriate defecation', N'a good corking', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (144, 28, 2, CAST(0x0000A02300B964F0 AS DateTime), N'fleas', N'acupuncture', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (145, 2, 3, CAST(0x0000A03800F73140 AS DateTime), N'excessive tiredness', N'hydrotherapy', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (146, 81, 2, CAST(0x00009F50010BCAB0 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (147, 26, 5, CAST(0x0000A14800C1A250 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (148, 58, 2, CAST(0x0000A047009450C0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (149, 69, 5, CAST(0x00009EF000C5C100 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (150, 25, 3, CAST(0x00009FE900EAD530 AS DateTime), N'anxiety, sneezing', N'wallet massage', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (151, 35, 3, CAST(0x0000A05400986F70 AS DateTime), N'other parasites', N'hydrotherapy', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (152, 67, 5, CAST(0x00009EB700EAD530 AS DateTime), N'wheezing, fleas', N'hydrotherapy', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (153, 94, 3, CAST(0x0000A10D010FE960 AS DateTime), N'deafness', N'a good corking', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (154, 10, 3, CAST(0x0000A06900F73140 AS DateTime), N'excessive thirstiness, fleas', N'non-invasive surgery', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (155, 41, 5, CAST(0x0000A15500DA5A70 AS DateTime), N'sneezing', N'bandage application', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (156, 67, 2, CAST(0x00009FB900EAD530 AS DateTime), N'bottom scraping', N'medicinal bath', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (157, 6, 2, CAST(0x00009F8A00A4CB80 AS DateTime), N'', N'Routine vaccination', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (158, 53, 5, CAST(0x0000A10C00986F70 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (159, 16, 2, CAST(0x0000A05500E297D0 AS DateTime), N'anxiety', N'enema', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (160, 58, 3, CAST(0x0000A140009C8E20 AS DateTime), N'bottom scraping', N'meditation', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (161, 15, 5, CAST(0x0000A11900D63BC0 AS DateTime), N'', N'Routine vaccination', N'See again in 6 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (162, 70, 3, CAST(0x0000A02D00FB4FF0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (163, 89, 5, CAST(0x0000A03F00FF6EA0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (164, 12, 3, CAST(0x0000A13500E297D0 AS DateTime), N'sneezing', N'cuddles', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (165, 10, 2, CAST(0x0000A05A00C1A250 AS DateTime), N'', N'Routine vaccination', N'See again in 6 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (166, 110, 3, CAST(0x00009F5800D63BC0 AS DateTime), N'diarrhoea', N'non-invasive surgery', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (167, 85, 2, CAST(0x0000A04900986F70 AS DateTime), N'poor eyesight', N'hypnotherapy', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (168, 70, 2, CAST(0x0000A09701140810 AS DateTime), N'', N'Routine vaccination', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (169, 83, 2, CAST(0x0000A06101140810 AS DateTime), N'', N'Routine vaccination', N'See again in 2 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (170, 41, 2, CAST(0x0000A0E7009450C0 AS DateTime), N'sneezing', N'hydrotherapy', N'See again in 2 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (171, 41, 2, CAST(0x0000A0B900FB4FF0 AS DateTime), N'diarrhoea, joint stiffness', N'electric shock therapy', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (172, 30, 5, CAST(0x00009EB300FB4FF0 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (173, 91, 3, CAST(0x0000A05D00986F70 AS DateTime), N'', N'Routine vaccination', N'See again in 12 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (174, 66, 5, CAST(0x00009F43009450C0 AS DateTime), N'excessive thirstiness, uncontrollable peeing, flatulence', N'massage', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (175, 27, 5, CAST(0x00009F3600B964F0 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (176, 96, 3, CAST(0x00009F5800C5C100 AS DateTime), N'', N'Routine vaccination', N'See again in 2 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (177, 107, 2, CAST(0x0000A04F00DA5A70 AS DateTime), N'deafness', N'stitches', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (178, 27, 2, CAST(0x00009F6900BD83A0 AS DateTime), N'joint stiffness', N'stitches', N'See again in 3 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (179, 36, 3, CAST(0x0000A05900A4CB80 AS DateTime), N'limping', N'hydrotherapy', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (180, 9, 2, CAST(0x0000A14F00E6B680 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (181, 94, 3, CAST(0x00009F5C010FE960 AS DateTime), N'', N'Routine vaccination', N'See again in 2 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (182, 67, 3, CAST(0x00009EFA00EEF3E0 AS DateTime), N'deafness', N'hydrotherapy', N'See again in 1 month')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (183, 91, 5, CAST(0x00009E7000D63BC0 AS DateTime), N'uncontrollable peeing', N'cuddles', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (184, 9, 2, CAST(0x00009FE300DE7920 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (185, 3, 3, CAST(0x00009EB000CDFE60 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (186, 31, 5, CAST(0x0000A03C00AD08E0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (187, 97, 5, CAST(0x00009EED00D63BC0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (188, 98, 2, CAST(0x00009E9100D21D10 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (189, 95, 5, CAST(0x0000A106009450C0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (190, 71, 5, CAST(0x0000A0EB00BD83A0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (191, 74, 2, CAST(0x0000A00500D21D10 AS DateTime), N'vomiting', N'drugs', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (192, 16, 5, CAST(0x00009E7B00D63BC0 AS DateTime), N'flatulence', N'cuddles', N'See again in 2 months')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (193, 88, 5, CAST(0x0000A0A000E6B680 AS DateTime), N'', N'Routine vaccination', N'See again in 4 weeks')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (194, 86, 5, CAST(0x00009F0600C9DFB0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (195, 22, 3, CAST(0x00009EE700E6B680 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (196, 20, 3, CAST(0x00009F9400AD08E0 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (197, 78, 2, CAST(0x00009F8000A8EA30 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (198, 10, 2, CAST(0x0000A0E500DA5A70 AS DateTime), N'', N'Routine vaccination', N'')
INSERT [dbo].[Booking] ([BookingID], [PetID], [StaffID], [BookingDateTime], [Symptoms], [Treatments], [Notes]) VALUES (199, 89, 3, CAST(0x0000A0840107AC00 AS DateTime), N'hair loss', N'invasive surgery', N'')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (1, N'Ms', N'Cara', N'Rojas', N'F', CAST(0x24040B00 AS Date), N'crojas375@tpg.com.au', N'(02) 4778 5452', N'0424 677 626', N'', N'181 ONEY CIRCLE ', N'YELLOW ROCK', N'NSW', N'2527')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (2, N'Sir', N'Isiah', N'Duke', N'M', CAST(0x17E30A00 AS Date), N'isiah.duke@optusnet.com.au', N'(02) 4239 9759', N'0416 858 673', N'', N'118 CAMEO COURT ', N'DONALD CREEK', N'NSW', N'2350')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (3, N'Miss', N'Queen', N'Howe', N'F', CAST(0xED0E0B00 AS Date), N'queen.howe@tpg.com.au', N'(02) 4779 1377', N'0432 168 361', N'', N'25 MULDROW STREET ', N'MILVALE', N'NSW', N'2594')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (4, N'Ms', N'Gale', N'Newman', N'F', CAST(0x16F30A00 AS Date), N'gale.newman@gmail.com', N'(02) 4545 2446', N'0427 624 396', N'', N'51 PLATINUM CIRCLE ', N'DULGUIGAN', N'NSW', N'2484')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (5, N'Mrs', N'Martha', N'Woodard', N'F', CAST(0x47E10A00 AS Date), N'martha.woodard@iinet.com.au', N'(02) 4285 2551', N'0421 784 818', N'', N'174 TIMBERWOLF CIRCLE ', N'ENFIELD SOUTH', N'NSW', N'2133')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (6, N'Mr', N'Rick', N'Prince', N'M', CAST(0x82160B00 AS Date), N'r.prince@hotmail.com', N'(02) 4582 6459', N'0434 525 675', N'', N'26/198 GOLDEN HILLS LANE ', N'PAMBULA BEACH', N'NSW', N'2549')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (7, N'Mr', N'Mack', N'Carson', N'M', CAST(0xFEF50A00 AS Date), N'mack@yahoo.com.au', N'(02) 4382 2455', N'0418 296 447', N'', N'141 ALDREN CIRCLE ', N'BROULEE', N'NSW', N'2537')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (8, N'Mr', N'Willie', N'Burnett', N'M', CAST(0x95D00A00 AS Date), N'pryo_tick_killer@gmail.com', N'(02) 4379 3727', N'0415 157 696', N'', N'122 MARINO DRIVE ', N'BLAIR ATHOL', N'NSW', N'2560')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (9, N'Mr', N'Isidro', N'Williams', N'M', CAST(0xAD120B00 AS Date), N'iwilliams72@hotmail.com', N'(02) 4345 9845', N'0403 675 211', N'', N'60 KRONOS DRIVE ', N'DRAKE VILLAGE', N'NSW', N'2469')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (10, N'Mr', N'Leonard', N'Bernard', N'M', CAST(0xFCC70A00 AS Date), N'l.bernard@gmail.com', N'(02) 4253 4363', N'0427 436 435', N'', N'124 CARAVELLE DRIVE ', N'EAST GRESFORD', N'NSW', N'2311')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (11, N'Miss', N'Marianne', N'Cannon', N'F', CAST(0xA2110B00 AS Date), N'm.cannon@bigpond.com', N'(02) 4727 2575', N'0414 762 792', N'', N'14 LIMESTONE CIRCLE ', N'ERINA', N'NSW', N'2250')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (12, N'Mr', N'Cory', N'Horn', N'M', CAST(0xE7E70A00 AS Date), N'c.horn@bigpond.com', N'(02) 4962 5235', N'0425 211 128', N'', N'9/142 HELEN DRIVE ', N'MOGENDOURA', N'NSW', N'2537')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (13, N'Miss', N'Maricela', N'Floyd', N'F', CAST(0x7ACB0A00 AS Date), N'maricela@bigpond.com', N'(02) 4284 9532', N'0416 435 744', N'Unit 8 Level 1', N'125 OLD BIRCHWOOD LOOP ROAD ', N'KOOTINGAL', N'NSW', N'2352')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (14, N'Dr', N'Josue', N'Potter', N'M', CAST(0xA2D50A00 AS Date), N'jpotter151@mirkwoodproductions.com.au', N'(02) 4348 6658', N'0423 623 244', N'Unit 8 Level 3', N'14 PARKSIDE DRIVE ', N'GUNDAROO', N'NSW', N'2620')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (15, N'Ms', N'Ellen', N'Grant', N'F', CAST(0x4EFF0A00 AS Date), N'egrant146@hotmail.com', N'(02) 4614 3278', N'0425 632 382', N'', N'12/191 REVILLA CIRCLE ', N'VALLA BEACH', N'NSW', N'2448')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (16, N'Mr', N'Salvatore', N'Pitts', N'M', CAST(0xC3EB0A00 AS Date), N's.pitts@bigpond.net.au', N'(02) 4174 4745', N'0428 464 261', N'Unit 16 Level 1', N'157 AVION STREET ', N'ILARWILL', N'NSW', N'2463')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (17, N'Ms', N'Carmella', N'Brady', N'F', CAST(0xB4D70A00 AS Date), N'carmella@hotmail.com', N'(02) 4677 1948', N'0412 246 842', N'', N'28/176 WHISPERING SPRUCE CIRCLE ', N'MUNDONGO', N'NSW', N'2720')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (18, N'Mr', N'Hiram', N'Tanner', N'M', CAST(0xB10A0B00 AS Date), N'hiram.tanner@iinet.com.au', N'(02) 4676 2444', N'0418 127 993', N'', N'24 MEYER STREET ', N'BODALLA', N'NSW', N'2545')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (19, N'Mr', N'Marco', N'Burke', N'M', CAST(0xE9DC0A00 AS Date), N'marco.burke@iinet.com.au', N'(02) 4558 5587', N'0417 227 826', N'', N'128 BIRCHWOOD SPUR ROAD ', N'TYALGUM', N'NSW', N'2484')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (20, N'Mr', N'Adolfo', N'Gonzales', N'M', CAST(0x2DF60A00 AS Date), N'adolfo.gonzales@hotmail.com', N'(02) 4617 2812', N'0403 682 237', N'', N'10 HIGHLAND STREET ', N'ETTRICK', N'NSW', N'2474')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (21, N'Mrs', N'Vanessa', N'Jacobs', N'F', CAST(0x2BD10A00 AS Date), N'vanessa.jacobs@hotmail.com', N'(02) 4388 8786', N'0428 377 178', N'', N'170 KAHILTNA DRIVE ', N'LONG POINT', N'NSW', N'2564')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (22, N'Ms', N'Henrietta', N'Brown', N'F', CAST(0x30E80A00 AS Date), N'hbrown192@tpg.com.au', N'(02) 4313 5228', N'0434 684 748', N'', N'89 ROSALIND LOOP ', N'BLACKTOWN WESTPOINT', N'NSW', N'2148')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (23, N'Mr', N'Johnathan', N'Ballard', N'M', CAST(0x33FB0A00 AS Date), N'johnathan.ballard@gmail.com', N'(02) 4968 1825', N'0418 926 372', N'Unit 3 Level 3', N'148 HIALEAH DRIVE ', N'EASTWOOD', N'NSW', N'2122')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (24, N'Ms', N'Dollie', N'Austin', N'F', CAST(0x53E60A00 AS Date), N'daustin471@optusnet.com.au', N'(02) 4817 6738', N'0428 898 385', N'', N'101 TOPHAND TRAILER COURT ', N'GWYNNEVILLE', N'NSW', N'2500')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (25, N'Dr', N'Roger', N'Mercer', N'M', CAST(0x8C080B00 AS Date), N'roger@gmail.com', N'(02) 4419 7515', N'0422 727 842', N'', N'117 BYERS LANE ', N'ISABELLA PLAINS', N'NSW', N'2905')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (26, N'Mr', N'Antwan', N'Griffith', N'M', CAST(0xFF030B00 AS Date), N'antwan.griffith@iinet.com.au', N'(02) 4768 8366', N'0431 857 258', N'', N'24 MOUNTAIN ROAD ', N'TARALGA', N'NSW', N'2580')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (27, N'Ms', N'Susanne', N'Banks', N'F', CAST(0x8EFA0A00 AS Date), N's.banks@hotmail.com', N'(02) 4212 7193', N'0414 371 863', N'', N'103 WATERFRONT LANE ', N'LINDENDALE', N'NSW', N'2480')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (28, N'Mr', N'Alvaro', N'Gilbert', N'M', CAST(0x39000B00 AS Date), N'a.gilbert@bigpond.com', N'(02) 4753 7226', N'0416 459 566', N'', N'173 NEW LONDON COURT ', N'BOWEN MOUNTAIN', N'NSW', N'2753')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (29, N'Ms', N'Georgette', N'Mcdaniel', N'F', CAST(0x0EDD0A00 AS Date), N'gmcdaniel97@bigpond.com', N'(02) 4573 9265', N'0402 723 437', N'', N'146 SAINT JAMES STREET ', N'PEMULWUY', N'NSW', N'2145')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (30, N'Ms', N'Alyson', N'Mcfadden', N'F', CAST(0xE6180B00 AS Date), N'alyson.mcfadden@gmail.com', N'(02) 4688 2332', N'0428 752 252', N'', N'90 MYRTLE DRIVE ', N'QUANDIALLA', N'NSW', N'2721')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (31, N'Mr', N'Devin', N'Reese', N'M', CAST(0x42190B00 AS Date), N'devin.reese@gmail.com', N'(02) 4457 3637', N'0405 132 526', N'', N'99 SHIVALIK DRIVE ', N'COURABYRA', N'NSW', N'2653')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (32, N'Mr', N'Phil', N'Guerra', N'M', CAST(0x4BEC0A00 AS Date), N'p.guerra@bigpond.net.au', N'(02) 4557 3267', N'0415 897 433', N'', N'80 BLUEGRASS CIRCLE ', N'DUNMORE', N'NSW', N'2529')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (33, N'Mr', N'Angelo', N'Kelly', N'M', CAST(0xDD0A0B00 AS Date), N'a.kelly@gmail.com', N'(02) 4253 4263', N'0427 436 435', N'', N'164 BLACK BEAR CIRCLE ', N'ROYAL EXCHANGE', N'NSW', N'1225')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (34, N'Ms', N'Lola', N'Trevino', N'F', CAST(0x1DFC0A00 AS Date), N'lola@bigpond.net.au', N'(02) 4383 8368', N'0426 587 382', N'', N'12/182 ESSEX PARK DRIVE ', N'CAMBEWARRA', N'NSW', N'2540')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (35, N'Mr', N'Travis', N'Mcgee', N'M', CAST(0x81E00A00 AS Date), N'travis@bigpond.net.au', N'(02) 4474 9381', N'0415 498 889', N'', N'184 SHELTIE AVENUE ', N'SCHEYVILLE', N'NSW', N'2756')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (36, N'Mrs', N'Abigail', N'Lowery', N'F', CAST(0xFCFA0A00 AS Date), N'alowery499@gmail.com', N'(02) 4184 8532', N'0433 293 422', N'', N'33 EGLOFF DRIVE ', N'OATLANDS', N'NSW', N'2117')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (37, N'Miss', N'Goldie', N'Flores', N'F', CAST(0x12EF0A00 AS Date), N'goldie.flores@bigpond.com', N'(02) 4178 4218', N'0413 625 668', N'', N'83 MILE HI WAY ', N'MASCOT', N'NSW', N'1460')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (38, N'Miss', N'Erin', N'Beasley', N'F', CAST(0xDFE70A00 AS Date), N'erin@bigpond.com', N'(02) 4714 7217', N'0416 666 434', N'', N'10/134 SOUTH AIRPARK DRIVE ', N'BURRA', N'NSW', N'2620')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (39, N'Ms', N'Natalie', N'Fields', N'F', CAST(0xC9EF0A00 AS Date), N'n.fields@gmail.com', N'(02) 4932 7558', N'0415 794 642', N'', N'31 BRUDNE ROAD ', N'ALLAWAH', N'NSW', N'2218')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (40, N'Ms', N'Peggy', N'Bennett', N'F', CAST(0x58E60A00 AS Date), N'p.bennett@hotmail.com', N'(02) 4484 6587', N'0416 298 257', N'', N'103 ANTLER LANE ', N'ROYAL EXCHANGE', N'NSW', N'1225')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (41, N'Mr', N'Alphonse', N'Griffin', N'M', CAST(0x02EC0A00 AS Date), N'a.griffin@tyasa.com.au', N'(02) 4945 6492', N'0412 378 957', N'', N'6/5 LAKE GEORGE DRIVE ', N'MONA VALE', N'NSW', N'1660')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (42, N'Miss', N'Phyllis', N'Spencer', N'F', CAST(0xC4090B00 AS Date), N'phyllis.spencer@hotmail.com', N'(02) 4641 2512', N'0413 937 734', N'', N'88 DONALD PLACE ', N'BELIMBLA PARK', N'NSW', N'2570')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (43, N'Miss', N'Beth', N'Keith', N'F', CAST(0x2F0D0B00 AS Date), N'b.keith@yahoo.com.au', N'(02) 4932 5253', N'0415 571 455', N'', N'192 DANE COURT ', N'WOOLI', N'NSW', N'2462')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (44, N'Mrs', N'Traci', N'Haynes', N'F', CAST(0x4CD00A00 AS Date), N'traci.haynes@hotmail.com', N'(02) 4129 6555', N'0423 458 446', N'', N'16 PATRICIA LANE ', N'BANKSTOWN SQUARE', N'NSW', N'2200')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (45, N'Mr', N'Darrin', N'Cannon', N'M', CAST(0x78D10A00 AS Date), N'dcannon307@optusnet.com.au', N'(02) 4476 4785', N'0423 389 372', N'', N'189 BARROW STREET ', N'INGLEBURN', N'NSW', N'2565')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (46, N'Ms', N'Melinda', N'Snow', N'F', CAST(0x31D60A00 AS Date), N'melinda@hotmail.com', N'(02) 4447 5677', N'0433 377 849', N'', N'111 WHITEHALL ROAD ', N'TWEED HEADS WEST', N'NSW', N'2485')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (47, N'Mrs', N'Ophelia', N'Wilkins', N'F', CAST(0x4FE70A00 AS Date), N'owilkins269@iinet.com.au', N'(02) 4554 5323', N'0424 144 547', N'', N'54 SPECKING AVENUE ', N'GROGAN', N'NSW', N'2666')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (48, N'Mr', N'Willie', N'Nukeit', N'M', CAST(0x80EA0A00 AS Date), N'15_seconds_on_high@gmail.com', N'(02) 4468 5531', N'0429 352 523', N'', N'13/42 SKY CIRCLE ', N'RAYMOND TERRACE EAST', N'NSW', N'2324')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (49, N'Mrs', N'Dorthy', N'Harrington', N'F', CAST(0x07FD0A00 AS Date), N'd.harrington@bigpond.net.au', N'(02) 4734 3568', N'0413 566 257', N'', N'107 STANLEY DRIVE ', N'CROWTHER', N'NSW', N'2803')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (50, N'Mr', N'Dewayne', N'Mccormick', N'M', CAST(0x2F070B00 AS Date), N'dewayne@bigpond.com', N'(02) 4128 6846', N'0429 128 465', N'', N'88 CAMPBELL AIRSTRIP ROAD ', N'WEST CHATSWOOD', N'NSW', N'1515')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (51, N'Mr', N'Ronny', N'Lancaster', N'M', CAST(0xFDFF0A00 AS Date), N'r.lancaster@bigpond.com', N'(02) 4482 8625', N'0424 931 262', N'', N'172 CALAMITY COURT ', N'MONGARLOWE', N'NSW', N'2622')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (52, N'Mr', N'Glen', N'Cameron', N'M', CAST(0x6CF00A00 AS Date), N'gcameron341@hotmail.com', N'(02) 4682 5867', N'0412 774 781', N'', N'191 SPRUCE RUN CIRCLE ', N'WALLABI POINT', N'NSW', N'2430')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (53, N'Ms', N'Cristina', N'Vance', N'F', CAST(0x09E60A00 AS Date), N'cristina@gmail.com', N'(02) 4349 3356', N'0425 932 855', N'', N'199 KATRINA CIRCLE ', N'MIRRABOOKA', N'NSW', N'2264')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (54, N'Miss', N'Tasha', N'Hancock', N'F', CAST(0x0AD50A00 AS Date), N'thancock215@hotmail.com', N'(02) 4492 4838', N'0416 278 728', N'', N'103 PORTAGE DRIVE ', N'PALMDALE', N'NSW', N'2258')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (55, N'Mr', N'Willie', N'Baggitt', N'M', CAST(0x8D050B00 AS Date), N'listen_for_the_pop@gmail.com', N'(02) 4234 8734', N'0432 564 188', N'', N'104 KITZBUHEL ROAD ', N'RAPPVILLE', N'NSW', N'2469')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (56, N'Mrs', N'Patricia', N'Bean', N'F', CAST(0x56D20A00 AS Date), N'patricia.bean@mirkwoodproductions.com.au', N'(02) 4728 9738', N'0414 183 182', N'', N'176 CAMELOT DRIVE ', N'SMITHS CREEK', N'NSW', N'2474')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (57, N'Mr', N'Normand', N'Mcmahon', N'M', CAST(0x10DB0A00 AS Date), N'normand.mcmahon@hotmail.com', N'(02) 4847 4724', N'0402 943 746', N'Unit 12 Level 1', N'143 GREATLAND DRIVE ', N'CENTRAL MANGROVE', N'NSW', N'2250')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (58, N'Ms', N'Clarice', N'Riddle', N'F', CAST(0x640B0B00 AS Date), N'clarice.riddle@gmail.com', N'(02) 4838 5745', N'0432 854 445', N'', N'4 WOODSTOCK CIRCLE ', N'SPLITTERS CREEK', N'NSW', N'2640')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (59, N'Mr', N'Scott', N'Watkins', N'M', CAST(0xEFD90A00 AS Date), N's.watkins@yahoo.com.au', N'(02) 4675 1628', N'0425 976 817', N'', N'163 GALLOWAY LOOP ', N'SOUTHGATE', N'NSW', N'2460')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (60, N'Prof', N'Sonja', N'Carr', N'F', CAST(0x8ADC0A00 AS Date), N'sonja.carr@hotmail.com', N'(02) 4464 5976', N'0428 837 333', N'', N'10 TIDEVIEW DRIVE ', N'OLD GUILDFORD', N'NSW', N'2161')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (61, N'Mr', N'Rolando', N'Gamble', N'M', CAST(0x380A0B00 AS Date), N'rolando.gamble@gmail.com', N'(02) 4247 2542', N'0429 991 767', N'', N'18/172 ED STREET ', N'CARINGBAH', N'NSW', N'1495')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (62, N'Mr', N'Rocky', N'Petersen', N'M', CAST(0xBBCE0A00 AS Date), N'rocky@optusnet.com.au', N'(02) 4687 5225', N'0402 461 317', N'', N'115 CAPE NOBLE CIRCLE ', N'KIAMA DOWNS', N'NSW', N'2533')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (63, N'Mr', N'Hiram', N'Middleton', N'M', CAST(0x36060B00 AS Date), N'hmiddleton22@tpg.com.au', N'(02) 4513 2558', N'0417 657 247', N'', N'90 DEWEY CIRCLE ', N'BEROWRA WATERS', N'NSW', N'2082')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (64, N'Miss', N'Valarie', N'Elliott', N'F', CAST(0xBB140B00 AS Date), N'v.elliott@gmail.com', N'(02) 4779 7455', N'0426 234 822', N'', N'2 BOYSEN BERRY PLACE ', N'POINT PIPER', N'NSW', N'2027')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (65, N'Mr', N'Toby', N'Booth', N'M', CAST(0xE0F60A00 AS Date), N'toby@mirkwoodproductions.com.au', N'(02) 4672 6719', N'0428 448 138', N'', N'182 HASTINGS LANE ', N'WILLIAMSDALE', N'NSW', N'2620')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (66, N'Prof', N'Hunter', N'Obrien', N'M', CAST(0xA6E50A00 AS Date), N'hobrien364@gmail.com', N'(02) 4273 8232', N'0416 922 476', N'', N'186 GARNET STREET ', N'WEETANGERA', N'NSW', N'2614')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (67, N'Mr', N'Kurt', N'Compton', N'M', CAST(0xC11A0B00 AS Date), N'k.compton@hotmail.com', N'(02) 4988 8967', N'0404 883 918', N'', N'166 GOLD CIRCLE ', N'WHITE CLIFFS', N'NSW', N'2836')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (68, N'Mr', N'Luciano', N'Hodge', N'M', CAST(0xAFF20A00 AS Date), N'luciano@mirkwoodproductions.com.au', N'(02) 4934 2288', N'0415 736 372', N'', N'22 MISTY SPRINGS COURT ', N'BLAIRMOUNT', N'NSW', N'2559')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (69, N'Mr', N'Randy', N'Gonzalez', N'M', CAST(0x9DCB0A00 AS Date), N'randy.gonzalez@tpg.com.au', N'(02) 4456 6722', N'0426 738 474', N'Unit 3 Level 2', N'48 PASO PLACE ', N'BUNGAWALBIN', N'NSW', N'2469')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (70, N'Mr', N'Monroe', N'Wilson', N'M', CAST(0xC5D50A00 AS Date), N'monroe.wilson@mirkwoodproductions.com.au', N'(02) 4664 3495', N'0415 665 952', N'', N'118 MOUNTAINMAN LOOP ', N'WEST WYALONG', N'NSW', N'2671')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (71, N'Miss', N'Simone', N'Collier', N'F', CAST(0x93CE0A00 AS Date), N'simone.collier@hotmail.com', N'(02) 4966 4262', N'0416 364 486', N'', N'5/144 ROSEMONT DRIVE ', N'NORTH BALGOWLAH', N'NSW', N'2093')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (72, N'Ms', N'Alisha', N'Vaughan', N'F', CAST(0x7DD60A00 AS Date), N'alisha@gmail.com', N'(02) 4324 5722', N'0415 514 624', N'', N'87 GLENN NB OFF S BIRCHWOOD LOOP RAMP ', N'PACIFIC PALMS', N'NSW', N'2428')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (73, N'Mr', N'Willie', N'Tweezeit', N'M', CAST(0xF70D0B00 AS Date), N'grab_life_by_the_head@gmail.com', N'(02) 4772 2315', N'0426 412 512', N'', N'80 HOSKEN STREET ', N'MACQUARIE PARK', N'NSW', N'2113')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (74, N'Mr', N'Louie', N'Lindsay', N'M', CAST(0x4D080B00 AS Date), N'l.lindsay@gmail.com', N'(02) 4663 8289', N'0419 324 483', N'', N'185 HILLCREST DRIVE ', N'LISMORE', N'NSW', N'2480')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (75, N'Miss', N'Bettie', N'Mathis', N'F', CAST(0x66DE0A00 AS Date), N'bettie.mathis@mirkwoodproductions.com.au', N'(02) 4794 3885', N'0431 296 777', N'', N'69 CHAPEL DRIVE ', N'HUMULA', N'NSW', N'2652')
INSERT [dbo].[Customer] ([CustomerID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode]) VALUES (76, N'Dr', N'Kay', N'Blake', N'F', CAST(0x0CED0A00 AS Date), N'k.blake@hotmail.com', N'(02) 4677 6243', N'0436 616 698', N'', N'24 BRIDGER PLACE ', N'WARIALDA RAIL', N'NSW', N'2402')
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (1, N'Bandage scissors', N'Universal Scissors are multi-purpose scissors, good for bandaging. Stainless steel, 14cm in length.', 4, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (2, N'Coflex bandage', N'CoFlex ® is a cohesive flexible bandage manufactured for bovine hoof trimmers that can also be used as a lightweight wound dressing. CoFlex does not stick to skin or hair, and provides consistent compression without the danger of constriction.', 17, 20)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (3, N'Cotton wool roll', N'Smith and Nephew Cotton Wool Roll is a cellulose fibre/cotton blend dressing of surgical absorbent quality for wound management, bandaging and first aid.', 13, 50)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (4, N'Elastoplast roll', N'Value pack of 12 - Super adhesive bandages. Veterinary Elastoplast is an elastic adhesive bandage.', 5, 25)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (5, N'Jelonet', N'Jelonet* is a paraffin gauze dressing 36 pieces of 10x10cm Features Soft paraffin base Sterile leno weave.', 29, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (6, N'Pill popper tablet applicator', N'Holds the tablet for you, making it easier to give your dog or cat tablets. You depress the plunger to administer the dose.', 38, 25)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (7, N'Rip-Rap heavy bandage', N'Heavy duty self-adhesive bandage - the ''King Gee'' of cohesive bandages. Ideal for use on large animals.4.5m long, 5cm wide.', 3, 20)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (8, N'Sharps container', N'1.4L sharps disposable container. Please refer to local legislation regarding disposal of used containers.', 0, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (9, N'Stethoscope', N'Basic dual headed stethoscope', 4, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (10, N'Swabs guaze', N'Guaze for wounds. 5cm wide.', 102, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (11, N'Syringe (10ml)', N'10ml Centre Fit Luer Slip steril syringe.', 15, 10)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (12, N'Epsom salt', N'Also known as magnesium sulphate. Feed grade', 10, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (13, N'Veterinary Gamgee', N'Highly-absorant hospital-grade cotton wool encased in a low-adherent, tubular non-woven cover.', 5, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (14, N'Tick-approved microwave bags', N'Zip-lock bags that are designed specifically for tick destruction.', 318, 100)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (15, N'Wrap it bandage', N'Cohesive non-woven bandage. 1.8m unstretched and 4.5m stretched.', 24, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (16, N'Bunny bubble bath', N'Gently cleans and conditions coats of rabbits and guinea pigs. Tearless formulation suitable for every day use.', 20, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (17, N'Cylap RCD - Rabbit Vaccine', N'Control of rabbit calicivirus disease. Vaccinate at 10 - 12 weeks then yearly. Give 1ml subcutaneously.', 8, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (18, N'Fidos bubble bath', N'Fido''s Bunny Bath Shampoo and Cond in 1 is a mild soap free formulation especially suitable for the delicate skins of rabbits, guinea pigs and other furry pets. Your pet''s coat is left clean and lustrous with a long lasting baby powder scent.', 3, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (19, N'Biolac animal rearing teats - T1', N'Fake teats for assisting with the rearing of animals. Teatlicious.', 4, 2)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (20, N'Biolac animal rearing teats - T2', N'Fake teats for assisting with the rearing of animals. Teatlicious.', 3, 2)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (21, N'Biolac animal rearing teats - T3', N'Fake teats for assisting with the rearing of animals. Teatlicious.', 12, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (22, N'Biolac animal rearing teats - T4', N'Fake teats for assisting with the rearing of animals. Teatlicious.', 6, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (23, N'Pet nursing bottle', N'A bottle…', 0, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (24, N'Dentipet finger toothbrush', N'For the cleaning of animals'' teeth using one''s finger.', 2, 24)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (25, N'PetLife QuickFit Muzzle', N'The PetLife Quick Fit Muzzle is a fantastic standard dog muzzle. It even has a brilliant adjustable velcro strap, so you know it''ll fit properly. There''s a mesh part under the chin too for better ventilation and comfort.', 2, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (26, N'Beta-Cel', N'Electrolyte mixture for replacement therapy for racing greyhounds.', 0, 10)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (27, N'Equivit Enduramex', N'Endura-Max Plus Electrolyte Paste is a buffered oral electrolyte supplement designed specifically for endurance horses.', 0, 2)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (28, N'Thundershirt for cats', N'A shirt that provids general well-balanced pressure resulting in a calm animal.', 12, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (29, N'Thundershirt for dogs', N'A shirt that provids general well-balanced pressure resulting in a calm animal.', 3, 10)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (30, N'Thundershirt for ferrets', N'A shirt that provids general well-balanced pressure resulting in a calm animal.', 8, 10)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (31, N'Thundershirt for fish', N'A shirt that provids general well-balanced pressure resulting in a calm animal.', 1, 10)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (32, N'Thundershirt for goats', N'A shirt that provids general well-balanced pressure resulting in a calm animal.', 0, 10)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (33, N'Thundershirt for slugs', N'A shirt that provids general well-balanced pressure resulting in a calm animal.', 0, 100)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (34, N'Permoxin', N'Antiparasitic wash', 123, 50)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (35, N'Advantage for dogs', N'Advantage flea and tick solution.', 184, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (36, N'Advantage for cats', N'Advantage flea and tick solution.', 172, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (37, N'Advantage for fish', N'Advantage flea and tick solution.', 12, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (38, N'Advantage for ferrets', N'Advantage flea and tick solution.', 62, 0)
INSERT [dbo].[Inventory] ([ItemID], [ItemName], [ItemDescription], [NumberOnHand], [NumberOnOrder]) VALUES (39, N'Advantage for goats', N'Advantage flea and tick solution.', 21, 10)
SET IDENTITY_INSERT [dbo].[Inventory] OFF
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (1, N'Nkala', N'Cat', N'DLH', CAST(0x1F340B00 AS Date), N'F', 3.6, 53)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (2, N'Charlie', N'Cat', N'Burmese', CAST(0x2C270B00 AS Date), N'M', 4.3, 33)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (3, N'Darky', N'Cat', N'DSH', CAST(0xAD330B00 AS Date), N'M', 6.8, 18)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (4, N'Kitty', N'Cat', N'DSH', CAST(0x862F0B00 AS Date), N'M', 7.5, 63)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (5, N'Stripey', N'Cat', N'DSH', CAST(0x01230B00 AS Date), N'M', 6.9, 33)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (6, N'Happy', N'Cat', N'Persian', CAST(0x8C350B00 AS Date), N'M', 8.1, 19)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (7, N'Bichel', N'Cat', N'DSH', CAST(0x272B0B00 AS Date), N'M', 3, 13)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (8, N'Trouble', N'Cat', N'DLH', CAST(0x86220B00 AS Date), N'M', 6.7, 67)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (9, N'Rupert', N'Cat', N'DSH', CAST(0xBF270B00 AS Date), N'M', 5.4, 66)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (10, N'Lucky', N'Cat', N'Siamese', CAST(0xA42B0B00 AS Date), N'M', 7.4, 36)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (11, N'Jemima', N'Cat', N'DSH', CAST(0x5D2D0B00 AS Date), N'F', 7.2, 69)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (12, N'Nathan', N'Cat', N'DSH', CAST(0x022C0B00 AS Date), N'M', 6.1, 7)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (13, N'Harold', N'Cat', N'DSH', CAST(0xC9350B00 AS Date), N'M', 5.8, 7)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (14, N'Tabitha', N'Cat', N'Persian', CAST(0x872D0B00 AS Date), N'F', 4.3, 37)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (15, N'Diggeden', N'Cat', N'DSH', CAST(0xBC280B00 AS Date), N'M', 6.8, 54)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (16, N'Tigger', N'Cat', N'Burmese', CAST(0xA7300B00 AS Date), N'M', 5.7, 7)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (17, N'Sadza', N'Cat', N'DSH', CAST(0xCA340B00 AS Date), N'M', 5.9, 31)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (18, N'Gravy', N'Cat', N'DSH', CAST(0x15260B00 AS Date), N'M', 3.9, 18)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (19, N'Phoebe', N'Cat', N'Persian', CAST(0xB22E0B00 AS Date), N'F', 7.2, 73)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (20, N'Meow-Meow', N'Cat', N'DSH', CAST(0x132B0B00 AS Date), N'F', 4.4, 60)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (21, N'Puffles', N'Cat', N'Siamese', CAST(0x08300B00 AS Date), N'F', 3.9, 70)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (22, N'Splat', N'Cat', N'Persian', CAST(0x362D0B00 AS Date), N'F', 7.8, 34)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (23, N'Paw Thing', N'Cat', N'DSH', CAST(0x6E310B00 AS Date), N'F', 3.4, 30)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (24, N'Verushka', N'Cat', N'Russian Blue', CAST(0x78220B00 AS Date), N'F', 5.1, 68)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (25, N'Gobbles', N'Cat', N'DSH', CAST(0xE92C0B00 AS Date), N'M', 3.6, 39)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (26, N'Fat Fred', N'Cat', N'DSH', CAST(0x6C2D0B00 AS Date), N'M', 5.5, 58)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (27, N'Blimpie', N'Cat', N'Burmese', CAST(0x58240B00 AS Date), N'M', 7.5, 16)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (28, N'Fred', N'Cat', N'Siamese', CAST(0xB2250B00 AS Date), N'M', 4.2, 27)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (29, N'Frankie', N'Cat', N'DSH', CAST(0x69310B00 AS Date), N'M', 7.1, 55)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (30, N'Sooty', N'Cat', N'DLH', CAST(0xCF2A0B00 AS Date), N'M', 7, 67)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (31, N'Geeves', N'Cat', N'DLH', CAST(0xEA2D0B00 AS Date), N'M', 6.9, 70)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (32, N'Miranda', N'Cat', N'DSH', CAST(0xB52B0B00 AS Date), N'F', 7.8, 25)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (33, N'Cazza', N'Cat', N'DLH', CAST(0x21340B00 AS Date), N'F', 6.2, 36)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (34, N'Abby', N'Cat', N'Munchkin', CAST(0xC2220B00 AS Date), N'F', 7.4, 40)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (35, N'Whiskers', N'Cat', N'DSH', CAST(0x66240B00 AS Date), N'M', 3.1, 37)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (36, N'Boopie', N'Cat', N'Ragdoll', CAST(0xA0320B00 AS Date), N'M', 8.1, 42)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (37, N'Cleo', N'Cat', N'Birman', CAST(0x36240B00 AS Date), N'M', 8.8, 59)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (38, N'Nick', N'Cat', N'Birman', CAST(0x36320B00 AS Date), N'M', 7.7, 1)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (39, N'Ziggy', N'Dog', N'Kelpie', CAST(0xA6350B00 AS Date), N'M', 4.3, 31)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (40, N'Bazza', N'Dog', N'Kelpie', CAST(0xBE2D0B00 AS Date), N'M', 11.6, 3)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (41, N'Bindi', N'Dog', N'Australian Terrier', CAST(0x2C2E0B00 AS Date), N'M', 12.9, 23)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (42, N'Butch', N'Dog', N'Boxer', CAST(0x86250B00 AS Date), N'M', 10.5, 46)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (43, N'Mitzi', N'Dog', N'Maltese Terrier', CAST(0xD12C0B00 AS Date), N'F', 18.6, 65)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (44, N'Rusty', N'Dog', N'Red Setter', CAST(0x39310B00 AS Date), N'M', 11.4, 51)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (45, N'Pippa', N'Dog', N'Whippet', CAST(0xDB2F0B00 AS Date), N'F', 7.9, 75)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (46, N'Top', N'Dog', N'Labrador', CAST(0x44340B00 AS Date), N'F', 4, 50)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (47, N'Red', N'Dog', N'King Charles spaniel', CAST(0x34360B00 AS Date), N'M', 10.1, 16)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (48, N'Blue', N'Dog', N'Maltese Poodle', CAST(0xFF250B00 AS Date), N'M', 8.9, 2)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (49, N'Jarrad', N'Dog', N'Jack Russell', CAST(0x922E0B00 AS Date), N'M', 17.9, 20)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (50, N'Amigo', N'Dog', N'Maltese Poodle', CAST(0x7A240B00 AS Date), N'M', 15.9, 42)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (51, N'Bonkers', N'Dog', N'Dachshund', CAST(0x3F350B00 AS Date), N'M', 4, 68)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (52, N'Bongo', N'Dog', N'Labrador', CAST(0xA6260B00 AS Date), N'M', 11.5, 30)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (53, N'Crazy Horse', N'Dog', N'Maltese Poodle', CAST(0xC9250B00 AS Date), N'M', 17.8, 60)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (54, N'Wooffles', N'Dog', N'King Charles spaniel', CAST(0xE62C0B00 AS Date), N'F', 3.2, 36)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (55, N'Darling', N'Dog', N'Afghan Hound', CAST(0x82260B00 AS Date), N'F', 9.6, 29)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (56, N'Precious', N'Dog', N'Pekinese', CAST(0x102D0B00 AS Date), N'F', 19.1, 21)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (57, N'Zog', N'Dog', N'Border Collie', CAST(0x4C360B00 AS Date), N'F', 15.5, 22)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (58, N'Max', N'Dog', N'Labrador', CAST(0x11320B00 AS Date), N'M', 11.4, 3)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (59, N'Dingo', N'Dog', N'Poodle', CAST(0xBA240B00 AS Date), N'M', 14.3, 54)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (60, N'Wolf', N'Dog', N'Labrador', CAST(0xBC2D0B00 AS Date), N'M', 16.6, 42)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (61, N'Slobberchops', N'Dog', N'Boxer', CAST(0x48320B00 AS Date), N'M', 3.4, 36)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (62, N'Thief', N'Dog', N'Border Collie', CAST(0x9D300B00 AS Date), N'M', 7.6, 2)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (63, N'Buttsniffer', N'Dog', N'Labradoodle', CAST(0x312D0B00 AS Date), N'M', 11.8, 68)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (64, N'Ferdy', N'Dog', N'Maltese Poodle', CAST(0xFA210B00 AS Date), N'M', 9, 16)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (65, N'Ursula', N'Dog', N'Labrador', CAST(0xAB240B00 AS Date), N'F', 6.3, 7)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (66, N'Bella', N'Dog', N'Pomeranian', CAST(0x1A2C0B00 AS Date), N'F', 10.3, 64)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (67, N'Gerda', N'Dog', N'Labrador', CAST(0xCF2E0B00 AS Date), N'F', 16, 11)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (68, N'Sammy', N'Dog', N'Border Collie', CAST(0x30290B00 AS Date), N'M', 16.8, 44)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (69, N'Chuck', N'Dog', N'King Charles spaniel', CAST(0x3D280B00 AS Date), N'M', 13.5, 2)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (70, N'Burglar', N'Ferret', N'', CAST(0xCD2A0B00 AS Date), N'F', 11.4, 70)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (71, N'Mike', N'Ferret', N'Cinammon Ferret', CAST(0x44360B00 AS Date), N'M', 7.8, 12)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (72, N'Nerdwood', N'Ferret', N'Cinammon Ferret', CAST(0x512B0B00 AS Date), N'M', 18.7, 73)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (73, N'Frederico', N'Ferret', N'', CAST(0xEE210B00 AS Date), N'M', 4.5, 70)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (74, N'Felix', N'Ferret', N'', CAST(0xF0340B00 AS Date), N'M', 18.3, 23)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (75, N'Trapper', N'Ferret', N'', CAST(0x61340B00 AS Date), N'F', 11.2, 71)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (76, N'Sneaky Whiskers', N'Ferret', N'Butterscotch Ferret', CAST(0x59300B00 AS Date), N'F', 4.4, 15)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (77, N'Greg', N'Snake', N'Eel Snake', CAST(0xF5310B00 AS Date), N'M', 6.6, 75)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (78, N'Woodie', N'Snake', N'Python', CAST(0x69320B00 AS Date), N'M', 11.9, 36)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (79, N'Jools', N'Snake', N'Brown Snake', CAST(0x002F0B00 AS Date), N'F', 16.3, 57)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (80, N'Suzie', N'Snake', N'Black Snake', CAST(0x5D340B00 AS Date), N'F', 15.7, 44)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (81, N'Stretch', N'Snake', N'Python', CAST(0xD7320B00 AS Date), N'F', 8.9, 6)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (82, N'Thermal', N'Koala', N'', CAST(0xD7310B00 AS Date), N'M', 18.2, 32)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (83, N'Matt', N'Goat', N'', CAST(0x62350B00 AS Date), N'M', 16.5, 62)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (84, N'Moose', N'Goat', N'', CAST(0xA5340B00 AS Date), N'F', 13.5, 75)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (85, N'Garry', N'Goat', N'', CAST(0xCB330B00 AS Date), N'M', 11.8, 36)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (86, N'Peter', N'Rabbit ', N'', CAST(0x59300B00 AS Date), N'M', 9.1, 39)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (87, N'Hopper', N'Rabbit ', N'', CAST(0xEB350B00 AS Date), N'F', 7.8, 50)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (88, N'Thunder', N'Rabbit ', N'Angora', CAST(0xD5330B00 AS Date), N'F', 7.1, 14)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (89, N'Breedz', N'Rabbit ', N'', CAST(0x2B360B00 AS Date), N'M', 5.8, 47)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (90, N'Sunflower', N'Rabbit ', N'', CAST(0x672E0B00 AS Date), N'F', 3.3, 51)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (91, N'Mug', N'Rabbit ', N'', CAST(0xB3330B00 AS Date), N'F', 6.6, 65)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (92, N'Midnight', N'Mouse', N'', CAST(0xFE2F0B00 AS Date), N'M', 0, 10)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (93, N'Hashimoto', N'Mouse', N'', CAST(0x41300B00 AS Date), N'M', 0, 66)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (94, N'Claudette', N'Mouse', N'', CAST(0x08300B00 AS Date), N'F', 0, 14)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (95, N'Toffee', N'Guinea Pig', N'', CAST(0xDC320B00 AS Date), N'F', 0, 18)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (96, N'Fudge', N'Guinea Pig', N'', CAST(0x2B350B00 AS Date), N'F', 0, 29)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (97, N'Caramel', N'Guinea Pig', N'', CAST(0x44350B00 AS Date), N'F', 0, 58)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (98, N'Dollar', N'Guinea Pig', N'', CAST(0x96320B00 AS Date), N'F', 0, 3)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (99, N'Patches', N'Guinea Pig', N'', CAST(0xB3340B00 AS Date), N'M', 0, 12)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (100, N'Splodge', N'Guinea Pig', N'', CAST(0x09330B00 AS Date), N'M', 0, 1)
GO
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (101, N'Nibbles', N'Rat', N'', CAST(0x09300B00 AS Date), N'M', 0, 35)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (102, N'Twitch', N'Rat', N'', CAST(0x492F0B00 AS Date), N'F', 0, 73)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (103, N'Chomper', N'Rat', N'', CAST(0xC42F0B00 AS Date), N'F', 0, 75)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (104, N'Buck', N'Rat', N'', CAST(0x63360B00 AS Date), N'M', 0, 54)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (105, N'Seal', N'Guinea Pig', N'', CAST(0x7D340B00 AS Date), N'M', 0, 67)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (106, N'Lisa', N'Guinea Pig', N'', CAST(0x762E0B00 AS Date), N'F', 0, 46)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (107, N'Percy', N'Rat', N'', CAST(0xF0320B00 AS Date), N'M', 0, 53)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (108, N'Hannah', N'Rat', N'', CAST(0xFA2E0B00 AS Date), N'F', 0, 67)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (109, N'Lurch', N'Rat', N'', CAST(0x8F320B00 AS Date), N'F', 0, 46)
INSERT [dbo].[Pet] ([PetID], [PetName], [Species], [Breed], [DOB], [Gender], [Weight], [CustomerID]) VALUES (110, N'Teacher', N'Tortoise', N'', CAST(0x12340B00 AS Date), N'M', 11, 58)
INSERT [dbo].[Staff] ([StaffID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode], [Position]) VALUES (1, N'Mr', N'Keith', N'Cabrade', N'M', CAST(0xADFD0A00 AS Date), N'keith@tickedoff.com.au', N'(02) 9912 8192', N'0401 982 389', N'', N'10 Cracked Rd', N'Avalon', N'NSW', N'2107', N'Manager')
INSERT [dbo].[Staff] ([StaffID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode], [Position]) VALUES (2, N'Ms', N'Savannah', N'Chartreux', N'F', CAST(0x3AF40A00 AS Date), N'savannah@tickedoff.com.au', N'(02) 8863 4123', N'0411 786 344', N'Unit 1', N'19 Serval St', N'Mona Vale', N'NSW', N'2103', N'Vet')
INSERT [dbo].[Staff] ([StaffID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode], [Position]) VALUES (3, N'Dr', N'Peter', N'Pug', N'M', CAST(0x54F30A00 AS Date), N'peter@tickedoff.com.au', N'', N'0401 298 128', N'', N'80 Panther Pl', N'Morisset', N'NSW', N'2264', N'Vet')
INSERT [dbo].[Staff] ([StaffID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode], [Position]) VALUES (4, N'Mrs', N'Gail', N'Cavia', N'F', CAST(0x6EFD0A00 AS Date), N'gail@tickedoff.com.au', N'(02) 9317 1278', N'0401 829 998', N'', N'123 Porcellus Rd', N'Newport', N'NSW', N'2106', N'Office Assistant')
INSERT [dbo].[Staff] ([StaffID], [Title], [FirstName], [LastName], [Gender], [DOB], [Email], [Phone1], [Phone2], [Street1], [Street2], [Suburb], [State], [Postcode], [Position]) VALUES (5, N'Mrs', N'Greta', N'Mustela', N'F', CAST(0x80F90A00 AS Date), N'greta@tickedoff.com.au', N'', N'0411 238 812', N'', N'10 Polecat St', N'Turramurra', N'NSW', N'2074', N'Vet')
INSERT [dbo].[State] ([State]) VALUES (N'ACT')
INSERT [dbo].[State] ([State]) VALUES (N'NSW')
INSERT [dbo].[State] ([State]) VALUES (N'NT')
INSERT [dbo].[State] ([State]) VALUES (N'SA')
INSERT [dbo].[State] ([State]) VALUES (N'TAS')
INSERT [dbo].[State] ([State]) VALUES (N'VIC')
INSERT [dbo].[State] ([State]) VALUES (N'WA')
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (1, CAST(0x94360B00 AS Date), CAST(0x96360B00 AS Date), 56, 682.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (2, CAST(0x94360B00 AS Date), CAST(0x98360B00 AS Date), 97, 121.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (3, CAST(0x94360B00 AS Date), CAST(0x9B360B00 AS Date), 12, 222.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (4, CAST(0x95360B00 AS Date), CAST(0x97360B00 AS Date), 84, 126.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (5, CAST(0x95360B00 AS Date), CAST(0x98360B00 AS Date), 56, 655.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (6, CAST(0x95360B00 AS Date), CAST(0x98360B00 AS Date), 24, 729.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (7, CAST(0x95360B00 AS Date), CAST(0x99360B00 AS Date), 103, 327.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (8, CAST(0x95360B00 AS Date), CAST(0x9E360B00 AS Date), 36, 274.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (9, CAST(0x96360B00 AS Date), CAST(0x97360B00 AS Date), 18, 658.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (10, CAST(0x96360B00 AS Date), CAST(0x98360B00 AS Date), 8, 292.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (11, CAST(0x96360B00 AS Date), CAST(0x98360B00 AS Date), 70, 640.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (12, CAST(0x96360B00 AS Date), CAST(0x99360B00 AS Date), 45, 684.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (13, CAST(0x96360B00 AS Date), CAST(0x99360B00 AS Date), 66, 553.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (14, CAST(0x96360B00 AS Date), CAST(0x99360B00 AS Date), 33, 253.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (15, CAST(0x96360B00 AS Date), CAST(0x9A360B00 AS Date), 64, 252.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (16, CAST(0x96360B00 AS Date), CAST(0x9C360B00 AS Date), 21, 87.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (17, CAST(0x96360B00 AS Date), CAST(0xA1360B00 AS Date), 62, 522.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (18, CAST(0x97360B00 AS Date), CAST(0x99360B00 AS Date), 41, 666.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (19, CAST(0x97360B00 AS Date), CAST(0x9A360B00 AS Date), 41, 324.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (20, CAST(0x97360B00 AS Date), CAST(0x9B360B00 AS Date), 7, 579.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (21, CAST(0x97360B00 AS Date), CAST(0xA1360B00 AS Date), 86, 612.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (22, CAST(0x97360B00 AS Date), CAST(0xA2360B00 AS Date), 24, 676.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (23, CAST(0x98360B00 AS Date), CAST(0x99360B00 AS Date), 105, 84.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (24, CAST(0x98360B00 AS Date), CAST(0x99360B00 AS Date), 97, 183.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (25, CAST(0x98360B00 AS Date), CAST(0x9A360B00 AS Date), 48, 166.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (26, CAST(0x98360B00 AS Date), CAST(0x9A360B00 AS Date), 45, 123.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (27, CAST(0x98360B00 AS Date), CAST(0x9B360B00 AS Date), 29, 571.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (28, CAST(0x98360B00 AS Date), CAST(0x9C360B00 AS Date), 46, 156.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (29, CAST(0x98360B00 AS Date), CAST(0x9F360B00 AS Date), 77, 666.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (30, CAST(0x98360B00 AS Date), CAST(0xA4360B00 AS Date), 50, 103.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (31, CAST(0x99360B00 AS Date), CAST(0x9A360B00 AS Date), 71, 630.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (32, CAST(0x99360B00 AS Date), CAST(0x9B360B00 AS Date), 102, 630.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (33, CAST(0x99360B00 AS Date), CAST(0x9D360B00 AS Date), 19, 535.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (34, CAST(0x99360B00 AS Date), CAST(0x9D360B00 AS Date), 106, 556.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (35, CAST(0x99360B00 AS Date), CAST(0x9D360B00 AS Date), 8, 703.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (36, CAST(0x9A360B00 AS Date), CAST(0x9B360B00 AS Date), 8, 417.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (37, CAST(0x9A360B00 AS Date), CAST(0x9B360B00 AS Date), 85, 555.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (38, CAST(0x9A360B00 AS Date), CAST(0x9C360B00 AS Date), 92, 388.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (39, CAST(0x9A360B00 AS Date), CAST(0x9E360B00 AS Date), 61, 36.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (40, CAST(0x9A360B00 AS Date), CAST(0x9F360B00 AS Date), 9, 327.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (41, CAST(0x9A360B00 AS Date), CAST(0xA2360B00 AS Date), 41, 681.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (42, CAST(0x9B360B00 AS Date), CAST(0x9D360B00 AS Date), 38, 424.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (43, CAST(0x9B360B00 AS Date), CAST(0x9E360B00 AS Date), 110, 228.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (44, CAST(0x9B360B00 AS Date), CAST(0x9F360B00 AS Date), 105, 658.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (45, CAST(0x9B360B00 AS Date), CAST(0xA3360B00 AS Date), 61, 262.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (46, CAST(0x9C360B00 AS Date), CAST(0x9D360B00 AS Date), 58, 304.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (47, CAST(0x9C360B00 AS Date), CAST(0x9D360B00 AS Date), 88, 43.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (48, CAST(0x9C360B00 AS Date), CAST(0x9D360B00 AS Date), 55, 373.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (49, CAST(0x9C360B00 AS Date), CAST(0x9D360B00 AS Date), 106, 103.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (50, CAST(0x9C360B00 AS Date), CAST(0x9E360B00 AS Date), 76, 573.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (51, CAST(0x9C360B00 AS Date), CAST(0x9E360B00 AS Date), 48, 592.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (52, CAST(0x9C360B00 AS Date), CAST(0xA0360B00 AS Date), 92, 319.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (53, CAST(0x9D360B00 AS Date), CAST(0x9F360B00 AS Date), 109, 634.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (54, CAST(0x9D360B00 AS Date), CAST(0x9F360B00 AS Date), 22, 213.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (55, CAST(0x9D360B00 AS Date), CAST(0xA0360B00 AS Date), 69, 373.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (56, CAST(0x9D360B00 AS Date), CAST(0xA0360B00 AS Date), 12, 96.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (57, CAST(0x9D360B00 AS Date), CAST(0xA1360B00 AS Date), 53, 373.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (58, CAST(0x9D360B00 AS Date), CAST(0xA3360B00 AS Date), 51, 666.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (59, CAST(0x9D360B00 AS Date), CAST(0xA8360B00 AS Date), 110, 550.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (60, CAST(0x9E360B00 AS Date), CAST(0xA0360B00 AS Date), 86, 108.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (61, CAST(0x9E360B00 AS Date), CAST(0xA1360B00 AS Date), 14, 484.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (62, CAST(0x9E360B00 AS Date), CAST(0xA1360B00 AS Date), 85, 295.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (63, CAST(0x9E360B00 AS Date), CAST(0xA4360B00 AS Date), 84, 636.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (64, CAST(0x9E360B00 AS Date), CAST(0xA8360B00 AS Date), 33, 138.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (65, CAST(0x9E360B00 AS Date), CAST(0xAA360B00 AS Date), 93, 297.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (66, CAST(0x9E360B00 AS Date), CAST(0xAB360B00 AS Date), 99, 177.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (67, CAST(0x9F360B00 AS Date), CAST(0xA0360B00 AS Date), 86, 201.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (68, CAST(0x9F360B00 AS Date), CAST(0xA0360B00 AS Date), 12, 657.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (69, CAST(0x9F360B00 AS Date), CAST(0xA0360B00 AS Date), 81, 678.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (70, CAST(0x9F360B00 AS Date), CAST(0xA1360B00 AS Date), 91, 270.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (71, CAST(0x9F360B00 AS Date), CAST(0xA2360B00 AS Date), 52, 307.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (72, CAST(0x9F360B00 AS Date), CAST(0xA5360B00 AS Date), 17, 621.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (73, CAST(0xA0360B00 AS Date), CAST(0xA1360B00 AS Date), 67, 694.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (74, CAST(0xA0360B00 AS Date), CAST(0xA2360B00 AS Date), 62, 571.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (75, CAST(0xA0360B00 AS Date), CAST(0xA2360B00 AS Date), 67, 537.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (76, CAST(0xA0360B00 AS Date), CAST(0xA2360B00 AS Date), 59, 292.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (77, CAST(0xA0360B00 AS Date), CAST(0xA4360B00 AS Date), 47, 214.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (78, CAST(0xA0360B00 AS Date), CAST(0xA4360B00 AS Date), 45, 444.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (79, CAST(0xA0360B00 AS Date), CAST(0xA4360B00 AS Date), 72, 442.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (80, CAST(0xA0360B00 AS Date), CAST(0xAC360B00 AS Date), 17, 535.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (81, CAST(0xA1360B00 AS Date), CAST(0xA4360B00 AS Date), 75, 445.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (82, CAST(0xA1360B00 AS Date), CAST(0xA4360B00 AS Date), 108, 535.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (83, CAST(0xA1360B00 AS Date), CAST(0xA5360B00 AS Date), 93, 559.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (84, CAST(0xA1360B00 AS Date), CAST(0xAB360B00 AS Date), 82, 160.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (85, CAST(0xA1360B00 AS Date), CAST(0xAE360B00 AS Date), 98, 456.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (86, CAST(0xA2360B00 AS Date), CAST(0xA5360B00 AS Date), 66, 633.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (87, CAST(0xA2360B00 AS Date), CAST(0xA5360B00 AS Date), 15, 409.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (88, CAST(0xA2360B00 AS Date), CAST(0xA5360B00 AS Date), 63, 604.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (89, CAST(0xA2360B00 AS Date), CAST(0xA6360B00 AS Date), 7, 568.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (90, CAST(0xA3360B00 AS Date), CAST(0xA4360B00 AS Date), 66, 193.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (91, CAST(0xA3360B00 AS Date), CAST(0xA4360B00 AS Date), 100, 204.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (92, CAST(0xA3360B00 AS Date), CAST(0xA4360B00 AS Date), 76, 631.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (93, CAST(0xA3360B00 AS Date), CAST(0xA4360B00 AS Date), 45, 304.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (94, CAST(0xA3360B00 AS Date), CAST(0xA4360B00 AS Date), 92, 247.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (95, CAST(0xA3360B00 AS Date), CAST(0xA5360B00 AS Date), 98, 660.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (96, CAST(0xA3360B00 AS Date), CAST(0xA5360B00 AS Date), 20, 283.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (97, CAST(0xA3360B00 AS Date), CAST(0xA6360B00 AS Date), 43, 619.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (98, CAST(0xA3360B00 AS Date), CAST(0xA6360B00 AS Date), 90, 226.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (99, CAST(0xA3360B00 AS Date), CAST(0xA7360B00 AS Date), 91, 667.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (100, CAST(0xA3360B00 AS Date), CAST(0xB0360B00 AS Date), 94, 678.0000)
GO
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (101, CAST(0xA4360B00 AS Date), CAST(0xA6360B00 AS Date), 105, 708.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (102, CAST(0xA4360B00 AS Date), CAST(0xA6360B00 AS Date), 57, 735.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (103, CAST(0xA4360B00 AS Date), CAST(0xA8360B00 AS Date), 55, 600.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (104, CAST(0xA4360B00 AS Date), CAST(0xB1360B00 AS Date), 103, 190.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (105, CAST(0xA5360B00 AS Date), CAST(0xA6360B00 AS Date), 10, 61.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (106, CAST(0xA5360B00 AS Date), CAST(0xA6360B00 AS Date), 72, 369.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (107, CAST(0xA5360B00 AS Date), CAST(0xA7360B00 AS Date), 67, 693.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (108, CAST(0xA5360B00 AS Date), CAST(0xA8360B00 AS Date), 84, 693.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (109, CAST(0xA5360B00 AS Date), CAST(0xA9360B00 AS Date), 78, 198.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (110, CAST(0xA5360B00 AS Date), CAST(0xA9360B00 AS Date), 42, 61.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (111, CAST(0xA5360B00 AS Date), CAST(0xA9360B00 AS Date), 66, 724.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (112, CAST(0xA5360B00 AS Date), CAST(0xA9360B00 AS Date), 26, 517.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (113, CAST(0xA5360B00 AS Date), CAST(0xAC360B00 AS Date), 43, 606.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (114, CAST(0xA6360B00 AS Date), CAST(0xA7360B00 AS Date), 109, 736.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (115, CAST(0xA6360B00 AS Date), CAST(0xA9360B00 AS Date), 7, 453.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (116, CAST(0xA6360B00 AS Date), CAST(0xAA360B00 AS Date), 50, 699.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (117, CAST(0xA6360B00 AS Date), CAST(0xB1360B00 AS Date), 64, 627.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (118, CAST(0xA7360B00 AS Date), CAST(0xA8360B00 AS Date), 76, 487.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (119, CAST(0xA7360B00 AS Date), CAST(0xA8360B00 AS Date), 42, 45.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (120, CAST(0xA7360B00 AS Date), CAST(0xAA360B00 AS Date), 6, 163.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (121, CAST(0xA7360B00 AS Date), CAST(0xAA360B00 AS Date), 63, 726.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (122, CAST(0xA7360B00 AS Date), CAST(0xAD360B00 AS Date), 68, 705.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (123, CAST(0xA7360B00 AS Date), CAST(0xAF360B00 AS Date), 40, 175.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (124, CAST(0xA7360B00 AS Date), CAST(0xB0360B00 AS Date), 108, 34.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (125, CAST(0xA7360B00 AS Date), CAST(0xB3360B00 AS Date), 15, 274.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (126, CAST(0xA8360B00 AS Date), CAST(0xAA360B00 AS Date), 11, 126.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (127, CAST(0xA8360B00 AS Date), CAST(0xAC360B00 AS Date), 39, 450.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (128, CAST(0xA8360B00 AS Date), CAST(0xAC360B00 AS Date), 33, 390.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (129, CAST(0xA8360B00 AS Date), CAST(0xAC360B00 AS Date), 49, 735.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (130, CAST(0xA8360B00 AS Date), CAST(0xAC360B00 AS Date), 78, 238.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (131, CAST(0xA8360B00 AS Date), CAST(0xAC360B00 AS Date), 46, 631.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (132, CAST(0xA8360B00 AS Date), CAST(0xB0360B00 AS Date), 98, 151.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (133, CAST(0xA8360B00 AS Date), CAST(0xB6360B00 AS Date), 30, 135.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (134, CAST(0xA9360B00 AS Date), CAST(0xAA360B00 AS Date), 49, 505.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (135, CAST(0xA9360B00 AS Date), CAST(0xAC360B00 AS Date), 102, 114.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (136, CAST(0xA9360B00 AS Date), CAST(0xAC360B00 AS Date), 30, 175.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (137, CAST(0xA9360B00 AS Date), CAST(0xB3360B00 AS Date), 36, 573.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (138, CAST(0xA9360B00 AS Date), CAST(0xB3360B00 AS Date), 29, 424.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (139, CAST(0xA9360B00 AS Date), CAST(0xB4360B00 AS Date), 23, 628.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (140, CAST(0xA9360B00 AS Date), CAST(0xB6360B00 AS Date), 25, 582.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (141, CAST(0xAA360B00 AS Date), CAST(0xAB360B00 AS Date), 29, 475.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (142, CAST(0xAA360B00 AS Date), CAST(0xAC360B00 AS Date), 8, 571.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (143, CAST(0xAA360B00 AS Date), CAST(0xAC360B00 AS Date), 39, 253.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (144, CAST(0xAA360B00 AS Date), CAST(0xAE360B00 AS Date), 102, 204.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (145, CAST(0xAB360B00 AS Date), CAST(0xAC360B00 AS Date), 84, 547.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (146, CAST(0xAB360B00 AS Date), CAST(0xAD360B00 AS Date), 83, 727.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (147, CAST(0xAB360B00 AS Date), CAST(0xAE360B00 AS Date), 75, 540.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (148, CAST(0xAB360B00 AS Date), CAST(0xAE360B00 AS Date), 23, 604.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (149, CAST(0xAB360B00 AS Date), CAST(0xAF360B00 AS Date), 19, 507.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (150, CAST(0xAB360B00 AS Date), CAST(0xAF360B00 AS Date), 3, 166.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (151, CAST(0xAB360B00 AS Date), CAST(0xB1360B00 AS Date), 2, 442.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (152, CAST(0xAC360B00 AS Date), CAST(0xAD360B00 AS Date), 61, 130.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (153, CAST(0xAC360B00 AS Date), CAST(0xAD360B00 AS Date), 88, 255.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (154, CAST(0xAC360B00 AS Date), CAST(0xAF360B00 AS Date), 109, 748.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (155, CAST(0xAC360B00 AS Date), CAST(0xAF360B00 AS Date), 104, 66.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (156, CAST(0xAD360B00 AS Date), CAST(0xAE360B00 AS Date), 54, 496.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (157, CAST(0xAD360B00 AS Date), CAST(0xAE360B00 AS Date), 24, 655.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (158, CAST(0xAD360B00 AS Date), CAST(0xAE360B00 AS Date), 37, 366.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (159, CAST(0xAD360B00 AS Date), CAST(0xAE360B00 AS Date), 91, 198.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (160, CAST(0xAD360B00 AS Date), CAST(0xAF360B00 AS Date), 23, 411.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (161, CAST(0xAD360B00 AS Date), CAST(0xAF360B00 AS Date), 50, 660.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (162, CAST(0xAD360B00 AS Date), CAST(0xAF360B00 AS Date), 110, 426.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (163, CAST(0xAD360B00 AS Date), CAST(0xB0360B00 AS Date), 28, 91.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (164, CAST(0xAD360B00 AS Date), CAST(0xB0360B00 AS Date), 82, 531.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (165, CAST(0xAD360B00 AS Date), CAST(0xB0360B00 AS Date), 63, 640.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (166, CAST(0xAD360B00 AS Date), CAST(0xB1360B00 AS Date), 21, 223.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (167, CAST(0xAD360B00 AS Date), CAST(0xB2360B00 AS Date), 56, 534.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (168, CAST(0xAD360B00 AS Date), CAST(0xB3360B00 AS Date), 75, 369.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (169, CAST(0xAD360B00 AS Date), CAST(0xB8360B00 AS Date), 14, 643.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (170, CAST(0xAE360B00 AS Date), CAST(0xB0360B00 AS Date), 55, 238.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (171, CAST(0xAE360B00 AS Date), CAST(0xB1360B00 AS Date), 69, 195.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (172, CAST(0xAE360B00 AS Date), CAST(0xB2360B00 AS Date), 2, 361.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (173, CAST(0xAE360B00 AS Date), CAST(0xB2360B00 AS Date), 54, 211.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (174, CAST(0xAF360B00 AS Date), CAST(0xB0360B00 AS Date), 90, 298.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (175, CAST(0xAF360B00 AS Date), CAST(0xB1360B00 AS Date), 39, 111.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (176, CAST(0xAF360B00 AS Date), CAST(0xB2360B00 AS Date), 15, 604.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (177, CAST(0xAF360B00 AS Date), CAST(0xB4360B00 AS Date), 43, 739.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (178, CAST(0xAF360B00 AS Date), CAST(0xBC360B00 AS Date), 47, 138.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (179, CAST(0xAF360B00 AS Date), CAST(0xBD360B00 AS Date), 29, 414.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (180, CAST(0xB0360B00 AS Date), CAST(0xB1360B00 AS Date), 62, 82.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (181, CAST(0xB0360B00 AS Date), CAST(0xB1360B00 AS Date), 63, 174.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (182, CAST(0xB0360B00 AS Date), CAST(0xB2360B00 AS Date), 4, 712.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (183, CAST(0xB0360B00 AS Date), CAST(0xB3360B00 AS Date), 19, 435.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (184, CAST(0xB0360B00 AS Date), CAST(0xB3360B00 AS Date), 87, 630.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (185, CAST(0xB0360B00 AS Date), CAST(0xB4360B00 AS Date), 27, 486.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (186, CAST(0xB0360B00 AS Date), CAST(0xB8360B00 AS Date), 45, 265.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (187, CAST(0xB0360B00 AS Date), CAST(0xBB360B00 AS Date), 29, 169.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (188, CAST(0xB1360B00 AS Date), CAST(0xB2360B00 AS Date), 30, 355.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (189, CAST(0xB1360B00 AS Date), CAST(0xB3360B00 AS Date), 106, 397.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (190, CAST(0xB1360B00 AS Date), CAST(0xB4360B00 AS Date), 44, 618.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (191, CAST(0xB1360B00 AS Date), CAST(0xB5360B00 AS Date), 22, 327.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (192, CAST(0xB1360B00 AS Date), CAST(0xB5360B00 AS Date), 75, 261.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (193, CAST(0xB1360B00 AS Date), CAST(0xB5360B00 AS Date), 27, 484.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (194, CAST(0xB1360B00 AS Date), CAST(0xB5360B00 AS Date), 10, 391.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (195, CAST(0xB1360B00 AS Date), CAST(0xB8360B00 AS Date), 105, 157.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (196, CAST(0xB1360B00 AS Date), CAST(0xB8360B00 AS Date), 80, 456.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (197, CAST(0xB2360B00 AS Date), CAST(0xB3360B00 AS Date), 76, 661.5000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (198, CAST(0xB2360B00 AS Date), CAST(0xB3360B00 AS Date), 31, 549.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (199, CAST(0xB2360B00 AS Date), CAST(0xB6360B00 AS Date), 44, 657.0000)
INSERT [dbo].[Stay] ([StayID], [StayStartDate], [StayEndDate], [PetID], [StayCost]) VALUES (200, CAST(0xB2360B00 AS Date), CAST(0xB9360B00 AS Date), 68, 85.5000)
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Pet] FOREIGN KEY([PetID])
REFERENCES [dbo].[Pet] ([PetID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Pet]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Staff]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_State] FOREIGN KEY([State])
REFERENCES [dbo].[State] ([State])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_State]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_Pet_Customer]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_State] FOREIGN KEY([State])
REFERENCES [dbo].[State] ([State])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_State]
GO
ALTER TABLE [dbo].[Stay]  WITH CHECK ADD  CONSTRAINT [FK_Stay_Pet] FOREIGN KEY([PetID])
REFERENCES [dbo].[Pet] ([PetID])
GO
ALTER TABLE [dbo].[Stay] CHECK CONSTRAINT [FK_Stay_Pet]
GO
USE [master]
GO
ALTER DATABASE [TickedOffDB] SET  READ_WRITE 
GO
