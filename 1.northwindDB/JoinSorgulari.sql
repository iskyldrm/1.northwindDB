select Categories.CategoryName,count(Products.ProductID) urunler
from Products,Categories
where  Products.CategoryID=Categories.CategoryID
group by Categories.CategoryName
order by 2 desc
