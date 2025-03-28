USE [master]
GO
/****** Object:  Database [Szakdolgozat]    Script Date: 2025. 03. 27. 11:02:23 ******/
CREATE DATABASE [Szakdolgozat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Szakdolgozat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Szakdolgozat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Szakdolgozat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Szakdolgozat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [Szakdolgozat] SET QUERY_STORE = ON
GO
ALTER DATABASE [Szakdolgozat] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Szakdolgozat]
GO
/****** Object:  Table [dbo].[MunkaFolyamatok]    Script Date: 2025. 03. 27. 11:02:24 ******/
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
/****** Object:  View [dbo].[Osszkoltseg_View]    Script Date: 2025. 03. 27. 11:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Osszkoltseg_View]
AS
SELECT SUM(Koltseg) AS Osszkoltseg
FROM     dbo.MunkaFolyamatok
GROUP BY MunkaID
GO
/****** Object:  Table [dbo].[Felhasznalok]    Script Date: 2025. 03. 27. 11:02:25 ******/
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
/****** Object:  Table [dbo].[Rolek]    Script Date: 2025. 03. 27. 11:02:25 ******/
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
/****** Object:  View [dbo].[Admin_felhasznalok_View]    Script Date: 2025. 03. 27. 11:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Admin_felhasznalok_View]
AS
SELECT TOP (100) PERCENT dbo.Felhasznalok.Felhasznalonev, dbo.Felhasznalok.Nev, dbo.Felhasznalok.Email, dbo.Felhasznalok.Jelszo, dbo.Rolek.RoleNev
FROM     dbo.Felhasznalok LEFT OUTER JOIN
                  dbo.Rolek ON dbo.Felhasznalok.RoleID = dbo.Rolek.ID



GO
/****** Object:  Table [dbo].[Autok]    Script Date: 2025. 03. 27. 11:02:25 ******/
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
/****** Object:  Table [dbo].[AutoTulajok]    Script Date: 2025. 03. 27. 11:02:25 ******/
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
/****** Object:  View [dbo].[Admin_tulajok_View]    Script Date: 2025. 03. 27. 11:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Admin_tulajok_View]
AS
SELECT dbo.AutoTulajok.Nev AS AutoTulaj, dbo.AutoTulajok.Telefonszam, dbo.AutoTulajok.Email, dbo.Autok.Marka, dbo.Autok.Rendszam, dbo.Autok.Tipus, dbo.Autok.Uzemanyag, dbo.Autok.Motor, dbo.Autok.AlvazSzam, 
                  dbo.AutoTulajok.Leiras
FROM     dbo.Autok INNER JOIN
                  dbo.AutoTulajok ON dbo.Autok.ID = dbo.AutoTulajok.AutoID



GO
/****** Object:  Table [dbo].[MunkaKapcsolatok]    Script Date: 2025. 03. 27. 11:02:25 ******/
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
/****** Object:  Table [dbo].[Munkalapok]    Script Date: 2025. 03. 27. 11:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Munkalapok](
	[ID] [uniqueidentifier] NOT NULL,
	[AutoTulajID] [uniqueidentifier] NOT NULL,
	[AutoID] [uniqueidentifier] NOT NULL,
	[Statusz] [int] NOT NULL,
	[MunkaKezdete] [datetime] NOT NULL,
	[MunkaIdo] [int] NOT NULL,
	[Keltezes] [datetime] NOT NULL,
 CONSTRAINT [PK_Munkalapok] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Admin_munkalapok_View]    Script Date: 2025. 03. 27. 11:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Admin_munkalapok_View]
AS
SELECT dbo.AutoTulajok.Nev AS TulajNev, dbo.Felhasznalok.Nev AS SzereloNev, dbo.Felhasznalok.Nev AS TitkarNev, dbo.Autok.Rendszam, dbo.Autok.Tipus, dbo.Autok.Marka, dbo.Autok.Uzemanyag, dbo.Autok.Motor, dbo.Autok.AlvazSzam, 
                  dbo.Osszkoltseg_View.Osszkoltseg, dbo.Munkalapok.MunkaKezdete, dbo.Munkalapok.MunkaIdo, dbo.Munkalapok.Keltezes, dbo.Munkalapok.Statusz
FROM     dbo.MunkaKapcsolatok INNER JOIN
                  dbo.Felhasznalok ON dbo.MunkaKapcsolatok.SzereloID = dbo.Felhasznalok.ID AND dbo.MunkaKapcsolatok.TitkarID = dbo.Felhasznalok.ID INNER JOIN
                  dbo.Rolek ON dbo.Felhasznalok.RoleID = dbo.Rolek.ID INNER JOIN
                  dbo.Munkalapok ON dbo.MunkaKapcsolatok.MunkaID = dbo.Munkalapok.ID INNER JOIN
                  dbo.MunkaFolyamatok ON dbo.Munkalapok.ID = dbo.MunkaFolyamatok.MunkaID INNER JOIN
                  dbo.AutoTulajok ON dbo.Munkalapok.AutoTulajID = dbo.AutoTulajok.ID INNER JOIN
                  dbo.Autok ON dbo.Munkalapok.AutoID = dbo.Autok.ID AND dbo.AutoTulajok.AutoID = dbo.Autok.ID CROSS JOIN
                  dbo.Osszkoltseg_View
GO
/****** Object:  View [dbo].[Titkar_Munkalapok_View]    Script Date: 2025. 03. 27. 11:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Titkar_Munkalapok_View]
AS
SELECT dbo.Felhasznalok.Nev AS SzereloNev, dbo.AutoTulajok.Nev AS TulajNev, dbo.AutoTulajok.Telefonszam, dbo.AutoTulajok.Email, dbo.Munkalapok.Statusz, dbo.Autok.AlvazSzam, dbo.Autok.Rendszam, dbo.Autok.Marka, 
                  dbo.Munkalapok.MunkaKezdete, dbo.Munkalapok.MunkaIdo, dbo.Munkalapok.Keltezes, dbo.Osszkoltseg_View.Osszkoltseg, dbo.Felhasznalok.Nev AS TitkarNev
FROM     dbo.MunkaKapcsolatok INNER JOIN
                  dbo.Munkalapok ON dbo.MunkaKapcsolatok.MunkaID = dbo.Munkalapok.ID INNER JOIN
                  dbo.MunkaFolyamatok ON dbo.Munkalapok.ID = dbo.MunkaFolyamatok.MunkaID INNER JOIN
                  dbo.Felhasznalok ON dbo.MunkaKapcsolatok.SzereloID = dbo.Felhasznalok.ID AND dbo.MunkaKapcsolatok.TitkarID = dbo.Felhasznalok.ID INNER JOIN
                  dbo.Rolek ON dbo.Felhasznalok.RoleID = dbo.Rolek.ID INNER JOIN
                  dbo.Autok ON dbo.Munkalapok.AutoID = dbo.Autok.ID INNER JOIN
                  dbo.AutoTulajok ON dbo.Munkalapok.AutoTulajID = dbo.AutoTulajok.ID AND dbo.Autok.ID = dbo.AutoTulajok.AutoID CROSS JOIN
                  dbo.Osszkoltseg_View
GO
/****** Object:  View [dbo].[Szerelo_Munka_View]    Script Date: 2025. 03. 27. 11:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Szerelo_Munka_View]
AS
SELECT dbo.Felhasznalok.Nev AS TitkarNev, dbo.Felhasznalok.Nev AS SzereloNev, dbo.AutoTulajok.Leiras, dbo.Autok.Marka, dbo.Autok.Tipus, dbo.Autok.Uzemanyag, dbo.Autok.Motor, dbo.Autok.AlvazSzam, dbo.Autok.Rendszam, 
                  dbo.Osszkoltseg_View.Osszkoltseg
FROM     dbo.Munkalapok INNER JOIN
                  dbo.MunkaKapcsolatok ON dbo.Munkalapok.ID = dbo.MunkaKapcsolatok.MunkaID INNER JOIN
                  dbo.MunkaFolyamatok ON dbo.Munkalapok.ID = dbo.MunkaFolyamatok.MunkaID INNER JOIN
                  dbo.Felhasznalok ON dbo.MunkaKapcsolatok.SzereloID = dbo.Felhasznalok.ID AND dbo.MunkaKapcsolatok.TitkarID = dbo.Felhasznalok.ID INNER JOIN
                  dbo.AutoTulajok ON dbo.Munkalapok.AutoTulajID = dbo.AutoTulajok.ID INNER JOIN
                  dbo.Autok ON dbo.Munkalapok.AutoID = dbo.Autok.ID AND dbo.AutoTulajok.AutoID = dbo.Autok.ID CROSS JOIN
                  dbo.Osszkoltseg_View
GO
/****** Object:  View [dbo].[Titkar_SzereloDropDown_View]    Script Date: 2025. 03. 27. 11:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Titkar_SzereloDropDown_View]
AS
SELECT        dbo.Felhasznalok.Nev AS SzereloNev, dbo.Felhasznalok.Nev AS TitkarNev, dbo.Munkalapok.Statusz, dbo.Rolek.RoleNev
FROM            dbo.Munkalapok INNER JOIN
                         dbo.MunkaKapcsolatok ON dbo.Munkalapok.ID = dbo.MunkaKapcsolatok.MunkaID INNER JOIN
                         dbo.Felhasznalok ON dbo.MunkaKapcsolatok.SzereloID = dbo.Felhasznalok.ID AND dbo.MunkaKapcsolatok.TitkarID = dbo.Felhasznalok.ID INNER JOIN
                         dbo.Rolek ON dbo.Felhasznalok.RoleID = dbo.Rolek.ID
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
         Configuration = "(H (1[56] 4[18] 2[9] 3) )"
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
         Left = -327
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
         Begin Table = "Felhasznalok"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 238
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Rolek"
            Begin Extent = 
               Top = 7
               Left = 533
               Bottom = 126
               Right = 727
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
         Begin Table = "MunkaFolyamatok"
            Begin Extent = 
               Top = 7
               Left = 1017
               Bottom = 170
               Right = 1211
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
         Begin Table = "Autok"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 420
               Right = 242
            End
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Admin_munkalapok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Osszkoltseg_View"
            Begin Extent = 
               Top = 245
               Left = 777
               Bottom = 342
               Right = 971
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Admin_munkalapok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Admin_munkalapok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[15] 4[46] 2[20] 3) )"
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
               Top = 7
               Left = 48
               Bottom = 181
               Right = 255
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Osszkoltseg_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Osszkoltseg_View'
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
         Begin Table = "Osszkoltseg_View"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 104
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MunkaKapcsolatok"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Munkalapok"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MunkaFolyamatok"
            Begin Extent = 
               Top = 60
               Left = 1318
               Bottom = 223
               Right = 1512
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Felhasznalok"
            Begin Extent = 
               Top = 10
               Left = 1080
               Bottom = 173
               Right = 1275
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AutoTulajok"
            Begin Extent = 
               Top = 175
               Left = 290
               Bottom = 338
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Autok"
            Begin Extent = 
               Top = 252
               Left = 977
               Bottom = 415
               Right = 1171
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Szerelo_Munka_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   End
            DisplayFlags = 280
            TopColumn = 2
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
         Alias = 1224
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
         Configuration = "(H (1[22] 4[50] 2[9] 3) )"
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
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "MunkaFolyamatok"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Felhasznalok"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Rolek"
            Begin Extent = 
               Top = 175
               Left = 291
               Bottom = 294
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Autok"
            Begin Extent = 
               Top = 175
               Left = 533
               Bottom = 338
               Right = 727
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "AutoTulajok"
            Begin Extent = 
               Top = 295
               Left = 287
               Bottom = 458
               Right = 481
            End
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Titkar_Munkalapok_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Osszkoltseg_View"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 440
               Right = 242
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
         Column = 1200
         Alias = 1116
         Table = 1476
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
         Alias = 1710
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Titkar_SzereloDropDown_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Titkar_SzereloDropDown_View'
GO
USE [master]
GO
ALTER DATABASE [Szakdolgozat] SET  READ_WRITE 
GO
