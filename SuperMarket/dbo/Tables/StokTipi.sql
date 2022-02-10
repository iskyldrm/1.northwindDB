CREATE TABLE [dbo].[StokTipi] (
    [id]       SMALLINT     IDENTITY (1, 1) NOT NULL,
    [StokTip]  VARCHAR (50) NULL,
    [Aciklama] VARCHAR (50) NULL,
    CONSTRAINT [PK_StokTipi] PRIMARY KEY CLUSTERED ([id] ASC)
);

