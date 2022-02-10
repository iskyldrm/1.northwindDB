CREATE TABLE [dbo].[AdisyonDetay] (
    [AdisyonId] INT     NOT NULL,
    [MenuId]    INT     NOT NULL,
    [Adet]      TINYINT NULL,
    [Fiyat]     MONEY   NULL,
    CONSTRAINT [PK_AdisyonDetay_1] PRIMARY KEY CLUSTERED ([AdisyonId] ASC, [MenuId] ASC),
    CONSTRAINT [FK_AdisyonDetay_Adisyon1] FOREIGN KEY ([AdisyonId]) REFERENCES [dbo].[Adisyon] ([id])
);

