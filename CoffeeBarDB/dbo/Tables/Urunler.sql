CREATE TABLE [dbo].[Urunler] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [UrunAdi]    VARCHAR (50)  NULL,
    [Aciklama]   VARCHAR (500) NULL,
    [Fiyat]      MONEY         NULL,
    [StokAdedi]  FLOAT (53)    NULL,
    [BirimId]    INT           NULL,
    [KategoriId] INT           NULL,
    [VergiId]    INT           NULL,
    [StopTipi]   SMALLINT      NULL,
    CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Urunler_Birimler] FOREIGN KEY ([BirimId]) REFERENCES [dbo].[Birimler] ([id]),
    CONSTRAINT [FK_Urunler_Kategoriler] FOREIGN KEY ([KategoriId]) REFERENCES [dbo].[Kategoriler] ([Id]),
    CONSTRAINT [FK_Urunler_StokTipi] FOREIGN KEY ([StopTipi]) REFERENCES [dbo].[StokTipi] ([id]),
    CONSTRAINT [FK_Urunler_Vergi] FOREIGN KEY ([VergiId]) REFERENCES [dbo].[Vergi] ([id])
);

