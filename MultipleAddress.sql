select
p.FirstName,
p.LastName,
count(a.AddressID) as Count
FROM Person.Person as p
JOIN Person.BusinessEntity as be
ON(be.BusinessEntityID=p.BusinessEntityID)
JOIN Person.BusinessEntityAddress as bea
ON(bea.BusinessEntityID=p.BusinessEntityID)
JOIN Person.Address as a
ON(a.AddressID=bea.AddressID)
GROUP BY bea.BusinessEntityID, p.FirstName, p.LastName
HAVING count(bea.AddressTypeID) > 1
order by p.FirstName asc