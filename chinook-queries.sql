-- Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT FirstName, LastName, Country, CustomerId FROM Customer WHERE Country != 'USA'

-- Provide a query only showing the Customers from Brazil.
SELECT FirstName, LastName, Country, CustomerId FROM customer WHERE Country = 'Brazil'

-- Provide a query showing the Invoices of customers who are from Brazil.
-- The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM customer c, invoice i
WHERE i.BillingCountry = 'Brazil'
AND i.customerId = c.customerId

-- Provide a query showing only the Employees who are Sales Agents.
SELECT FirstName, LastName, Title FROM Employee WHERE Title LIKE '%Agent%'

-- Provide a query showing a unique list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry FROM Invoice

-- Provide a query that shows the invoices associated with each sales agent.
--  The resultant table should include the Sales Agent's full name.
SELECT DISTINCT e.FirstName, e.LastName, c.customerId, i.invoiceId
FROM Employee e, Customer c, Invoice i WHERE e.EmployeeId = c.SupportRepId AND c.customerId = i.customerId
ORDER BY i.invoiceId

-- Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices
--  and customers.
SELECT DISTINCT e.FirstName, e.LastName, i.InvoiceId, c.FirstName, c.LastName, i.Total, i.BillingCountry
FROM Employee e, Customer c, Invoice i WHERE e.EmployeeId = c.SupportRepId AND c.customerId = i.customerId
ORDER BY i.InvoiceId

-- How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
SELECT COUNT(strftime('%Y',InvoiceDate))as 'Total Invoices', SUM(total)as 'Total Sales' FROM Invoice
WHERE strftime('%Y',InvoiceDate)= '2009' OR strftime('%Y',InvoiceDate)= '2011' GROUP BY strftime('%Y',InvoiceDate)

-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

SELECT COUNT(InvoiceId)AS 'Line Items' FROM InvoiceLine WHERE InvoiceId = 37

-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.
-- HINT: GROUP BY

SELECT InvoiceId,COUNT(InvoiceId)as 'Line Items' FROM InvoiceLine GROUP BY InvoiceId

-- Provide a query that includes the track name with each invoice line item.
SELECT i.InvoiceId, i.TrackId, t.Name as "Song Title" FROM InvoiceLine i, Track t WHERE i.trackId = t.trackId


-- Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT i.InvoiceId, i.TrackId, t.Name, ar.Name as "Song Title" FROM InvoiceLine i, Track t,Album a, Artist ar
WHERE i.trackId =t.trackId AND t.AlbumId= a.AlbumId AND a.artistId = ar.artistId

-- Provide a query that shows the # of invoices per country. HINT: GROUP BY
SELECT BillingCountry, COUNT(InvoiceId)as 'Number of Invoices' FROM Invoice GROUP BY BillingCountry

-- Provide a query that shows the total number of tracks in each playlist.
-- The Playlist name should be included on the resultant table.
SELECT pt.TrackId, COUNT(pt.trackId)
as 'Number of Tracks', p.Name
as 'Playlist Name' FROM track t, playlisttrack pt, playlist p
WHERE t.trackId= pt.trackId AND pt.playlistId = p.playlistId
GROUP BY pt.trackId

-- Provide a query that shows all the Tracks, but displays no IDs.
-- The resultant table should include the Album name, Media type and Genre.

SELECT t.name as 'Track Name', a.title as 'Album Title', m.name
as 'Media Type', g.name as'Genre' FROM Track t, Album a, MediaType m, Genre g
WHERE t.albumId = a.albumId
AND t.MediaTypeId = m.MediaTypeId
AND t.GenreId= g.GenreId

-- Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT i.invoiceId, COUNT(li.invoiceId) AS 'Line Items'
FROM Invoice i, InvoiceLine li
WHERE i.invoiceid= li.InvoiceId
GROUP By i.invoiceId

-- Provide a query that shows total sales made by each sales agent.
SELECT e.FirstName, e.LastName, SUM(i.Total)as 'TOTAL SALES'
FROM Employee e, Customer c, Invoice i
WHERE e.EmployeeId = c.SupportRepId
AND c.customerId = i.customerId
GROUP BY e.FirstName

-- Which sales agent made the most in sales in 2009?
SELECT e.FirstName, e.LastName, SUM(i.Total)as 'TOTAL SALES in 2009'
FROM Employee e, Customer c, Invoice i
WHERE e.EmployeeId = c.SupportRepId
AND c.customerId = i.customerId
AND strftime('%Y', InvoiceDate)= '2009'
GROUP BY e.LastName

-- Which sales agent made the most in sales in 2010?

SELECT e.FirstName, e.LastName, SUM(i.Total)as 'TOTAL SALES in 2009'
FROM Employee e, Customer c, Invoice i
WHERE e.EmployeeId = c.SupportRepId
AND c.customerId = i.customerId
AND strftime('%Y', InvoiceDate)= '2010'
GROUP BY e.LastName

-- Which sales agent made the most in sales over all?
SELECT e.FirstName, e.LastName, SUM(i.Total)as 'TOTAL SALES in 2009'
FROM Employee e, Customer c, Invoice i
WHERE e.EmployeeId = c.SupportRepId
AND c.customerId = i.customerId
GROUP BY e.LastName

-- Provide a query that shows the # of customers assigned to each sales agent.


-- Provide a query that shows the total sales per country. Which country's customers spent the most?


-- Provide a query that shows the most purchased track of 2013.


-- Provide a query that shows the top 5 most purchased tracks over all.


-- Provide a query that shows the top 3 best selling artists.


-- Provide a query that shows the most purchased Media Type.


-- Provide a query that shows the number tracks purchased in all invoices that contain more than one genre.
SELECT InvoiceLine.InvoiceId, COUNT(DISTINCT Genre.GenreId), COUNT(InvoiceLine.InvoiceLineId)
FROM track, Genre, InvoiceLine Where Track.GenreId=
GROUP BY InvoiceLine.InvoiceId
-- having Count