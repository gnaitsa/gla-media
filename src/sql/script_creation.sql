CREATE TABLE PERSONNE(
   id_personne INT,
   nom VARCHAR(64),
   prenom VARCHAR(64),
   numero VARCHAR(10),
   adresse VARCHAR(256),
   mail VARCHAR(256),
   birthdate DATE,
   password VARCHAR(64),
   statut VARCHAR(64),
   dateFinAbo DATE,
   PRIMARY KEY(id_personne)
);

CREATE TABLE GENRE(
   id_genre INT,
   nom_genre VARCHAR(64),
   PRIMARY KEY(id_genre)
);

CREATE TABLE CD(
   id_cd VARCHAR(50),
   titre VARCHAR(256),
   description VARCHAR(2048),
   date_ DATE,
   prix DECIMAL(6,2),
   quantite INT,
   compositeur VARCHAR(256),
   duree INT,
   id_genre INT NOT NULL,
   PRIMARY KEY(id_cd),
   FOREIGN KEY(id_genre) REFERENCES GENRE(id_genre)
);

CREATE TABLE DVD(
   id_dvd VARCHAR(50),
   titre VARCHAR(256),
   description VARCHAR(2048),
   date_ DATE,
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
   id_livre VARCHAR(50),
   titre VARCHAR(256),
   description VARCHAR(2048),
   date_ DATE,
   prix DECIMAL(6,2),
   quantite INT,
   auteur VARCHAR(256),
   editeur VARCHAR(256),
   nb_page INT,
   id_genre INT NOT NULL,
   PRIMARY KEY(id_livre),
   FOREIGN KEY(id_genre) REFERENCES GENRE(id_genre)
);

CREATE TABLE PRODUIT(
   id_produit INT,
   id_dvd VARCHAR(50),
   id_cd VARCHAR(50),
   id_livre VARCHAR(50),
   PRIMARY KEY(id_produit),
   FOREIGN KEY(id_dvd) REFERENCES DVD(id_dvd),
   FOREIGN KEY(id_cd) REFERENCES CD(id_cd),
   FOREIGN KEY(id_livre) REFERENCES LIVRE(id_livre)
);

CREATE TABLE EMPRUNT(
   id_emprunt INT,
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
