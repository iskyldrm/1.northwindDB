CREATE TABLE [dbo].[Masalar] (
    [Id]      INT          IDENTITY (1, 1) NOT NULL,
    [MasaAdi] VARCHAR (50) NULL,
    [Grup]    VARCHAR (50) NULL,
    CONSTRAINT [PK_Masalar] PRIMARY KEY CLUSTERED ([Id] ASC)
);

