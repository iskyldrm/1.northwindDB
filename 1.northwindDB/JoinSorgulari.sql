--1: calısanların yıllara göre satış dağılımı nedir ? firsthnaemm,lastename,count(*)
Select e.FirstName ,e.LAstName ,year(o.OrderDate) Yil, Count(o.OrderID) SatisAdedi 
from Orders o
inner join Employees e on o.EmployeeId=e.EmployeeId
Group by e.FirstName ,e.LAstName ,year(o.OrderDate)
Order by e.FirstName ,Yil 


--2: müşlterilerimin 1997 1. çeyrekte verdiği sipariş sayısı


select c.CompanyName,count(o.OrderID) as siparissayisi
from Customers c
inner join Orders o on o.CustomerID=c.CustomerID
where year(o.OrderDate) = 1997
and MONTH(o.OrderDate) between 1 and 3 
group by c.CompanyName

--3kargo firmalarının tısıdğı siparş sayisi nedir ? 

--4: ürünlerin 1997 yılındaki satış adetleri ve ciroları nedir ?

select orders.OrderID, orders.OrderDate, count([Order Details].UnitPrice) as adet 
from Orders,[Order Details], Products
where Orders.OrderID = [Order Details].OrderID and year(OrderDate)=1997
group by orders.OrderID, orders.OrderDate


--FURKAN ÇÖZÜM OLMADI

Select Products.ProductName,Sum([Order Details].Quantity) as 'Total Quantity',[Order Details].UnitPrice,Sum(([Order Details].UnitPrice*[Order Details].Quantity)) as 'Income' from Products
inner join [Order Details] on [Order Details].ProductID=Products.ProductID
inner join Orders on Orders.OrderID=[Order Details].OrderID
Where Year(Orders.OrderDate)=1997
group by  Products.ProductName,[Order Details].UnitPrice

--KADİR ÇÖZÜMMLERİ OLMADI

Select Products.ProductName,Sum([Order Details].Quantity) as 'Total Quantity',[Order Details].UnitPrice,([Order Details].UnitPrice*[Order Details].Quantity) as 'Income' from Products
inner join [Order Details] on [Order Details].ProductID=Products.ProductID
inner join Orders on Orders.OrderID=[Order Details].OrderID
Where Year(Orders.OrderDate)=1997
group by  Products.ProductName,[Order Details].Quantity,([Order Details].UnitPrice*[Order Details].Quantity),[Order Details].UnitPrice

Select p.ProductName,count(o.OrderID) SiparişSayisi, sum(od.UnitPrice) Cirolar
from Orders o, Products p, [Order Details] od
where o.OrderID=od.OrderID and
      od.ProductID=p.ProductID and
      year(OrderDate)=1997 
Group by p.ProductName 


--OSMAN ÇÖZÜMÜ OLMADI

Select a.CustomerID,SUM(o.UnitPrice) Ciro 
from [Order Details] o 
inner join Orders a on a.OrderID=o.OrderID
where year(a.OrderDate) = 1997
Group By  a.CustomerID
ORder By 2 desc


--BERKAY ÇÖZÜMÜ

Select od.ProductID,
       count(od.Quantity) SatısAdedi,
	   sum(od.UnitPrice*od.Quantity) Ciro
	   from Orders o
	   inner join [Order Details] od on od.OrderID = o.OrderID
	   where year(o.OrderDate)=1997
	   Group by od.ProductID
	   Order by 1


--HOCANIN ÇÖZÜMÜ


select top 4 * from Orders
select top 4 * from [Order Details]
select top 4 * from Products

select p.ProductName,
sum(od.Quantity) adet,
sum(od.Quantity*od.UnitPrice) ciro
from Products p
inner join [Order Details] od on od.ProductID = p.ProductID
inner join Orders o on o.OrderID = od.OrderID

where year(o.OrderDate) = 1997
group by p.ProductName
order by ciro desc

--3kargo firmalarının tısıdğı siparş sayisi nedir ?


select s.CompanyName, count(o.ShipVia) adet from Orders o , Shippers s
where o.ShipVia = s.ShipperID
group by s.CompanyName


--JOİN SORGULARI
/*
İNNER JOİN KULLANIMI
*/

	select * from Shippers
	--update Shippers set CompanyName = 'Aras Kargo' where ShipperID=8

	select distinct s.CompanyName,count(o.OrderID) 
	from Orders o
	right join Shippers s on s.ShipperID=o.ShipVia
	--where year(OrderDate) = 1996
	group by s.CompanyName


	select * from Categories
	select * 
	from Products
	full outer join Categories c on c.CategoryID = Products.ProductID


	---HAVİNG KULLANIMI 

	--group by dan soonra kullanırlır



	Select od.ProductID,
       count(od.Quantity) SatısAdedi,
	   sum(od.UnitPrice*od.Quantity) Ciro
	   from Orders o
	   inner join [Order Details] od on od.OrderID = o.OrderID
	   where year(o.OrderDate)=1997
	   Group by od.ProductID
	   having count(Products.ProductID) <5

	   --HAVİNG SORUSU
	   -- 97 yılındaki ürün satışlarının aylara göre dağılımı

	   select month(OrderDate),count(od.Quantity) as adet  
	   from Orders o, [Order Details] od 
	   where year(OrderDate) = 1997
	   group by  month(OrderDate)
	   
	   
	   select p.ProductName,
	   sum(od.Quantity) adet,
	   --1. ciro yöntemi sum(od.Quantity*od.UnitPrice) - ((od.Quantity*od.UnitPrice)*od.Discount)
	   --2. c,ro yöntemi
	   sum(od.UnitPrice*(1-od.Discount)*od.Quantity) ciro
	   from Products p
	   inner join [Order Details] od on od.ProductID = p.ProductID
	   inner join orders o on o.OrderID = od.OrderID
	   where year(o.OrderDate) = 1997
	   group by p.ProductName
	   having  sum(od.UnitPrice*(1-od.Discount)*od.Quantity)<10000
	   order by ciro desc



	   --SELECT CASE WHEN KULLANIMI

	   select FirstName,LastName, 
	   case country 
	   when 'USA' THEN 'Amerika' 
	   when 'UK' THEN 'iNGİLİTERE' 
	   END

	   from Employees


	   --SUBQUERY => İÇ İÇE SORGU YADA ALT SORGU

	   select * from Products
	   where UnitPrice = (select max(UnitPrice) from Products)

	   --ortalama fiyatın altında kalan urunler hanigleridir

	   -- ürünler tablosunda hiç satışı yapılmayan ürün var mı 

	   -- hiç sipariş almayan persoellerin listesi

	   --ortalama fiyatın altında kalan urunler hanigleridir
	   select * from Products 
	   where UnitPrice < (select avg(UnitPrice) from Products)

	   -- ürünler tablosunda hiç satışı yapılmayan ürün var mı 
	   select * from Products
	   where ProductID not in(select ProductID from [Order Details])

	    -- hiç sipariş almayan persoellerin listesi

		select * from Employees e
		where  not exists (select EmployeeID from Orders where orders.EmployeeID=e.EmployeeID)


-- Değişken tanımlamaları
--stored procedure
--trigger,wiews,functioon


	   











