CREATE TABLE [dbo].[FaturaMaster] (
    [Id]         INT          IDENTITY (1, 1) NOT NULL,
    [Tarih]      DATETIME     NULL,
    [UserID]     VARCHAR (11) NOT NULL,
    [FirmaAdi]   VARCHAR (50) NULL,
    [faturaTipi] TINYINT      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

