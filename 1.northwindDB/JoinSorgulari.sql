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