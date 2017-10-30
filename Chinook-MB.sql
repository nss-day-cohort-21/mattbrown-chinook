SELECT FirstName, LastName, CustomerId, Country 
FROM Customer 
WHERE Country != 'USA'

SELECT FirstName, LastName, CustomerId, Country 
FROM Customer 
WHERE Country = 'Brazil'

SELECT FirstName, LastName, InvoiceId, Invoice.InvoiceDate, Country 
FROM Customer  
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId 
WHERE Customer.Country = 'Brazil'

SELECT * 
FROM employee 
WHERE title = 'Sales Support Agent'

SELECT DISTINCT BillingCountry FROM Invoice

SELECT Employee.FirstName, Employee.LastName, Invoice.InvoiceId, Invoice.Total 
FROM Employee 
JOIN Customer ON Customer.SupportRepId = Employee.EmployeeId  
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId

SELECT Invoice.Total, Customer.FirstName, Customer.LastName, Customer.Country, Employee.FirstName, Employee.LastName 
FROM Invoice 
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId 
JOIN Employee ON  Customer.SupportRepId = Employee.EmployeeId

SELECT count (InvoiceDate) 
FROM Invoice 
WHERE Invoice.InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31'

SELECT sum(CASE WHEN InvoiceDate LIKE '2009%' THEN Total END ) AS '2009', sum(CASE WHEN InvoiceDate LIKE '2010%' THEN Total  END ) AS '2010', sum(CASE WHEN InvoiceDate LIKE '2011%' THEN Total  END) AS '2011' 
FROM Invoice

SELECT count (InvoiceId) 
FROM InvoiceLine 
WHERE InvoiceId = 37

SELECT count (InvoiceId) 
FROM InvoiceLine 
GROUP BY InvoiceId

SELECT Name 
FROM Track 
JOIN InvoiceLine 
WHERE InvoiceLine.TrackId = Track.TrackId

SELECT Artist.Name, Track.Name 
FROM InvoiceLine 
JOIN Track, Album, Artist 
WHERE InvoiceLine.TrackId = Track.TrackId 
AND Track.AlbumId = Album.AlbumId 
AND Album.ArtistId = Artist. ArtistId

SELECT BillingCountry, count (InvoiceId) 
FROM Invoice 
GROUP BY Invoice.BillingCountry

SELECT Name, count (PlaylistTrack.PlaylistId) 
FROM Playlist 
JOIN PlaylistTrack 
WHERE Playlist.PlaylistId = PlaylistTrack.PlaylistId 
GROUP BY Playlist.Name

SELECT Track.Name AS Track_Name, MediaType.Name AS Type, Genre.Name AS Genre, Album.Title AS Album_Title 
FROM Track  
JOIN Genre, Album, MediaType 
WHERE Track.MediaTypeId = MediaType.MediaTypeId 
AND Track.GenreId = Genre.GenreId 
AND Track.AlbumId = Album.AlbumId

SELECT Invoice.*,  count(Invoice.InvoiceId) AS 'Invoice Items' 
FROM Invoice 
JOIN InvoiceLine 
WHERE Invoice.InvoiceId = InvoiceLine.InvoiceId 
GROUP BY Invoice.InvoiceId

SELECT Employee.FirstName, round(sum(Invoice.Total), 2) AS 'Total Sales' 
FROM Employee 
JOIN Customer, Invoice 
WHERE Customer.SupportRepId = Employee.EmployeeId  
AND Employee.Title = 'Sales Support Agent' 
AND Customer.CustomerId = Invoice.CustomerId 
AND Customer.SupportRepId = Employee.EmployeeId 
GROUP BY Employee.FirstName

SELECT Employee.FirstName, round(sum(Invoice.Total), 2) AS 'Total Sales' 
FROM Employee 
JOIN Customer, Invoice 
WHERE Customer.SupportRepId = Employee.EmployeeId  
AND Employee.Title = 'Sales Support Agent' 
AND Customer.CustomerId = Invoice.CustomerId 
AND Customer.SupportRepId = Employee.EmployeeId 
AND Invoice.InvoiceDate LIKE '2009%' 
GROUP BY Employee.FirstName 
ORDER BY (round(sum(Invoice.Total), 2))  DESC LIMIT 1

SELECT Employee.FirstName, round(sum(Invoice.Total), 2) AS 'Total Sales' 
FROM Employee 
JOIN Customer, Invoice 
WHERE Customer.SupportRepId = Employee.EmployeeId  
AND Employee.Title = 'Sales Support Agent' AND Customer.CustomerId = Invoice.CustomerId 
AND Customer.SupportRepId = Employee.EmployeeId  
GROUP BY Employee.FirstName 
ORDER BY 'Total Sales'  DESC LIMIT 1

SELECT Employee.FirstName, count (CustomerId) 
FROM Customer 
JOIN Employee 
WHERE Employee.EmployeeId = Customer.SupportRepId 
GROUP BY Employee.FirstName

SELECT Customer.Country, round(sum(Invoice.Total), 2) AS 'Total Sales' 
FROM Invoice 
JOIN Customer 
WHERE Customer.Country = Invoice.BillingCountry 
GROUP BY Customer.Country

SELECT Customer.Country, round(sum(Invoice.Total), 2) AS 'Total Sales' 
FROM Invoice 
JOIN Customer 
WHERE Customer.Country = Invoice.BillingCountry 
GROUP BY Customer.Country 
ORDER BY round(sum(Invoice.Total), 2) DESC LIMIT 1

SELECT Track.Name, count(InvoiceLine.InvoiceId) AS 'count' 
FROM InvoiceLine 
JOIN Track, Invoice 
WHERE InvoiceLine.InvoiceId = Invoice.InvoiceId 
AND Invoice.InvoiceDate LIKE '2013%' 
AND InvoiceLine.TrackId = Track.TrackId  
GROUP BY Track.name 
ORDER BY count DESC LIMIT 9

SELECT Track.Name, count(InvoiceLine.InvoiceId) AS 'count' 
FROM InvoiceLine 
JOIN Track, Invoice 
WHERE InvoiceLine.InvoiceId = Invoice.InvoiceId  
AND InvoiceLine.TrackId = Track.TrackId  
GROUP BY Track.name 
ORDER BY count DESC LIMIT 5

SELECT Track.Name, count(InvoiceLine.InvoiceId) AS 'count' 
FROM InvoiceLine 
JOIN Track, Invoice, Album, Artist 
WHERE InvoiceLine.InvoiceId = Invoice.InvoiceId  
AND InvoiceLine.TrackId = Track.TrackId 
AND Track.AlbumId = Album.AlbumId 
AND Album.ArtistId = Artist.ArtistId  
GROUP BY Artist.Name 
ORDER BY count DESC LIMIT 3

SELECT MediaType.Name, count(MediaType.Name) AS 'count' 
FROM MediaType 
JOIN Track, InvoiceLine 
WHERE InvoiceLine.TrackId = Track.TrackId 
AND Track.MediaTypeId = MediaType.MediaTypeId  
GROUP BY MediaType.Name 
ORDER BY count DESC LIMIT 1
