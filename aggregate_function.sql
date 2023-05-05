-- select no of bookings after specific date
select count(*) 
from Booking
where service_datetime >= '2019-06-25 00:00:00';