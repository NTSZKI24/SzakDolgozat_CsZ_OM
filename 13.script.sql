USE [master]
GO
/****** Object:  Database [Szakdolgozat]    Script Date: 2025. 04. 13. 11:47:08 ******/
CREATE DATABASE [Szakdolgozat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Szakdolgozat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Szakdolgozat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Szakdolgozat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Szakdolgozat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Szakdolgozat] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Szakdolgozat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Szakdolgozat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Szakdolgozat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Szakdolgozat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Szakdolgozat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Szakdolgozat] SET ARITHABORT OFF 
GO
ALTER DATABASE [Szakdolgozat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Szakdolgozat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Szakdolgozat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Szakdolgozat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Szakdolgozat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Szakdolgozat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Szakdolgozat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Szakdolgozat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Szakdolgozat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Szakdolgozat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Szakdolgozat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Szakdolgozat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Szakdolgozat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Szakdolgozat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Szakdolgozat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Szakdolgozat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Szakdolgozat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Szakdolgozat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Szakdolgozat] SET  MULTI_USER 
GO
ALTER DATABASE [Szakdolgozat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Szakdolgozat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Szakdolgozat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Szakdolgozat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Szakdolgozat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Szakdolgozat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Szakdolgozat', N'ON'
GO
ALTER DATABASE [Szakdolgozat] SET QUERY_STORE = ON
GO
ALTER DATABASE [Szakdolgozat] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Szakdolgozat]
GO
/****** Object:  Table [dbo].[MunkaFolyamatok]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MunkaFolyamatok](
	[ID] [uniqueidentifier] NOT NULL,
	[MunkaID] [uniqueidentifier] NOT NULL,
	[Folyamat] [varchar](max) NOT NULL,
	[Koltseg] [bigint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Osszkoltseg_View]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Osszkoltseg_View]
AS
SELECT        SUM(Koltseg) AS Osszkoltseg, MunkaID
FROM            dbo.MunkaFolyamatok
GROUP BY MunkaID
GO
/****** Object:  Table [dbo].[Felhasznalok]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Felhasznalok](
	[ID] [uniqueidentifier] NOT NULL,
	[Felhasznalonev] [nvarchar](50) NOT NULL,
	[Nev] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Jelszo] [nvarchar](max) NOT NULL,
	[RoleID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Felhasznalok] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rolek]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rolek](
	[ID] [uniqueidentifier] NOT NULL,
	[RoleNev] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Rolek] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Admin_felhasznalok_View]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Admin_felhasznalok_View]
AS
SELECT TOP (100) PERCENT dbo.Felhasznalok.Felhasznalonev, dbo.Felhasznalok.Nev, dbo.Felhasznalok.Email, dbo.Felhasznalok.Jelszo, dbo.Rolek.RoleNev, dbo.Felhasznalok.ID
FROM     dbo.Felhasznalok LEFT OUTER JOIN
                  dbo.Rolek ON dbo.Felhasznalok.RoleID = dbo.Rolek.ID
GO
/****** Object:  Table [dbo].[Autok]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autok](
	[ID] [uniqueidentifier] NOT NULL,
	[Marka] [nvarchar](50) NOT NULL,
	[Rendszam] [varchar](20) NOT NULL,
	[Tipus] [nvarchar](50) NOT NULL,
	[Uzemanyag] [nvarchar](30) NOT NULL,
	[Motor] [nvarchar](50) NOT NULL,
	[AlvazSzam] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Autok] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutoTulajok]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoTulajok](
	[ID] [uniqueidentifier] NOT NULL,
	[Telefonszam] [varchar](20) NOT NULL,
	[Nev] [nvarchar](50) NOT NULL,
	[Leiras] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[AutoID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AutoTulajok] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Admin_tulajok_View]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Admin_tulajok_View]
AS
SELECT        dbo.AutoTulajok.Nev AS AutoTulaj, dbo.AutoTulajok.Telefonszam, dbo.AutoTulajok.Email, dbo.Autok.Marka, dbo.Autok.Rendszam, dbo.Autok.Tipus, dbo.Autok.Uzemanyag, dbo.Autok.Motor, dbo.Autok.AlvazSzam, 
                         dbo.AutoTulajok.Leiras
FROM            dbo.Autok INNER JOIN
                         dbo.AutoTulajok ON dbo.Autok.ID = dbo.AutoTulajok.AutoID
GO
/****** Object:  Table [dbo].[MunkaKapcsolatok]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MunkaKapcsolatok](
	[ID] [uniqueidentifier] NOT NULL,
	[TitkarID] [uniqueidentifier] NOT NULL,
	[SzereloID] [uniqueidentifier] NOT NULL,
	[MunkaID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MunkaKapcsolatok] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Munkalapok]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Munkalapok](
	[ID] [uniqueidentifier] NOT NULL,
	[AutoTulajID] [uniqueidentifier] NOT NULL,
	[AutoID] [uniqueidentifier] NOT NULL,
	[Statusz] [int] NULL,
	[MunkaKezdete] [datetime] NULL,
	[MunkaIdo] [int] NULL,
	[Keltezes] [datetime] NULL,
	[Befejezhetetlen] [bit] NULL,
 CONSTRAINT [PK_Munkalapok] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Admin_munkalapok_View]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Admin_munkalapok_View]
AS
SELECT        dbo.AutoTulajok.Nev AS TulajNev, Szerelo.Felhasznalonev AS SzereloNev, Titkar.Felhasznalonev AS TitkarNev, dbo.Autok.Rendszam, dbo.Autok.Tipus, dbo.Autok.Marka, dbo.Autok.Uzemanyag, dbo.Autok.Motor, 
                         dbo.Autok.AlvazSzam, COALESCE (dbo.Osszkoltseg_View.Osszkoltseg, 0) AS Osszkoltseg, dbo.Munkalapok.MunkaKezdete, dbo.Munkalapok.MunkaIdo, dbo.Munkalapok.Keltezes, dbo.Munkalapok.Statusz, 
                         dbo.Munkalapok.Befejezhetetlen, dbo.MunkaKapcsolatok.MunkaID AS ID
FROM            dbo.MunkaKapcsolatok LEFT OUTER JOIN
                         dbo.Munkalapok ON dbo.MunkaKapcsolatok.MunkaID = dbo.Munkalapok.ID INNER JOIN
                         dbo.Felhasznalok AS Szerelo ON dbo.MunkaKapcsolatok.SzereloID = Szerelo.ID INNER JOIN
                         dbo.Felhasznalok AS Titkar ON dbo.MunkaKapcsolatok.TitkarID = Titkar.ID INNER JOIN
                         dbo.Autok ON dbo.Munkalapok.AutoID = dbo.Autok.ID INNER JOIN
                         dbo.AutoTulajok ON dbo.Munkalapok.AutoTulajID = dbo.AutoTulajok.ID AND dbo.Autok.ID = dbo.AutoTulajok.AutoID LEFT OUTER JOIN
                         dbo.Osszkoltseg_View ON dbo.Munkalapok.ID = dbo.Osszkoltseg_View.MunkaID
GO
/****** Object:  View [dbo].[Titkar_Munkalapok_View]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Titkar_Munkalapok_View]
AS
SELECT        Szerelo.Felhasznalonev AS SzereloNev, dbo.AutoTulajok.Nev AS TulajNev, dbo.AutoTulajok.Telefonszam, dbo.AutoTulajok.Email, dbo.Munkalapok.Statusz, dbo.Autok.AlvazSzam, dbo.Autok.Rendszam, dbo.Autok.Marka, 
                         dbo.Munkalapok.MunkaKezdete, dbo.Munkalapok.MunkaIdo, dbo.Munkalapok.Keltezes, COALESCE (dbo.Osszkoltseg_View.Osszkoltseg, 0) AS Osszkoltseg, Titkar.Felhasznalonev AS TitkarNev
FROM            dbo.MunkaKapcsolatok LEFT OUTER JOIN
                         dbo.Munkalapok ON dbo.MunkaKapcsolatok.MunkaID = dbo.Munkalapok.ID INNER JOIN
                         dbo.Felhasznalok AS Szerelo ON dbo.MunkaKapcsolatok.SzereloID = Szerelo.ID INNER JOIN
                         dbo.Felhasznalok AS Titkar ON dbo.MunkaKapcsolatok.TitkarID = Titkar.ID INNER JOIN
                         dbo.Autok ON dbo.Munkalapok.AutoID = dbo.Autok.ID INNER JOIN
                         dbo.AutoTulajok ON dbo.Munkalapok.AutoTulajID = dbo.AutoTulajok.ID AND dbo.Autok.ID = dbo.AutoTulajok.AutoID LEFT OUTER JOIN
                         dbo.Osszkoltseg_View ON dbo.Munkalapok.ID = dbo.Osszkoltseg_View.MunkaID
WHERE        (dbo.Munkalapok.Befejezhetetlen = 0)
GO
/****** Object:  View [dbo].[Szerelo_Munka_View]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Szerelo_Munka_View]
AS
SELECT        Szerelo.Felhasznalonev AS SzereloNev, dbo.AutoTulajok.Nev AS TulajNev, dbo.AutoTulajok.Telefonszam, dbo.AutoTulajok.Email, dbo.Munkalapok.Statusz, dbo.Autok.AlvazSzam, dbo.Autok.Rendszam, dbo.Autok.Marka, 
                         dbo.Munkalapok.MunkaKezdete, dbo.Munkalapok.MunkaIdo, dbo.Munkalapok.Keltezes, COALESCE (dbo.Osszkoltseg_View.Osszkoltseg, 0) AS Osszkoltseg, Titkar.Felhasznalonev AS TitkarNev, dbo.AutoTulajok.Leiras, 
                         dbo.Munkalapok.ID
FROM            dbo.MunkaKapcsolatok LEFT OUTER JOIN
                         dbo.Munkalapok ON dbo.MunkaKapcsolatok.MunkaID = dbo.Munkalapok.ID INNER JOIN
                         dbo.Felhasznalok AS Szerelo ON dbo.MunkaKapcsolatok.SzereloID = Szerelo.ID INNER JOIN
                         dbo.Felhasznalok AS Titkar ON dbo.MunkaKapcsolatok.TitkarID = Titkar.ID INNER JOIN
                         dbo.Autok ON dbo.Munkalapok.AutoID = dbo.Autok.ID INNER JOIN
                         dbo.AutoTulajok ON dbo.Munkalapok.AutoTulajID = dbo.AutoTulajok.ID AND dbo.Autok.ID = dbo.AutoTulajok.AutoID LEFT OUTER JOIN
                         dbo.Osszkoltseg_View ON dbo.Munkalapok.ID = dbo.Osszkoltseg_View.MunkaID
WHERE        (dbo.Munkalapok.Befejezhetetlen = 0)
GO
/****** Object:  View [dbo].[Titkar_SzereloDropDown_View]    Script Date: 2025. 04. 13. 11:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Titkar_SzereloDropDown_View]
AS
SELECT dbo.Felhasznalok.Nev AS SzereloNev, dbo.Felhasznalok.Nev AS TitkarNev, dbo.Munkalapok.Statusz, dbo.Rolek.RoleNev
FROM     dbo.Munkalapok INNER JOIN
                  dbo.MunkaKapcsolatok ON dbo.Munkalapok.ID = dbo.MunkaKapcsolatok.MunkaID INNER JOIN
                  dbo.Felhasznalok ON dbo.MunkaKapcsolatok.SzereloID = dbo.Felhasznalok.ID AND dbo.MunkaKapcsolatok.TitkarID = dbo.Felhasznalok.ID INNER JOIN
                  dbo.Rolek ON dbo.Felhasznalok.RoleID = dbo.Rolek.ID
GO
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'ad9132e0-0f83-4d0a-a5f3-081819c79d1f', N'szerelo11', N'titkos', N'fbi@gmail.com', N'2SqL7oKyO/9amcZwuRxSoMo26cXWza4hrx/WyzfJryvdecPzKboXTNiOxb8kKyQN$LDXUBZPs3X', N'd0874fe8-5598-4c0b-9857-b10b1814bd77')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'93a8d2b3-94bc-48b0-ad26-102765f9e8f3', N'szerelo12', N'titkos', N'fbi@gmail.com', N'9u4lCoOdhNb4P4cPLc2WB15nu9wjuHCB5TvAXlL1ErqUu0rXgaBhDToy19NV902D$qVwZe7VKHH', N'd0874fe8-5598-4c0b-9857-b10b1814bd77')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'5c680a81-1379-4558-9fca-11eab2046bb9', N'titkar5', N'titkos', N'fbi@gmail.com', N'uh0i/r8j2puKc/wsYubWZ1r8WVhfduV1A3pWT2N28U9cYlUsrjJNk5E6DbFeM4dB$DO81nFEJ4f', N'3049d879-6b75-4e69-94c1-9d23f282d912')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'fd8a096c-7353-4203-a8c5-1a17c75bea91', N'szerelo5', N'titkos', N'fbi@gmail.com', N'9YU8tOYDS/kDPMQbhfGFmFN21qw7h1e3lp+0fW2xC+quH8gQ++WkhZT4MzQuhtML$aqOUpqFFTn', N'd0874fe8-5598-4c0b-9857-b10b1814bd77')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'43e3f579-7d82-4935-b7b7-23c18b2ec4a1', N'szerelo10', N'titkos', N'fbi@gmail.com', N'a9y67Oha5XIwLxu6XuJrJvGBsoTOWql7aYLAHQDWSMyeQrgzC3H0/LGBYap6Qu5M$mEgl5Cu8Bf', N'd0874fe8-5598-4c0b-9857-b10b1814bd77')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'05e3095d-cd9e-49f5-9759-279c26686ce2', N'proba', N'titkos', N'fbi@gmail.com', N'gJC/+BPWDM8dB3Z9+B9lF9jhvMFN3un+CBCTJqwBJBQNG53GYdQ0RaGzYvl51D1O$TuKefI2gzS', N'3049d879-6b75-4e69-94c1-9d23f282d912')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'7ead4ebf-c74e-4a22-bad1-29dff9d77a09', N'titkar12', N'titkos', N'fbi@gmail.com', N'ngUSlHhziPFaqoS0a5RCkSjFU0ZSkpN19l4MLNoHYXyqyjLdNNI0y6FkiQcL2mPN$AJaAsUn0g6', N'3049d879-6b75-4e69-94c1-9d23f282d912')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'105b07eb-51a7-459b-a0bb-4b4052dd38b7', N'admin5', N'titkos', N'ttitkos@gmail.com', N'Kfp9LwUINy1zlIBDFVgWxoSi6X/sWl3bLndwX12FLEv47AL5nz0mKtXAuZ8VWPZn$2AVUjLBohn', N'9df11d9d-c1bf-40a1-9599-e2333e630583')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'6504fc0d-5336-40c0-a543-a064462a1a6c', N'proba11', N'titkossss', N'fssbi@gmail.com', N'2mqY13XATziV6ZnVlzdLj2tiFUX8UBd1V6352L21WjjQK1K1G56UC2BdQXjno4/v$aejV2nE400', N'd0874fe8-5598-4c0b-9857-b10b1814bd77')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'0a5cd424-00fa-4b72-812a-a19e921d4765', N'titkar13', N'titkos', N'fbi@gmail.com', N'm+Aizs5j/RxdE7FhxT985uQjDVRrUyLvA8LtA5QjTU4T1cworu4RsGPFdE9hidl7$QtHIYtODlZ', N'3049d879-6b75-4e69-94c1-9d23f282d912')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'f760024c-8505-4213-a4fa-b8e14e8786d0', N'titkar11', N'titkos', N'fbi@gmail.com', N'rNkLYugjJrjBweKvgZBkeIuI3fqATw9H+IOcyF09Z47mpa0aIwRrCFY8lUNf5tKZ$za5G780mUI', N'3049d879-6b75-4e69-94c1-9d23f282d912')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'5411c992-3a32-432b-b0ca-f098397ece18', N'titkar10', N'titkos', N'fbi@gmail.com', N'VeetYIMOkHnZBE2n+QSIuHruVLqq2mlDBb5vmegskH6Rvrlk1/MRVAh2mhcWsKwc$sAiOUF38Dd', N'3049d879-6b75-4e69-94c1-9d23f282d912')
INSERT [dbo].[Felhasznalok] ([ID], [Felhasznalonev], [Nev], [Email], [Jelszo], [RoleID]) VALUES (N'45c80635-e151-468b-a215-fc2fb088471b', N'szerelo13', N'titkos', N'fbi@gmail.com', N'wp3R7NpZ6XHrl+zYh9zF5OHL0y2M+1Z3PVBi6DvkH0mjPJ989IJzm3ypm9e9f8+u$OTaC7k5NXu', N'd0874fe8-5598-4c0b-9857-b10b1814bd77')
GO
INSERT [dbo].[Rolek] ([ID], [RoleNev]) VALUES (N'3049d879-6b75-4e69-94c1-9d23f282d912', N'Titkar')
INSERT [dbo].[Rolek] ([ID], [RoleNev]) VALUES (N'd0874fe8-5598-4c0b-9857-b10b1814bd77', N'Szerelo')
INSERT [dbo].[Rolek] ([ID], [RoleNev]) VALUES (N'9df11d9d-c1bf-40a1-9599-e2333e630583', N'Admin')
GO
ALTER TABLE [dbo].[AutoTulajok]  WITH CHECK ADD  CONSTRAINT [FK_AutoTulajok_Autok] FOREIGN KEY([AutoID])
REFERENCES [dbo].[Autok] ([ID])
GO
ALTER TABLE [dbo].[AutoTulajok] CHECK CONSTRAINT [FK_AutoTulajok_Autok]
GO
ALTER TABLE [dbo].[Felhasznalok]  WITH CHECK ADD  CONSTRAINT [FK_Felhasznalok_Rolek] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Rolek] ([ID])
GO
ALTER TABLE [dbo].[Felhasznalok] CHECK CONSTRAINT [FK_Felhasznalok_Rolek]
GO
ALTER TABLE [dbo].[MunkaFolyamatok]  WITH CHECK ADD  CONSTRAINT [FK_MunkaFolyamatok_Munkalapok] FOREIGN KEY([MunkaID])
REFERENCES [dbo].[Munkalapok] ([ID])
GO
ALTER TABLE [dbo].[MunkaFolyamatok] CHECK CONSTRAINT [FK_MunkaFolyamatok_Munkalapok]
GO
ALTER TABLE [dbo].[MunkaKapcsolatok]  WITH CHECK ADD  CONSTRAINT [FK_MunkaKapcsolatok_Felhasznalok_Szerelo] FOREIGN KEY([SzereloID])
REFERENCES [dbo].[Felhasznalok] ([ID])
GO
ALTER TABLE [dbo].[MunkaKapcsolatok] CHECK CONSTRAINT [FK_MunkaKapcsolatok_Felhasznalok_Szerelo]
GO
ALTER TABLE [dbo].[MunkaKapcsolatok]  WITH CHECK ADD  CONSTRAINT [FK_MunkaKapcsolatok_Felhasznalok_Titkar] FOREIGN KEY([TitkarID])
REFERENCES [dbo].[Felhasznalok] ([ID])
GO
ALTER TABLE [dbo].[MunkaKapcsolatok] CHECK CONSTRAINT [FK_MunkaKapcsolatok_Felhasznalok_Titkar]
GO
ALTER TABLE [dbo].[MunkaKapcsolatok]  WITH CHECK ADD  CONSTRAINT [FK_MunkaKapcsolatok_Munkalapok] FOREIGN KEY([MunkaID])
REFERENCES [dbo].[Munkalapok] ([ID])
GO
ALTER TABLE [dbo].[MunkaKapcsolatok] CHECK CONSTRAINT [FK_MunkaKapcsolatok_Munkalapok]
GO
ALTER TABLE [dbo].[Munkalapok]  WITH CHECK ADD  CONSTRAINT [FK_Munkalapok_Autok] FOREIGN KEY([AutoID])
REFERENCES [dbo].[Autok] ([ID])
GO
ALTER TABLE [dbo].[Munkalapok] CHECK CONSTRAINT [FK_Munkalapok_Autok]
GO
ALTER TABLE [dbo].[Munkalapok]  WITH CHECK ADD  CONSTRAINT [FK_Munkalapok_AutoTulajok] FOREIGN KEY([AutoTulajID])
REFERENCES [dbo].[AutoTulajok] ([ID])
GO
ALTER TABLE [dbo].[Munkalapok] CHECK CONSTRAINT [FK_Munkalapok_AutoTulajok]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[31] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Felhasznalok"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Rolek"
            Begin Extent = 
               Top = 7
               Left = 291
               Bottom = 126
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Admin_felhasznalok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Admin_felhasznalok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[33] 2[25] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[50] 2[21] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MunkaKapcsolatok"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Munkalapok"
            Begin Extent = 
               Top = 0
               Left = 775
               Bottom = 243
               Right = 969
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Szerelo"
            Begin Extent = 
               Top = 27
               Left = 317
               Bottom = 234
               Right = 512
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Titkar"
            Begin Extent = 
               Top = 6
               Left = 550
               Bottom = 136
               Right = 720
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Autok"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 420
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AutoTulajok"
            Begin Extent = 
               Top = 137
               Left = 535
               Bottom = 383
               Right = 729
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Osszkoltseg_View"
            Begin Extent = 
               Top = 208
               Left = 1012
               Bottom = 305
               Right = 1206
            End
          ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Admin_munkalapok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3675
         Alias = 2430
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Admin_munkalapok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Admin_munkalapok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[31] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Autok"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 249
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AutoTulajok"
            Begin Extent = 
               Top = 0
               Left = 416
               Bottom = 251
               Right = 610
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Admin_tulajok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Admin_tulajok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MunkaFolyamatok"
            Begin Extent = 
               Top = 17
               Left = 88
               Bottom = 191
               Right = 295
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Osszkoltseg_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Osszkoltseg_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[41] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MunkaKapcsolatok"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Munkalapok"
            Begin Extent = 
               Top = 182
               Left = 232
               Bottom = 369
               Right = 402
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Szerelo"
            Begin Extent = 
               Top = 99
               Left = 414
               Bottom = 271
               Right = 584
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Titkar"
            Begin Extent = 
               Top = 6
               Left = 599
               Bottom = 177
               Right = 769
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Autok"
            Begin Extent = 
               Top = 207
               Left = 808
               Bottom = 406
               Right = 978
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AutoTulajok"
            Begin Extent = 
               Top = 89
               Left = 1053
               Bottom = 260
               Right = 1223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Osszkoltseg_View"
            Begin Extent = 
               Top = 235
               Left = 20
               Bottom = 366
               Right = 190
            End
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Szerelo_Munka_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1230
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Szerelo_Munka_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Szerelo_Munka_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[29] 2[36] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -288
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MunkaKapcsolatok"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Munkalapok"
            Begin Extent = 
               Top = 261
               Left = 265
               Bottom = 464
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Szerelo"
            Begin Extent = 
               Top = 80
               Left = 354
               Bottom = 263
               Right = 524
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Titkar"
            Begin Extent = 
               Top = 0
               Left = 535
               Bottom = 185
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Autok"
            Begin Extent = 
               Top = 364
               Left = 551
               Bottom = 494
               Right = 721
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AutoTulajok"
            Begin Extent = 
               Top = 163
               Left = 797
               Bottom = 293
               Right = 967
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Osszkoltseg_View"
            Begin Extent = 
               Top = 155
               Left = 0
               Bottom = 282
               Right = 170
            End
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Titkar_Munkalapok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1785
         Alias = 1110
         Table = 1470
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Titkar_Munkalapok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Titkar_Munkalapok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[48] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Munkalapok"
            Begin Extent = 
               Top = 118
               Left = 355
               Bottom = 303
               Right = 525
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MunkaKapcsolatok"
            Begin Extent = 
               Top = 48
               Left = 610
               Bottom = 178
               Right = 780
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Felhasznalok"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 136
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Rolek"
            Begin Extent = 
               Top = 111
               Left = 1181
               Bottom = 207
               Right = 1351
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1716
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Titkar_SzereloDropDown_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Titkar_SzereloDropDown_View'
GO
USE [master]
GO
ALTER DATABASE [Szakdolgozat] SET  READ_WRITE 
GO
