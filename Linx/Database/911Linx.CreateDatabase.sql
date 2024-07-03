USE [master]
GO

CREATE DATABASE [911Linx]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SC911CRDW', FILENAME = N'E:\MSSQL\DATA\911Linx.mdf' , SIZE = 3958080KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [Index] 
( NAME = N'INDEX', FILENAME = N'E:\MSSQL\DATA\LinxIndex.ndf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SC911CRDW_log', FILENAME = N'E:\MSSQL\DATA\911Linx_log.ldf' , SIZE = 34283776KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [911Linx].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [911Linx] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [911Linx] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [911Linx] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [911Linx] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [911Linx] SET ARITHABORT OFF 
GO

ALTER DATABASE [911Linx] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [911Linx] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [911Linx] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [911Linx] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [911Linx] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [911Linx] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [911Linx] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [911Linx] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [911Linx] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [911Linx] SET  DISABLE_BROKER 
GO

ALTER DATABASE [911Linx] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [911Linx] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [911Linx] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [911Linx] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [911Linx] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [911Linx] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [911Linx] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [911Linx] SET RECOVERY FULL 
GO

ALTER DATABASE [911Linx] SET  MULTI_USER 
GO

ALTER DATABASE [911Linx] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [911Linx] SET DB_CHAINING OFF 
GO

ALTER DATABASE [911Linx] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [911Linx] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [911Linx] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [911Linx] SET QUERY_STORE = OFF
GO

ALTER DATABASE [911Linx] SET  READ_WRITE 
GO


