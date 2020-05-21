CREATE VIEW APP_INFO AS
    SELECT
        App.app_name,
        app_category,
        app_genre,
        app_size,
        last_updated,
        current_ver,
        Pricing.pricing_type,
        Pricing.price
    FROM
        App
        INNER JOIN Pricing ON App.app_name = Pricing.app_name;