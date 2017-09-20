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


-- How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
