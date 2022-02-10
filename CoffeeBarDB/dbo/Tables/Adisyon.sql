CREATE TABLE [dbo].[Adisyon] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [personel]      VARCHAR (11) NULL,
    [AcilisTarihi]  DATETIME     CONSTRAINT [DF_Adisyon_AcilisTarihi] DEFAULT (getdate()) NULL,
    [KapanisTarihi] DATETIME     NULL,
    [MasaId]        INT          NULL,
    CONSTRAINT [PK_Adisyon] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Adisyon_Masalar] FOREIGN KEY ([MasaId]) REFERENCES [dbo].[Masalar] ([Id]),
    CONSTRAINT [FK_Adisyon_Users] FOREIGN KEY ([personel]) REFERENCES [dbo].[Users] ([Tcno])
);

