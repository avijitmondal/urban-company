-- Get details of the offers provided by various services --
CREATE VIEW getOffersByPaymentMode AS
SELECT distinct Offer.code as "Offer code",
				Offer.discount "Offer Discount"
FROM Offer
INNER JOIN Payment ON Offer.id=Payment.offer_id and Payment.mode='UPI';