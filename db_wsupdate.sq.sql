USE [master]
GO
/****** Object:  Database [db_wsupdate]    Script Date: 24/03/2024 10:32:00 ******/
CREATE DATABASE [db_wsupdate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_wsupdate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_wsupdate.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_wsupdate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_wsupdate_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_wsupdate] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_wsupdate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_wsupdate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_wsupdate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_wsupdate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_wsupdate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_wsupdate] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_wsupdate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_wsupdate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_wsupdate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_wsupdate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_wsupdate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_wsupdate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_wsupdate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_wsupdate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_wsupdate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_wsupdate] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_wsupdate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_wsupdate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_wsupdate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_wsupdate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_wsupdate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_wsupdate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_wsupdate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_wsupdate] SET RECOVERY FULL 
GO
ALTER DATABASE [db_wsupdate] SET  MULTI_USER 
GO
ALTER DATABASE [db_wsupdate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_wsupdate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_wsupdate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_wsupdate] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_wsupdate] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_wsupdate] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_wsupdate', N'ON'
GO
ALTER DATABASE [db_wsupdate] SET QUERY_STORE = OFF
GO
USE [db_wsupdate]
GO
/****** Object:  User [user_demo]    Script Date: 24/03/2024 10:32:00 ******/
CREATE USER [user_demo] FOR LOGIN [user_demo] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user_demo]
GO
/****** Object:  Table [dbo].[tbl_userstatus]    Script Date: 24/03/2024 10:32:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_userstatus](
	[id] [int] NOT NULL,
	[username] [varchar](50) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tbl_userstatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_userstatus] ([id], [username], [status]) VALUES (1, N'ntuser', 1)
INSERT [dbo].[tbl_userstatus] ([id], [username], [status]) VALUES (2, N'admin', 1)
GO
/****** Object:  StoredProcedure [dbo].[sp_updatestatus]    Script Date: 24/03/2024 10:32:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_updatestatus]
AS BEGIN
DECLARE @processcount INT;
SET @processcount= (SELECT COUNT(*) FROM tbl_userstatus WHERE status=0)
UPDATE tbl_userstatus SET status=1  WHERE status=0
SELECT @processcount AS response
END
GO
USE [master]
GO
ALTER DATABASE [db_wsupdate] SET  READ_WRITE 
GO
