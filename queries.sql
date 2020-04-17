-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryName FROM Product AS P
JOIN Category AS C
ON P.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT S.CompanyName, OD.OrderId, O.OrderDate FROM Shipper AS S
JOIN [Order] AS O
ON O.ShipVia = S.Id
JOIN OrderDetail AS OD
ON O.Id = OD.OrderId
WHERE OrderDate < "2012-08-09"
GROUP BY OD.OrderId;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT P.ProductName, OD.Quantity FROM Product AS P
JOIN OrderDetail AS OD
on P.Id = OD.ProductId
JOIN [Order] AS O
ON O.Id = OD.OrderId
WHERE O.ID = 10251
ORDER BY P.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT O.Id, C.CompanyName, E.LastName FROM [Order] AS O
JOIN Customer AS C
ON O.CustomerId = C.Id
JOIN Employee AS E
ON O.EmployeeId = E.Id