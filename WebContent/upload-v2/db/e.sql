IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'uploadSystem')
	DROP DATABASE [uploadSystem]
GO

CREATE DATABASE [uploadSystem]  ON (NAME = N'uploadSystem_Data', FILENAME = N'f:\microsoft sql server\MSSQL\data\uploadSystem_Data.MDF' , SIZE = 1, FILEGROWTH = 10%) LOG ON (NAME = N'uploadSystem_Log', FILENAME = N'f:\microsoft sql server\MSSQL\data\uploadSystem_Log.LDF' , SIZE = 1, FILEGROWTH = 10%)
 COLLATE Chinese_PRC_CI_AS
GO

use [uploadSystem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_PicSmallClass_PicBigClass]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[PicSmallClass] DROP CONSTRAINT FK_PicSmallClass_PicBigClass
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PicBigClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PicBigClass]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PicSmallClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PicSmallClass]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[up_imges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[up_imges]
GO

CREATE TABLE [dbo].[PicBigClass] (
	[PicBClassID] [int] NOT NULL ,
	[PicBClassName] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PicSmallClass] (
	[PicSClassID] [int] IDENTITY (1, 1) NOT NULL ,
	[PicSClassName] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[PicBClassID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[up_imges] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[wid_name] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[path] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[min_path] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[sizes] [int] NOT NULL ,
	[times] [datetime] NOT NULL ,
	[ip] [varchar] (15) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[PicBClassID] [int] NULL ,
	[PicSClassID] [int] NULL 
) ON [PRIMARY]
GO

