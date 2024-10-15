CREATE TABLE merged_yelp_data_A3 AS
SELECT
	b.business_id, b.city, b.state, b.stars AS business_stars, 
	b.review_count AS business_review_count, b.is_open, b.categories,
	b.BusinessAcceptsCreditCards, b.RestaurantsPriceRange2 AS restaurant_price_level, b.BikeParking,
	b.garage AS parking_garage, b.street AS parking_street, b.validated AS validated_parking, b.lot AS lot_parking, b.valet AS valet_parking,
	r.review_id, r.stars AS review_stars, r.useful AS review_useful, r.funny AS review_funny, r.cool AS review_cool,
	u.user_id, u.name AS user_name, u.review_count AS user_review_count, u.average_stars AS user_average_stars,
	t.compliment_count AS tip_compliment_count, c.Review_count AS checkin_review_count
FROM Yelp_Business_New b
LEFT JOIN Yelp_Review r ON b.business_id = r.business_id
LEFT JOIN Yelp_Users u ON r.user_id = u.user_id
LEFT JOIN Yelp_Tips t ON b.business_id = t.business_id AND u.user_id = t.user_id
LEFT JOIN Yelp_CheckIns c ON b.business_id = c.business_id;
 