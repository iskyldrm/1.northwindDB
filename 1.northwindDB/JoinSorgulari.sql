Select e.FirstName ,e.LAstName ,year(o.OrderDate) Yil, Count(o.OrderID) SatisAdedi 
from Orders o
inner join Employees e on o.EmployeeId=e.EmployeeId
Group by e.FirstName ,e.LAstName ,year(o.OrderDate)
Order by e.FirstName ,Yil 