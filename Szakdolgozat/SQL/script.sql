USE [master]
GO
/****** Object:  Database [Szakdolgozat(Szerelést segítő BlazorApp)]    Script Date: 2025. 02. 24. 17:35:48 ******/
CREATE DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Szakdolgozat(Szerelést segítő BlazorApp)', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Szakdolgozat(Szerelést segítő BlazorApp).mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Szakdolgozat(Szerelést segítő BlazorApp)_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Szakdolgozat(Szerelést segítő BlazorApp)_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Szakdolgozat(Szerelést segítő BlazorApp)].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET ARITHABORT OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET  MULTI_USER 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET QUERY_STORE = ON
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Szakdolgozat(Szerelést segítő BlazorApp)]
GO
/****** Object:  Table [dbo].[Autók]    Script Date: 2025. 02. 24. 17:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autók](
	[ID] [uniqueidentifier] NOT NULL,
	[Márka] [nvarchar](50) NOT NULL,
	[Rendszám] [nvarchar](20) NOT NULL,
	[Tipus] [nvarchar](50) NOT NULL,
	[Üzemanyag] [nvarchar](30) NOT NULL,
	[Motor] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutóTulajok]    Script Date: 2025. 02. 24. 17:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutóTulajok](
	[ID] [uniqueidentifier] NOT NULL,
	[Telefonszám] [nvarchar](20) NOT NULL,
	[Név] [nvarchar](50) NOT NULL,
	[Leírás] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[AutoID] [uniqueidentifier] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Felhasználók]    Script Date: 2025. 02. 24. 17:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Felhasználók](
	[ID] [uniqueidentifier] NOT NULL,
	[Felhasználónév] [nvarchar](50) NOT NULL,
	[Név] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Jelszó] [nvarchar](max) NOT NULL,
	[RoleID] [uniqueidentifier] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MunkaFolyamatok]    Script Date: 2025. 02. 24. 17:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MunkaFolyamatok](
	[ID] [uniqueidentifier] NULL,
	[MunkaID] [uniqueidentifier] NULL,
	[Folyamat] [varchar](max) NULL,
	[Költség] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MunkaKapcsolatok]    Script Date: 2025. 02. 24. 17:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MunkaKapcsolatok](
	[ID] [uniqueidentifier] NOT NULL,
	[TitkárID] [uniqueidentifier] NOT NULL,
	[SzerelőID] [uniqueidentifier] NOT NULL,
	[MunkaID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Munkalapok]    Script Date: 2025. 02. 24. 17:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Munkalapok](
	[ID] [uniqueidentifier] NOT NULL,
	[AutóTulajID] [uniqueidentifier] NOT NULL,
	[AutóID] [uniqueidentifier] NOT NULL,
	[MunkaKezdete] [datetime] NOT NULL,
	[MunkaIdő(óra)] [int] NOT NULL,
	[Keltezés] [datetime] NOT NULL,
	[Összköltség] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rolek]    Script Date: 2025. 02. 24. 17:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rolek](
	[ID] [uniqueidentifier] NOT NULL,
	[RoleNév] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Szakdolgozat(Szerelést segítő BlazorApp)] SET  READ_WRITE 
GO
