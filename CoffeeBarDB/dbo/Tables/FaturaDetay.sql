CREATE TABLE [dbo].[FaturaDetay] (
    [faturaID] INT   NOT NULL,
    [urunid]   INT   NOT NULL,
    [adet]     INT   NULL,
    [fiyat]    MONEY NULL,
    CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED ([faturaID] ASC, [urunid] ASC)
);


GO
CREATE TRIGGER [UpdateUrunler]
	ON [dbo].[FaturaDetay]
	FOR  INSERT
	AS
	BEGIN
	--SQL serverda gelen yeni insert kayıtlarını yeni sanal bir tabloda tutar.bu tablodnun adi inserted dır.
	--deleted işlenminde ise deleted sanal tablosunda tutar.
	--update iişleminde verinin önceki hali deleted tablosunda tutulurker yenş hali inserted tablosunda tutulur.

	declare @faturaID int, @urunıd int, @adet int, @fiyat money
	declare @faturaTipi tinyint


	select @faturaID=i.faturaID
			,@urunıd =i.urunid
			,@adet = i.adet
			,@fiyat = i.fiyat

	from inserted as i

	--fatura tablosundaki fatauratipi alışmıdır yada satışmıdır demek

	--ilgili kaydın fatura tipine ulaşıyoruz

	select @faturaTipi=fm.faturaTipi  from FaturaMaster fm
	where fm.Id = @faturaID


	if(@faturaTipi = 1) -- alış fatruası ise urunler tablosunu arttır

	begin
	
		update Urunler set StokAdedi=StokAdedi+@adet where Id = @urunıd
	
	end

	else

	Begin

		declare @stokadedi float

		select @stokadedi =Urunler.StokAdedi from Urunler where Id=@urunıd

		if(@adet<@stokadedi) -- satilmaya calısılan urun adedi miktarında büyükse
		UPDATE	 Urunler SET StokAdedi=StokAdedi-@adet WHERE Id =@urunıd
	end

END