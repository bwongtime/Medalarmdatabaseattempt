
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 01/13/2013 18:11:06
-- Generated from EDMX file: C:\Users\Imidazole.IMZEUS\Dropbox\CAPSTONE\MvcApplication2\MvcApplication2\Models\SeanData.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [xiao198_capstone2012];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__alarm_inf__binar__0DAF0CB0]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[alarm_info] DROP CONSTRAINT [FK__alarm_inf__binar__0DAF0CB0];
GO
IF OBJECT_ID(N'[dbo].[FK__user_anno__alarm__117F9D94]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[user_annotation] DROP CONSTRAINT [FK__user_anno__alarm__117F9D94];
GO
IF OBJECT_ID(N'[dbo].[FK__user_anno__user___108B795B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[user_annotation] DROP CONSTRAINT [FK__user_anno__user___108B795B];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[alarm_info]', 'U') IS NOT NULL
    DROP TABLE [dbo].[alarm_info];
GO
IF OBJECT_ID(N'[dbo].[binary_file]', 'U') IS NOT NULL
    DROP TABLE [dbo].[binary_file];
GO
IF OBJECT_ID(N'[dbo].[score]', 'U') IS NOT NULL
    DROP TABLE [dbo].[score];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[user_annotation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[user_annotation];
GO
IF OBJECT_ID(N'[dbo].[user_info]', 'U') IS NOT NULL
    DROP TABLE [dbo].[user_info];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'alarm_info'
CREATE TABLE [dbo].[alarm_info] (
    [alarm_id] varchar(255)  NOT NULL,
    [binary_file_id] varchar(255)  NOT NULL,
    [alarm_startime] varchar(255)  NOT NULL,
    [alarm_level] varchar(255)  NOT NULL,
    [alarm_parcode] varchar(255)  NOT NULL,
    [alarm_name] varchar(255)  NOT NULL,
    [alarm_message] varchar(255)  NOT NULL,
    [alarm_duration] varchar(255)  NOT NULL,
    [user_names] varchar(255)  NULL,
    [is_predetermined] int  NULL,
    [predetermined_result] varchar(255)  NULL
);
GO

-- Creating table 'binary_file'
CREATE TABLE [dbo].[binary_file] (
    [binary_file_id] varchar(255)  NOT NULL,
    [binary_file_address] varchar(255)  NOT NULL,
    [binary_file_startime] datetime  NOT NULL
);
GO

-- Creating table 'scores'
CREATE TABLE [dbo].[scores] (
    [alarm_id] varchar(255)  NOT NULL,
    [num_annotations] int  NULL,
    [annotation_ids] varchar(255)  NULL,
    [ground_truth] varchar(1)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'user_annotation'
CREATE TABLE [dbo].[user_annotation] (
    [annotation_id] varchar(255)  NOT NULL,
    [user_id] varchar(255)  NOT NULL,
    [alarm_id] varchar(255)  NOT NULL,
    [annotation_result] varchar(255)  NULL,
    [annotation_time] datetime  NULL
);
GO

-- Creating table 'user_info'
CREATE TABLE [dbo].[user_info] (
    [user_id] varchar(255)  NOT NULL,
    [user_name] varchar(255)  NOT NULL,
    [user_password] varchar(255)  NOT NULL,
    [num_annotation] int  NULL,
    [last_annotation_time] datetime  NULL,
    [user_email] varchar(255)  NULL,
    [user_annotation_level] varchar(255)  NULL,
    [user_firstname] varchar(255)  NOT NULL,
    [user_lastname] varchar(255)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [alarm_id] in table 'alarm_info'
ALTER TABLE [dbo].[alarm_info]
ADD CONSTRAINT [PK_alarm_info]
    PRIMARY KEY CLUSTERED ([alarm_id] ASC);
GO

-- Creating primary key on [binary_file_id] in table 'binary_file'
ALTER TABLE [dbo].[binary_file]
ADD CONSTRAINT [PK_binary_file]
    PRIMARY KEY CLUSTERED ([binary_file_id] ASC);
GO

-- Creating primary key on [alarm_id] in table 'scores'
ALTER TABLE [dbo].[scores]
ADD CONSTRAINT [PK_scores]
    PRIMARY KEY CLUSTERED ([alarm_id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [annotation_id] in table 'user_annotation'
ALTER TABLE [dbo].[user_annotation]
ADD CONSTRAINT [PK_user_annotation]
    PRIMARY KEY CLUSTERED ([annotation_id] ASC);
GO

-- Creating primary key on [user_id] in table 'user_info'
ALTER TABLE [dbo].[user_info]
ADD CONSTRAINT [PK_user_info]
    PRIMARY KEY CLUSTERED ([user_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [binary_file_id] in table 'alarm_info'
ALTER TABLE [dbo].[alarm_info]
ADD CONSTRAINT [FK__alarm_inf__binar__0DAF0CB0]
    FOREIGN KEY ([binary_file_id])
    REFERENCES [dbo].[binary_file]
        ([binary_file_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__alarm_inf__binar__0DAF0CB0'
CREATE INDEX [IX_FK__alarm_inf__binar__0DAF0CB0]
ON [dbo].[alarm_info]
    ([binary_file_id]);
GO

-- Creating foreign key on [alarm_id] in table 'user_annotation'
ALTER TABLE [dbo].[user_annotation]
ADD CONSTRAINT [FK__user_anno__alarm__117F9D94]
    FOREIGN KEY ([alarm_id])
    REFERENCES [dbo].[alarm_info]
        ([alarm_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__user_anno__alarm__117F9D94'
CREATE INDEX [IX_FK__user_anno__alarm__117F9D94]
ON [dbo].[user_annotation]
    ([alarm_id]);
GO

-- Creating foreign key on [user_id] in table 'user_annotation'
ALTER TABLE [dbo].[user_annotation]
ADD CONSTRAINT [FK__user_anno__user___108B795B]
    FOREIGN KEY ([user_id])
    REFERENCES [dbo].[user_info]
        ([user_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__user_anno__user___108B795B'
CREATE INDEX [IX_FK__user_anno__user___108B795B]
ON [dbo].[user_annotation]
    ([user_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------