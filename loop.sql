DECLARE
    TYPE CHARS IS VARRAY(10) OF App_.app_name%TYPE;
    
    App_name CHARS;
    App_category CHARS;
    App_genre CHARS;
    Size_ CHARS;
    Last_updated CHARS;
    Current_ver CHARS;
BEGIN
    App_name := CHARS('Apk Installer', 'Bubble', 'DB Browser', 'Satellite AR', 'EU VAT Checker', 'Aviary Stickers: Free Pack', 'IF YOU TO EU PEGO', 'Cl-app!', 'Car Race by Fun Games For Free', 'Grenada Co-operative Bank');
    App_category := CHARS('TOOLS', 'GAME', 'GAME', 'TOOLS', 'TOOLS', 'GAME', 'FAMILY', 'GAME', 'TOOLS', 'GAME');
    App_genre := CHARS('Medical', 'Action', 'Card', 'Card', 'Medical', 'Action', 'Puzzle', 'Action', 'Medical', 'Action');
    Size_ := CHARS('19M', '14M', '8.7M', '2.8M', '5.6M', '19M', '29M', '33M', '3.1M', '28M');
    Last_updated := CHARS('January 7, 2019', 'January 15, 2018', 'August 1, 2019', 'June 20, 2018', 'March 26, 2017', 'April 26, 2018', 'June 14, 2019', 'September 20, 2017', 'July 3, 2019', 'October 27, 2017');
    Current_ver := CHARS('1.0.0', '2.0.0', '1.2.4', '1.1', '1.0', '1.1', '6.1.61.1', '2.9.2', '2.8', '1.0.4');
    FOR i IN 1 .. App_name.count
    LOOP
        INSERT INTO App_ (app_name, app_category, app_genre, size_, last_updated, current_ver) VALUES (App_name(i), App_category(i), App_genre(i), Size_(i), Last_updated(i), Current_ver(i));
        COMMIT;
    END LOOP;
END;