CREATE TABLE [dbo].[Kategoriler] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [Adi]      VARCHAR (50) NULL,
    [Aciklama] VARCHAR (50) NULL,
    [UstId]    INT          NULL,
    CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Kategoriler_Kategoriler] FOREIGN KEY ([UstId]) REFERENCES [dbo].[Kategoriler] ([Id])
);

