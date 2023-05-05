-- Log all the insertions and updates in OFFER table --

use UrbanCompany_DB;
DELIMITER #
CREATE TRIGGER after_insert_PAYMENT
AFTER INSERT ON PAYMENT
FOR EACH ROW
BEGIN
	UPDATE Offer
	SET Offer.offer_count = Offer.offer_count-1
    where Offer.id = new.offer_id;
END #
DELIMITER ;



