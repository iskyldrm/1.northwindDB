


select * from Shippers

select s.CompanyName, count(p.ProductID) as adet
from Products p
inner join Suppliers s on s.SupplierID = p.SupplierID

group by s.CompanyName


--select * from Suppliers where CompanyName = 'Bigfoot Breweries'

--select * from Products where SupplierID = 16

select * from Customers


--çalışanlarımının 1997 yılındaki satışları

SELECT        Categories.CategoryName, SUM([Order Details].UnitPrice * [Order Details].Quantity) AS Expr1
FROM            [Order Details] INNER JOIN
                         Products ON [Order Details].ProductID = Products.ProductID INNER JOIN
                         Categories ON Products.CategoryID = Categories.CategoryID

						 group by  Categories.CategoryName



--Hangi Ülkede Ne kadar ciro yapmışım

select o.ShipCountry, sum(od.UnitPrice*od.Quantity) ciro  from Orders o, [Order Details] od

where o.OrderID = od.OrderID

group by o.ShipCountry

--Kargo firmalarının taşıma yaptığı ülkeler ve adetleri nelerdir 

select s.CompanyName,o.ShipCountry, count(o.OrderID) adetler from Orders o, Shippers s

where   s.ShipperID = o.ShipVia

group by s.CompanyName, o.ShipCountry
order by s.CompanyName

--Müşterilerin teercih ettiği ürün kategoriler

select c.CompanyName, ct.CategoryName,count(o.OrderID) adet from Customers c
inner join Orders o on c.CustomerID = o.CustomerID
inner join [Order Details] od on od.OrderID = o.OrderID
inner join Products p on p.ProductID = od.ProductID
inner join Categories ct on ct.CategoryID = p.CategoryID
group by ct.CategoryName, c.CompanyName

order by c.CompanyName

--hangi çalışanlar hangi müşlerilere bakmıştır

select (e.FirstName + e.LastName) Calisanlar, c.CompanyName, count(o.OrderID) from Employees e
inner join Orders o on o.EmployeeID = e.EmployeeID
inner join Customers c on c.CustomerID = o.CustomerID

group by (e.FirstName + e.LastName), c.CompanyName

order by Calisanlar

--italyan müşterilerimin en az sipariş verdiği ilk 3 ürün hangiisdir.

select   c.CompanyName, p.ProductName, c.Country, COUNT(o.OrderID) adet, sum(od.Quantity) toplam from Customers c 
inner join Orders o on o.CustomerID = c.CustomerID
inner join [Order Details] od on od.OrderID=o.OrderID
inner join Products p on p.ProductID=od.ProductID

--where c.Country = 'Italy'

group by c.CompanyName, p.ProductName, c.Country
having Country = 'Italy'
order by toplam


--çalışanların en az satış yaptığı ilk 5 şehir

select top 5 o.ShipCity, count(o.OrderID) adet from Employees e

inner join orders o on o.EmployeeID = e.EmployeeID

group by  o.ShipCity

order by adet


select ASCII ('Ğ')

--KAREKTER İNDEKSİNİ BULMA
SELECT CHARINDEX('G','ALİ@GMAİL.COM')


SELECT LEFT('BUGUN GUNLERDEN CUMA',5)
SELECT RIGHT('BUGUN GUNLERDEN CUMA',5)

SELECT LEN('BUGUN GUNLERDEN CUMA')

SELECT LOWER('BUGUN GUNLERDEN CUMA')
SELECT UPPER('bugun gunlerden cuma')


SELECT LTRIM('            BUGUN GUNLERDEN CUMA')
SELECT RTRIM('BUGUN GUNLERDEN CUMA            ')

SELECT RTRIM(LTRIM('             BUGUN GUNLERDEN CUMA             '))

SELECT REPLACE('BİRBİRBİRLERİNE','BIR','UC')


SELECT SUBSTRING('BUGUN GUNLERDEN CUMA',5,7)

SELECT REVERSE('BUGUN GUNLERDEN CUMA')

SELECT CONCAT (FirstName,SPACE(1), LastName)  FROM Employees

SELECT CONVERT(INT, 25,65)

SELECT CEILING(25.6)
SELECT FLOOR(25.6)


