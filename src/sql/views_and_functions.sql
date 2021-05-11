--   __      _______ ________          _______
--   \ \    / /_   _|  ____\ \        / / ____|
--    \ \  / /  | | | |__   \ \  /\  / / (___
--     \ \/ /   | | |  __|   \ \/  \/ / \___ \
--      \  /   _| |_| |____   \  /\  /  ____) |
--       \/   |_____|______|   \/  \/  |_____/
--
--
CREATE OR REPLACE VIEW vue_dvd AS
SELECT id_dvd,titre,description,date_parution,prix,quantite,realisateur,editeur,duree,nom_genre
FROM DVD NATURAL JOIN GENRE;

CREATE OR REPLACE VIEW vue_cd AS
SELECT id_cd,titre,description,date_parution,prix,quantite,compositeur,duree,nom_genre
FROM CD NATURAL JOIN GENRE;

CREATE OR REPLACE VIEW vue_livre AS
SELECT id_livre,titre,description,date_parution,prix,quantite,auteur,nb_page,nom_genre
FROM LIVRE NATURAL JOIN GENRE;

CREATE OR REPLACE VIEW vue_all_abonne AS
SELECT *
FROM PERSONNE
WHERE statut = 'abonne';

CREATE OR REPLACE VIEW vue_all_employe AS
SELECT *
FROM PERSONNE
WHERE statut = 'employe';

CREATE OR REPLACE VIEW vue_all_gestionnaire AS
SELECT *
FROM PERSONNE
WHERE statut = 'gestionnaire';













--    ______ _    _ _   _  _____ _______ _____ ____  _   _       __  _____  _____   ____   _____ ______ _____  _    _ _____  ______
--   |  ____| |  | | \ | |/ ____|__   __|_   _/ __ \| \ | |     / / |  __ \|  __ \ / __ \ / ____|  ____|  __ \| |  | |  __ \|  ____|
--   | |__  | |  | |  \| | |       | |    | || |  | |  \| |    / /  | |__) | |__) | |  | | |    | |__  | |  | | |  | | |__) | |__
--   |  __| | |  | | . ` | |       | |    | || |  | | . ` |   / /   |  ___/|  _  /| |  | | |    |  __| | |  | | |  | |  _  /|  __|
--   | |    | |__| | |\  | |____   | |   _| || |__| | |\  |  / /    | |    | | \ \| |__| | |____| |____| |__| | |__| | | \ \| |____
--   |_|     \____/|_| \_|\_____|  |_|  |_____\____/|_| \_| /_/     |_|    |_|  \_\\____/ \_____|______|_____/ \____/|_|  \_\______|
--
--

DELIMITER // -- delimeter needs to be putted for PHPmyAdmin to understand that we're treating with a procedure

DROP PROCEDURE IF EXISTS view_all_emprunt //

CREATE PROCEDURE view_all_emprunt( id INT )
BEGIN
SELECT * FROM EMPRUNT
WHERE id_personne= id
;
END
//

DELIMITER ;












--    _______ _____  _____ _____  _____ ______ _____
--   |__   __|  __ \|_   _/ ____|/ ____|  ____|  __ \
--      | |  | |__) | | || |  __| |  __| |__  | |__) |
--      | |  |  _  /  | || | |_ | | |_ |  __| |  _  /
--      | |  | | \ \ _| || |__| | |__| | |____| | \ \
--      |_|  |_|  \_\_____\_____|\_____|______|_|  \_\
--
--

CREATE OR REPLACE TRIGGER add_produit_from_livre
AFTER INSERT ON LIVRE
FOR EACH ROW
  INSERT INTO PRODUIT (id_dvd,id_cd,id_livre) VALUES
  (null,null,NEW.id_livre);

CREATE OR REPLACE TRIGGER add_produit_from_cd
AFTER INSERT ON CD
FOR EACH ROW
INSERT INTO PRODUIT (id_dvd,id_cd,id_livre) VALUES
(null,NEW.id_cd,null);

CREATE OR REPLACE TRIGGER add_produit_from_dvd
AFTER INSERT ON DVD
FOR EACH ROW
INSERT INTO PRODUIT (id_dvd,id_cd,id_livre) VALUES
(NEW.id_dvd,null,null);
