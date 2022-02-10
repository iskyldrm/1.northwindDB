CREATE TABLE [dbo].[Vergi] (
    [id]   INT          IDENTITY (1, 1) NOT NULL,
    [Ad]   VARCHAR (50) NULL,
    [Oran] TINYINT      NULL,
    CONSTRAINT [PK_Vergi] PRIMARY KEY CLUSTERED ([id] ASC)
);

