CREATE TABLE [dbo].[Users] (
    [Tcno]        VARCHAR (11) NOT NULL,
    [Password]    VARCHAR (50) NOT NULL,
    [Adi]         VARCHAR (50) NULL,
    [Soyadi]      VARCHAR (50) NULL,
    [Cinsiyet]    CHAR (1)     NULL,
    [DogumTarihi] DATETIME     NULL,
    [email]       VARCHAR (50) NULL,
    [gsm]         VARCHAR (15) NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Tcno] ASC)
);

