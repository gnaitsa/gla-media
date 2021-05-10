CREATE DATABASE gla_database;

CREATE TABLE PERSONNE(
   id_personne INT AUTO_INCREMENT,
   prenom VARCHAR(64),
   nom VARCHAR(64),
   numero VARCHAR(16),
   adresse VARCHAR(256),
   mail VARCHAR(256),
   birthdate DATE,
   password VARCHAR(64),
   statut VARCHAR(64), -- what's the status of the user (abonne/employe/gestionnaire)
   locked BOOLEAN, -- is the account locked or not
   dateFinAbo DATE,
   PRIMARY KEY(id_personne)
);

CREATE TABLE GENRE(
   id_genre INT AUTO_INCREMENT,
   nom_genre VARCHAR(64),
   PRIMARY KEY(id_genre)
);

CREATE TABLE CD(
   id_cd INT AUTO_INCREMENT ,
   titre VARCHAR(256),
   description VARCHAR(2048),
   date_parution DATE,
   prix DECIMAL(6,2),
   quantite INT,
   compositeur VARCHAR(256),
   duree INT,
   id_genre INT NOT NULL,
   PRIMARY KEY(id_cd),
   FOREIGN KEY(id_genre) REFERENCES GENRE(id_genre)
);

CREATE TABLE DVD(
   id_dvd INT AUTO_INCREMENT ,
   titre VARCHAR(256),
   description VARCHAR(2048),
   date_parution DATE,
   prix DECIMAL(6,2),
   quantite INT,
   realisateur VARCHAR(256),
   editeur VARCHAR(256),
   duree INT,
   id_genre INT NOT NULL,
   PRIMARY KEY(id_dvd),
   FOREIGN KEY(id_genre) REFERENCES GENRE(id_genre)
);

CREATE TABLE LIVRE(
   id_livre INT AUTO_INCREMENT ,
   titre VARCHAR(256),
   description VARCHAR(2048),
   date_parution DATE,
   prix DECIMAL(6,4),
   quantite INT,
   auteur VARCHAR(256),
   editeur VARCHAR(256),
   nb_page INT,
   id_genre INT NOT NULL,
   PRIMARY KEY(id_livre),
   FOREIGN KEY(id_genre) REFERENCES GENRE(id_genre)
);

CREATE TABLE PRODUIT(
   id_produit INT NOT NULL AUTO_INCREMENT,
   id_dvd INT,
   id_cd INT,
   id_livre INT,
   PRIMARY KEY(id_produit),
   FOREIGN KEY(id_dvd) REFERENCES DVD(id_dvd),
   FOREIGN KEY(id_cd) REFERENCES CD(id_cd),
   FOREIGN KEY(id_livre) REFERENCES LIVRE(id_livre)
);

CREATE TABLE EMPRUNT(
   id_emprunt INT AUTO_INCREMENT,
   dateDebut DATE,
   dateRetour DATE,
   prolongeable BOOLEAN,
   recupere BOOLEAN,
   id_produit INT NOT NULL,
   id_personne INT NOT NULL,
   PRIMARY KEY(id_emprunt),
   FOREIGN KEY(id_produit) REFERENCES PRODUIT(id_produit),
   FOREIGN KEY(id_personne) REFERENCES PERSONNE(id_personne)
);
