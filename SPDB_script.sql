USE [master]
GO
/****** Object:  Database [SPDB]    Script Date: 3/8/2018 3:22:16 PM ******/
CREATE DATABASE [SPDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SPDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SPDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SPDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SPDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SPDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SPDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SPDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SPDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SPDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SPDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SPDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SPDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SPDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SPDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SPDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SPDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SPDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SPDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SPDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SPDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SPDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SPDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SPDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SPDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SPDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SPDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SPDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SPDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SPDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SPDB] SET  MULTI_USER 
GO
ALTER DATABASE [SPDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SPDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SPDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SPDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SPDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SPDB]
GO
/****** Object:  Table [dbo].[Program]    Script Date: 3/8/2018 3:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Program](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
	[University] [int] NOT NULL,
 CONSTRAINT [PK__Program__C5775520F1CE4306] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudyPlan]    Script Date: 3/8/2018 3:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudyPlan](
	[SPID] [int] NOT NULL,
	[ContentDesc] [varchar](255) NULL,
	[Status] [varchar](10) NULL,
	[Program] [int] NULL,
 CONSTRAINT [PK__StudyPla__F43060C94813B083] PRIMARY KEY CLUSTERED 
(
	[SPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__StudyPla__FFF9BDE8F33CA304] UNIQUE NONCLUSTERED 
(
	[Program] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[University]    Script Date: 3/8/2018 3:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[University](
	[UID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[Location] [varchar](50) NULL,
 CONSTRAINT [PK_University] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/8/2018 3:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Program]  WITH CHECK ADD  CONSTRAINT [FK_Program_University] FOREIGN KEY([University])
REFERENCES [dbo].[University] ([UID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_University]
GO
ALTER TABLE [dbo].[StudyPlan]  WITH CHECK ADD  CONSTRAINT [FK__StudyPlan__Fk_Pr__47DBAE45] FOREIGN KEY([Program])
REFERENCES [dbo].[Program] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudyPlan] CHECK CONSTRAINT [FK__StudyPlan__Fk_Pr__47DBAE45]
GO
USE [master]
GO
ALTER DATABASE [SPDB] SET  READ_WRITE 
GO
