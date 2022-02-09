
/*

Değişken Tanımlamaları

Değişken Tipleri: Sayısal,String,bit,datetime,binary

Sayısal Veri Tipleri: 
tinyint  0-255
,smallint   -32.768 ve 32.768
,int    -2 milyar /+2 milyar
,bigint   -2⁶³ ve 2⁶³


Ondalıklı Sayı Tipleri:

Float: + byte
money: decimal veri tipinin virgülden sonraki 4 basamklı hali
Decimal: Kayan noktalı veri tipidir

Tarih
Small Date:
Datetime: 1753-9999
datetime2:00001-9999
time: zaman tutar
datetimeoffset : ülke ve bölgeye göre zamnab tuatr 

*/



/*

Değiştekn tanımlama: Declare edilen keyword ile yapılabilir. başına @ işareti konulmalıdır

*/


--example:

Declare @sayi int

--Bir kişinin adını soyadını yasını tc nosunu ve parasını tutan değikenleri tanımlaıbız 




--Değikenlerin değerleri görme

--1. yoll select çekmek


select @adi adi,@soyadi soyadi,@yas yas

--2.yol


print @adi + @soyadi

/*

Değişkenelre değer atam iki şekilde olur
1. yöntem select yöntemidir
2. yöntem set komutu kullanılır

Örnek
*/

Declare @adi  varchar(50), @soyadi varchar(50), @tc varchar(11), @yas tinyint

declare @para money

Select @adi ='ali',@soyadi = 'veli',@yas = '30'

select @adi adi,@soyadi soyadi,@yas yas

print @adi + @soyadi

/*

Prosedure olulturmak için creaat komutu kulanılır. Creat komutu
genel anlamda sql server içerisinde oluşturalabilcek objelerden sorumludur

Creat 

*/


ALTER procedure DortIslem
(@sayi1 int,
@sayi2 int)
as
begin
--declare @sonuc float

--set @sonuc = @sayi1/@sayi2

print 'Çarpım :' + CONVERT(VARCHAR(50),(@sayi1*@sayi2))
--print 'Bölme :' + (@sayi1/@sayi2)

--print 'Toplama :' + (@sayi1+@sayi2)

--print 'Çıkarma :' + (@sayi1 - @sayi2)

end


