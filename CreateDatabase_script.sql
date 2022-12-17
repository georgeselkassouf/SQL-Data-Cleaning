USE [master]
GO

/****** Object:  Database [SQL Data Cleaning]    Script Date: 17/12/2022 10:08:32 ******/
CREATE DATABASE [SQL Data Cleaning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQL Data Cleaning', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SQL Data Cleaning.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SQL Data Cleaning_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SQL Data Cleaning_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQL Data Cleaning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [SQL Data Cleaning] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET ARITHABORT OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [SQL Data Cleaning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [SQL Data Cleaning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET  DISABLE_BROKER 
GO

ALTER DATABASE [SQL Data Cleaning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [SQL Data Cleaning] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET RECOVERY FULL 
GO

ALTER DATABASE [SQL Data Cleaning] SET  MULTI_USER 
GO

ALTER DATABASE [SQL Data Cleaning] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [SQL Data Cleaning] SET DB_CHAINING OFF 
GO

ALTER DATABASE [SQL Data Cleaning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [SQL Data Cleaning] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [SQL Data Cleaning] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [SQL Data Cleaning] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [SQL Data Cleaning] SET QUERY_STORE = OFF
GO

ALTER DATABASE [SQL Data Cleaning] SET  READ_WRITE 
GO

