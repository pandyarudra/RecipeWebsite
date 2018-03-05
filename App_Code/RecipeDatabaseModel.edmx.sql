
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/05/2018 15:13:17
-- Generated from EDMX file: C:\Users\Rudra Pandya\Desktop\Website\App_Code\RecipeDatabaseModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [RecipeDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ingredient]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ingredient];
GO
IF OBJECT_ID(N'[dbo].[Member]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Member];
GO
IF OBJECT_ID(N'[dbo].[recipe]', 'U') IS NOT NULL
    DROP TABLE [dbo].[recipe];
GO
IF OBJECT_ID(N'[dbo].[recipe_ingredients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[recipe_ingredients];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ingredients'
CREATE TABLE [dbo].[ingredients] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(255)  NULL,
    [MemberId] int  NULL
);
GO

-- Creating table 'recipes'
CREATE TABLE [dbo].[recipes] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(255)  NULL,
    [submitted_by] varchar(100)  NULL,
    [category] varchar(255)  NULL,
    [cooking_time] varchar(100)  NULL,
    [servings] varchar(255)  NULL,
    [Description] varchar(255)  NULL,
    [MemberId] int  NULL
);
GO

-- Creating table 'recipe_ingredients'
CREATE TABLE [dbo].[recipe_ingredients] (
    [id] int IDENTITY(1,1) NOT NULL,
    [recipe_id] int  NULL,
    [ingredient_id] int  NULL,
    [unit] varchar(100)  NULL,
    [quantity] int  NULL,
    [MemberId] int  NULL,
    [name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [MemberId] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(500)  NOT NULL,
    [Password] nvarchar(1000)  NULL,
    [IsActive] bit  NULL,
    [CreatedOn] datetime  NULL,
    [UpdatedOn] datetime  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'ingredients'
ALTER TABLE [dbo].[ingredients]
ADD CONSTRAINT [PK_ingredients]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'recipes'
ALTER TABLE [dbo].[recipes]
ADD CONSTRAINT [PK_recipes]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'recipe_ingredients'
ALTER TABLE [dbo].[recipe_ingredients]
ADD CONSTRAINT [PK_recipe_ingredients]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [MemberId] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([MemberId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------