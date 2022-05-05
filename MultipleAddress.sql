SELECT
	p.FirstName,
	p.LastName,
	COUNT(a.AddressID) AS COUNT
FROM 
	Person.Person AS p
	JOIN Person.BusinessEntity AS be ON(be.BusinessEntityID=p.BusinessEntityID)
	JOIN Person.BusinessEntityAddress AS bea ON(bea.BusinessEntityID=p.BusinessEntityID)
	JOIN Person.Address AS a ON(a.AddressID=bea.AddressID)
GROUP BY 
	p.FirstName, p.LastName
HAVING 
	COUNT(bea.AddressTypeID) > 1
ORDER BY 
	p.FirstName ASC
