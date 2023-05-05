-- Get total number of bookings made for each payment method --
DELIMITER #
CREATE PROCEDURE getTotalBookingsByPaymentMethod()
BEGIN
	SELECT DISTINCT payment_method AS "Payment Method", 
					COUNT(id) AS "Total number of bookings"
	FROM books B
	GROUP BY mode
	ORDER BY mode;
END #
DELIMITER ;
