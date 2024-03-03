/* select customer and the each order the customer made */
SELECT CustomerID, OrderID 
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID

/* select order id with the employee who handled the order */
SELECT o.OrderID , e.EmployeeID , e.FirstName , e.LastName
FROM Orders o
JOIN Employee e
ON o.EmployeeID= e.EmployeeID

/* select customers who havent placed an order */
SELECT c.CustomerID, c.CustomerName , o.OrderID
FROM Customer c
LEFT JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL ;

/* select orderid together with the name of the products */
SELECT o.OrderID , p.ProductName , p.ProductID
FROM ORDER o
JOIN Order_Details od ON o.OrderID = od.OrderID
JOIN products p ON p.ProductID = od.ProductID

/*select products that no one bought */
SELECT o.OrderID , p.ProductID , p.ProductName
FROM Products p 
LEFT JOIN Order_details od ON p.ProductID = od.ProductID
WHERE Od.OrderID IS NULL

/*select customer with the product that they bought */
SELECT c.CustomerID , c.CustomerName , p.ProductID
FROM Customers c
JOIN orders o  ON  o.OrderID = c.OrderID
JOIN Order_details od ON od.OrderID = o.OrderID
JOIN products p ON od.ProductID = p.ProductID
ORDER BY c.CustomerID, p.ProductName ASC ;

/* select product name and cartegory */
SELECT p.ProductName ,p.ProductID , c.CartegoryName
FROM Products p
JOIN Cartegory c ON p.CartegoryID = c.CartegoryID

/* select the orders together with the shipping company */
SELECT o.OrderID , o.CustomerID , o.EmployeeID , o.OrderDate , shp.ShipperName
FROM Orders o
JOIN Shippers shp 
ON o.ShipperID= shp.ShipperID
ORDER BY o.OrderID ;

/*select customers with id greater than 50 with each order they made */
SELECT c.CustomerID ,c.CustomerName , o.OrderID
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.OrderID
WHERE o.Orderid >50

/*select employees with order id greater than 100 */
SELECT o.OrderID , e.EmployeeID , e.FirstName , e.LastName
FROM Orders o
JOIN Employees e
ON o.EmployeeID = e.EmployeeID
WHERE O.OrderID >100

/* select the most expensive product */
SELECT ProductID ,ProductName , Price
FROM Products 
ORDER BY Price DESC 
LIMIT 1 ;

/* select the second most expensive item */
SELECT ProductID ,ProductName , Price
FROM Products
ORDER BY Price DESC
LIMIT 1 OFFSET 1 ;

/*select the name and price of each product in decreasing order */
SELECT ProductID ,ProductName, Price
FROM Products
ORDER BY Price DESC

/*select the 5 most expensive products */
SELECT ProductID , ProductName , Price
FROM Products
ORDER BY Price 
LIMIT 5

/* Five most expensive without the most expensive one */
SELECT ProductID ,ProductName , Price
FROM Products
ORDER BY Price
LIMIT 4 OFFSET 1

/* select the cheapest product without using limit and offset */
AS (SELECT ProductID ,ProductName,MIN(Price)
FROM products)
SELECT ProductName
FROM temp;

/*select the name of the cheapest products subquery */
SELECT ProductName
FROM Products
WHERE Price IN (SELECT MIN(Price) FROM products)


/* select the number of employees last name starts with D */
SELECT EmployeeID , LastName , FirstName
FROM employees
WHERE LastName LIKE 'D%'


/* select customer name and orders made by the customer  and order in decressing*/
SELECT c.CustomerName ,c.CustomerID , COUNT(*) AS 'TotalOrder'
FROM customers c
JOIN  Orders O
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
ORDER BY 3 DESC , 1 ASC ;

/* add prices of all products */
SELECT SUM(Price)
FROM Products 


/*select orderid with the total price of that order abd tge result of total price in increasing order */

SELECT od.OrderID ,SUM((od.Quantity * p.Price)) AS TotalValueOfOrder
FROM order_details od
JOIN products p ON p.ProductID = od.ProductID
GROUP BY 1
ORDER BY 2 ASC ;
