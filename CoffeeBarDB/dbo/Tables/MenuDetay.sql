CREATE TABLE [dbo].[MenuDetay] (
    [DetayId] INT      IDENTITY (1, 1) NOT NULL,
    [MenuID]  INT      NULL,
    [UrunId]  INT      NULL,
    [Adet]    INT      NULL,
    [Tarih]   DATETIME CONSTRAINT [DF_MenuDetay_Tarih] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_MenuDetay] PRIMARY KEY CLUSTERED ([DetayId] ASC),
    CONSTRAINT [FK_MenuDetay_Menu] FOREIGN KEY ([MenuID]) REFERENCES [dbo].[Menu] ([Id]),
    CONSTRAINT [FK_MenuDetay_Urunler] FOREIGN KEY ([UrunId]) REFERENCES [dbo].[Urunler] ([Id])
);

