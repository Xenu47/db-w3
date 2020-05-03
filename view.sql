CREATE VIEW APP_INFO AS
    SELECT
        App_.app_name,
        app_category,
        app_genre,
        size_,
        last_updated,
        current_ver,
        Pricing.pricing_type,
        Pricing.price
    FROM
        App_
        INNER JOIN Pricing ON App_.app_name = Pricing.app_name;