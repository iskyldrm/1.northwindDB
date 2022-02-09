

--view tanımlama
--

create view UrunlereGoreDagilimi2

as

select year(o.OrderDate) yil, p.ProductName,
sum(od.Quantity) adet,
sum(od.Quantity*od.UnitPrice) ciro
from Products p
inner join [Order Details] od on od.ProductID = p.ProductID
inner join Orders o on o.OrderID = od.OrderID
group by year(o.OrderDate), p.ProductName
--order by ciro desc


select * from UrunlereGoreDagilimi2

select len(ProductName) uzunluk, ProductName from UrunlereGoreDagilimi2