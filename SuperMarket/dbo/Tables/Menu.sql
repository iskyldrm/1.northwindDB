CREATE TABLE [dbo].[Menu] (
    [Id]    INT          IDENTITY (1, 1) NOT NULL,
    [Menu]  VARCHAR (50) NULL,
    [Fiyat] MONEY        NULL,
    [Tarih] DATETIME     CONSTRAINT [DF_Menu_Tarih] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED ([Id] ASC)
);

