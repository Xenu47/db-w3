CREATE TABLE app_ (
    app_name       VARCHAR2(255 CHAR) NOT NULL,
    app_category   VARCHAR2(64 CHAR) NOT NULL,
    app_genre      VARCHAR2(255 CHAR) NOT NULL,
    size_          VARCHAR2(20 CHAR) NOT NULL,
    last_updated   VARCHAR2(50 CHAR) NOT NULL,
    current_ver    VARCHAR2(30 CHAR) NOT NULL
);

ALTER TABLE app_ ADD CONSTRAINT app_pk PRIMARY KEY ( app_name );

CREATE TABLE category (
    app_category VARCHAR2(64 CHAR) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( app_category );

CREATE TABLE genre (
    app_genre VARCHAR2(255 CHAR) NOT NULL
);

ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY ( app_genre );

CREATE TABLE pricing (
    app_app_name   VARCHAR2(255 CHAR) NOT NULL,
    pricing_type   VARCHAR2(4 CHAR) NOT NULL,
    price          VARCHAR2(10 CHAR) NOT NULL
);

ALTER TABLE pricing ADD CONSTRAINT pricing_pk PRIMARY KEY ( app_app_name );

CREATE TABLE type_ (
    pricing_type VARCHAR2(4 CHAR) NOT NULL
);

ALTER TABLE type_ ADD CONSTRAINT type_pk PRIMARY KEY ( pricing_type );

ALTER TABLE app_
    ADD CONSTRAINT app__category_fk FOREIGN KEY ( app_category )
        REFERENCES category ( app_category );

ALTER TABLE app_
    ADD CONSTRAINT app__genre_fk FOREIGN KEY ( app_genre )
        REFERENCES genre ( app_genre );

ALTER TABLE pricing
    ADD CONSTRAINT pricing_app_fk FOREIGN KEY ( app_app_name )
        REFERENCES app_ ( app_name );

ALTER TABLE pricing
    ADD CONSTRAINT pricing_type__fk FOREIGN KEY ( pricing_type )
        REFERENCES type_ ( pricing_type );