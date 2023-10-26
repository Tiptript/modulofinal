{{
    config(
        materializer = "table",
        alias = "spec.grupo_fantastico_client_satisfaction",

    )
}}

SELECT 
    l.id, 
    l.reviews_per_month, 
    l.review_scores_rating, 
    l.review_scores_accuracy, 
    l.review_scores_cleanliness, 
    l.review_scores_checkin, 
    l.review_scores_communication, 
    l.review_scores_location, 
    l.review_scores_value, 
    r.comments
FROM 
    trusted.grupo_fantastico_listing l
JOIN 
    trusted.grupo_fantastico_reviews r ON l.id = r.listing_id;
