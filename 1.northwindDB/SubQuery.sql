
-- en pahalı ürünüm hangisidir

select top 1* from Products

order by UnitPrice desc


select * from Products 
where UnitPrice=(select max(UnitPrice) from Products)

select * from Products
where UnitPrice>(select avg(UnitPrice) from Products)


select productname, (select CategoryName from Categories
			where CategoryID=Products.CategoryID) categoryname, unitprice from Products



select top 1 FirstName, len(FirstName), (select top 1 FirstName, LEN(FirstName) from Employees order by 2 desc)
from Employees
order by 2  
