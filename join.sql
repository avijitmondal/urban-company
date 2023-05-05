-- Select all customer id and customer name where booking is after 2019-06-25 00:00:00
SELECT Customer.id, Customer.name
FROM Customer
INNER JOIN Booking ON Customer.id=Booking.customer_id and Booking.service_datetime >= '2019-06-25 00:00:00';

