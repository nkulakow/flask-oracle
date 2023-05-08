-- dropping 

DROP MATERIALIZED VIEW Benefit;

DROP MATERIALIZED VIEW Inny_benefit;

DROP MATERIALIZED VIEW Premia;

DROP MATERIALIZED VIEW Samochod ;

DROP MATERIALIZED VIEW Urzadzenie_elektroniczne;

DROP MATERIALIZED VIEW Wniosek ;

DROP MATERIALIZED VIEW Wniosek_bonus ;

DROP MATERIALIZED VIEW Wniosek_inny ;

DROP MATERIALIZED VIEW Wniosek_urlop;

DROP TABLE benefit_t CASCADE CONSTRAINTS;

DROP TABLE certyfikat CASCADE CONSTRAINTS;

DROP TABLE certyfikat_pracownik CASCADE CONSTRAINTS;

DROP TABLE dane_kontaktowe CASCADE CONSTRAINTS;

DROP TABLE dane_logowania CASCADE CONSTRAINTS;

DROP TABLE inny_benefit_t CASCADE CONSTRAINTS;

DROP TABLE miejscowosc CASCADE CONSTRAINTS;

DROP TABLE powiat CASCADE CONSTRAINTS;

DROP TABLE pracownik CASCADE CONSTRAINTS;

DROP TABLE pracownik_logowanie CASCADE CONSTRAINTS;

DROP TABLE premia_t CASCADE CONSTRAINTS;

DROP TABLE samochod_t CASCADE CONSTRAINTS;

DROP TABLE stanowisko CASCADE CONSTRAINTS;

DROP TABLE umowa CASCADE CONSTRAINTS;

DROP TABLE urzadzenie_elektroniczne_t CASCADE CONSTRAINTS;

DROP TABLE wniosek_bonus_t CASCADE CONSTRAINTS;

DROP TABLE wniosek_inny_t CASCADE CONSTRAINTS;

DROP TABLE wniosek_t CASCADE CONSTRAINTS;

DROP TABLE wniosek_urlop_t CASCADE CONSTRAINTS;

DROP TABLE wojewodztwo CASCADE CONSTRAINTS;

DROP TABLE zespol CASCADE CONSTRAINTS;

DROP TABLE zespol_pracownik CASCADE CONSTRAINTS;

-- creating tables

CREATE TABLE benefit_t (
    id_benefitu     INTEGER NOT NULL,
    nazwa           VARCHAR2(20 CHAR) NOT NULL,
    data_przyznania DATE,
    data_odebrania  DATE,
    id_pracownika   INTEGER
);

ALTER TABLE benefit_t ADD CONSTRAINT benefit_pk PRIMARY KEY ( id_benefitu );
ALTER TABLE benefit_t ADD CONSTRAINT benefit_t_dates_check CHECK (
    data_odebrania >= data_przyznania);

CREATE TABLE certyfikat (
    id_certyfikatu   INTEGER NOT NULL,
    nazwa            VARCHAR2(20 CHAR) NOT NULL,
    liczba_godzin    INTEGER,
    krotki_opis      VARCHAR2(50 CHAR),
    wystawiony_przez VARCHAR2(25 CHAR)
);

ALTER TABLE certyfikat ADD CONSTRAINT certyfikat_pk PRIMARY KEY ( id_certyfikatu );

CREATE TABLE certyfikat_pracownik (
    id_certyfikatu  INTEGER NOT NULL,
    id              INTEGER NOT NULL,
    data_otrzymania DATE NOT NULL,
    id_pracownika   INTEGER NOT NULL
);

ALTER TABLE certyfikat_pracownik ADD CONSTRAINT certyfikat_pracownik_pk PRIMARY KEY ( id );

CREATE TABLE dane_kontaktowe (
    id_danych      INTEGER NOT NULL,
    nr_telefonu    VARCHAR2(15 CHAR),
    fax            VARCHAR2(15 CHAR),
    email_prywatny VARCHAR2(30 CHAR),
    id_pracownika  INTEGER NOT NULL
);

ALTER TABLE dane_kontaktowe ADD CONSTRAINT dane_kontaktowe_pk PRIMARY KEY ( id_danych );
ALTER TABLE dane_kontaktowe ADD CONSTRAINT dane_kontaktowe_nr_telefonu_u UNIQUE ( nr_telefonu );
ALTER TABLE dane_kontaktowe ADD CONSTRAINT dane_kontaktowe_fax_u UNIQUE (fax);
ALTER TABLE dane_kontaktowe ADD CONSTRAINT dane_kontaktowe_email_u UNIQUE ( email_prywatny );



CREATE TABLE dane_logowania (
    id_loginu           INTEGER NOT NULL,
    login               VARCHAR2(30 CHAR) NOT NULL,
    skrot               VARCHAR2(65 CHAR) NOT NULL,
    ostatnio_zalogowany DATE
);

ALTER TABLE dane_logowania ADD CONSTRAINT dane_logowania_pk PRIMARY KEY ( id_loginu );
ALTER TABLE dane_logowania ADD CONSTRAINT dane_logowania_login_u UNIQUE ( login );

CREATE TABLE inny_benefit_t (
    id_benefitu INTEGER NOT NULL,
    krotki_opis VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE inny_benefit_t ADD CONSTRAINT inny_benefit_pk PRIMARY KEY ( id_benefitu );

CREATE TABLE miejscowosc (
    id_powiatu      INTEGER NOT NULL,
    id_miejscowosci INTEGER NOT NULL,
    nazwa           VARCHAR2(20 CHAR) NOT NULL,
    kod_pocztowy    VARCHAR2(10 CHAR) NOT NULL
);

ALTER TABLE miejscowosc ADD CONSTRAINT miejscowosc_pk PRIMARY KEY ( id_powiatu,
                                                                    id_miejscowosci );
ALTER TABLE miejscowosc ADD CONSTRAINT miejscowosc_kod_pocztowy_check CHECK (
    LENGTH(kod_pocztowy) = 6 AND SUBSTR(kod_pocztowy, 3, 1) = '-');

CREATE TABLE powiat (
    id_powiatu     INTEGER NOT NULL,
    nazwa          VARCHAR2(20 CHAR) NOT NULL,
    id_wojewodztwa INTEGER NOT NULL
);

ALTER TABLE powiat ADD CONSTRAINT powiat_pk PRIMARY KEY ( id_powiatu );

CREATE TABLE pracownik (
    id_pracownika   INTEGER NOT NULL,
    imie            VARCHAR2(30 CHAR) NOT NULL,
    nazwisko        VARCHAR2(40 CHAR) NOT NULL,
    ulica           VARCHAR2(30 CHAR) NOT NULL,
    nr_domu         INTEGER NOT NULL,
    nr_mieszkania   INTEGER,
    pesel           VARCHAR2(12 CHAR) NOT NULL,
    email           VARCHAR2(50 CHAR) NOT NULL,
    zablokowany     NUMBER(1),
    id_stanowiska   INTEGER NOT NULL,
    id_powiatu      INTEGER NOT NULL,
    id_miejscowosci INTEGER NOT NULL
);

ALTER TABLE pracownik ADD CONSTRAINT pracownik_pk PRIMARY KEY ( id_pracownika );
ALTER TABLE pracownik ADD CONSTRAINT pracownik_pesel_u UNIQUE (pesel);
ALTER TABLE pracownik ADD CONSTRAINT pracownik_pesel_check CHECK (
    LENGTH(pesel)=11 AND REGEXP_LIKE(pesel, '^[0-9]+$'));
ALTER TABLE pracownik ADD CONSTRAINT pracownik_email_u UNIQUE (email);

CREATE TABLE pracownik_logowanie (
    id_pracownika INTEGER NOT NULL,
    id_loginu     INTEGER NOT NULL
);

CREATE TABLE premia_t (
    id_benefitu INTEGER NOT NULL,
    kwota       NUMBER(10, 2)
);

ALTER TABLE premia_t ADD CONSTRAINT premia_pk PRIMARY KEY ( id_benefitu );

CREATE TABLE samochod_t (
    id_benefitu       INTEGER NOT NULL,
    nr_rejestracyjny  VARCHAR2(15 CHAR),
    marka             VARCHAR2(15 CHAR),
    model             VARCHAR2(30 CHAR),
    ostatni_przeglad  DATE,
    nastepny_przeglad DATE
);

ALTER TABLE samochod_t ADD CONSTRAINT samochod_pk PRIMARY KEY ( id_benefitu );
ALTER TABLE samochod_t ADD CONSTRAINT samochod_nr_rej_u UNIQUE ( nr_rejestracyjny );
ALTER TABLE samochod_t ADD CONSTRAINT samochod_date_check CHECK (
    (ostatni_przeglad IS NULL) OR (nastepny_przeglad IS NULL) OR (nastepny_przeglad >= ostatni_przeglad));

CREATE TABLE stanowisko (
    id_stanowiska INTEGER NOT NULL,
    nazwa         VARCHAR2(30 CHAR),
    kadrowy       NUMBER(1)
);

ALTER TABLE stanowisko ADD CONSTRAINT stanowisko_pk PRIMARY KEY ( id_stanowiska );

CREATE TABLE umowa (
    id_umowy          INTEGER NOT NULL,
    rodzaj_umowy      VARCHAR2(20 CHAR) NOT NULL,
    data_podpisania   DATE NOT NULL,
    data_zakonczenia  DATE NOT NULL,
    kwota_rozliczenia NUMBER(10, 2) NOT NULL,
    waluta            VARCHAR2(3 CHAR) NOT NULL,
    nr_konta          VARCHAR2(30 CHAR) NOT NULL,
    id_pracownika     INTEGER NOT NULL
);

ALTER TABLE umowa ADD CONSTRAINT umowa_pk PRIMARY KEY ( id_umowy );
ALTER TABLE umowa ADD CONSTRAINT umowa_date_check CHECK (
    data_zakonczenia >= data_podpisania);

CREATE TABLE urzadzenie_elektroniczne_t (
    id_benefitu INTEGER NOT NULL,
    rodzaj      VARCHAR2(20 CHAR) NOT NULL,
    model       VARCHAR2(30 CHAR),
    marka       VARCHAR2(20 CHAR),
    nr_seryjny  VARCHAR2(20 CHAR)
);

ALTER TABLE urzadzenie_elektroniczne_t ADD CONSTRAINT urzadzenie_elektroniczne_pk PRIMARY KEY ( id_benefitu );
ALTER TABLE urzadzenie_elektroniczne_t ADD CONSTRAINT urzadzenie_el_nr_ser_u UNIQUE ( nr_seryjny );

CREATE TABLE wniosek_bonus_t (
    id_wniosku      INTEGER NOT NULL,
    stawka          NUMBER(10, 2),
    czy_jednorazowy NUMBER(1) NOT NULL
);

ALTER TABLE wniosek_bonus_t ADD CONSTRAINT wniosek_bonus_pk PRIMARY KEY ( id_wniosku );
ALTER TABLE wniosek_bonus_t ADD CONSTRAINT wniosek_bonus_stawka_check CHECK (
    stawka > 0 );

CREATE TABLE wniosek_inny_t (
    id_wniosku  INTEGER NOT NULL,
    krotki_opis VARCHAR2(50 CHAR)
);

ALTER TABLE wniosek_inny_t ADD CONSTRAINT wniosek_inny_pk PRIMARY KEY ( id_wniosku );

CREATE TABLE wniosek_t (
    id_wniosku       INTEGER NOT NULL,
    data_zlozenia    DATE NOT NULL,
    nazwa_zalacznika VARCHAR2(40 CHAR),
    status           VARCHAR2(15 CHAR),
    id_pracownika    INTEGER NOT NULL
);

ALTER TABLE wniosek_t ADD CONSTRAINT wniosek_pk PRIMARY KEY ( id_wniosku );

CREATE TABLE wniosek_urlop_t (
    id_wniosku       INTEGER NOT NULL,
    data_rozpoczecia DATE NOT NULL,
    data_zakonczenia DATE NOT NULL,
    rodzaj           VARCHAR2(30 CHAR) NOT NULL
);

ALTER TABLE wniosek_urlop_t ADD CONSTRAINT wniosek_urlop_pk PRIMARY KEY ( id_wniosku );
ALTER TABLE wniosek_urlop_t ADD CONSTRAINT wniosek_urlop_date_check CHECK (
    data_zakonczenia >= data_rozpoczecia );

CREATE TABLE wojewodztwo (
    id_wojewodztwa INTEGER NOT NULL,
    nazwa          NVARCHAR2(20) NOT NULL
);

ALTER TABLE wojewodztwo ADD CONSTRAINT wojewodztwo_pk PRIMARY KEY ( id_wojewodztwa );

CREATE TABLE zespol (
    id_zespolu       INTEGER NOT NULL,
    nazwa_projektu   VARCHAR2(50 CHAR) NOT NULL,
    data_zalozenia   DATE,
    data_rozwiazania DATE,
    data_realizacji  DATE,
    id_lidera    INTEGER NOT NULL
);

ALTER TABLE zespol ADD CONSTRAINT zespol_pk PRIMARY KEY ( id_zespolu );
ALTER TABLE zespol ADD CONSTRAINT zespol_date_check CHECK (
    ((data_zalozenia IS NULL) AND ((data_rozwiazania>data_realizacji) OR (data_rozwiazania IS NULL) OR (data_realizacji IS NULL))) OR
    ((data_rozwiazania IS NULL) AND ((data_realizacji>data_zalozenia) OR (data_realizacji IS NULL))) OR
    ((data_realizacji IS NULL) AND (data_rozwiazania>data_zalozenia)) OR
    ((data_rozwiazania>data_realizacji) AND (data_realizacji>data_zalozenia)));


CREATE TABLE zespol_pracownik (
    id_pracownika INTEGER NOT NULL,
    id_zespolu    INTEGER NOT NULL
);


-- foreign keys

ALTER TABLE urzadzenie_elektroniczne_t
    ADD CONSTRAINT benefit_fk FOREIGN KEY ( id_benefitu )
        REFERENCES benefit_t ( id_benefitu );

ALTER TABLE inny_benefit_t
    ADD CONSTRAINT benefit_fkv1 FOREIGN KEY ( id_benefitu )
        REFERENCES benefit_t ( id_benefitu );

ALTER TABLE premia_t
    ADD CONSTRAINT benefit_fkv2 FOREIGN KEY ( id_benefitu )
        REFERENCES benefit_t ( id_benefitu );

ALTER TABLE samochod_t
    ADD CONSTRAINT benefit_fkv3 FOREIGN KEY ( id_benefitu )
        REFERENCES benefit_t ( id_benefitu );

ALTER TABLE certyfikat_pracownik
    ADD CONSTRAINT certyfikat_fk FOREIGN KEY ( id_certyfikatu )
        REFERENCES certyfikat ( id_certyfikatu );

ALTER TABLE pracownik_logowanie
    ADD CONSTRAINT dane_logowania_fk FOREIGN KEY ( id_loginu )
        REFERENCES dane_logowania ( id_loginu );

ALTER TABLE pracownik
    ADD CONSTRAINT miasto_fk FOREIGN KEY ( id_powiatu,
                                           id_miejscowosci )
        REFERENCES miejscowosc ( id_powiatu,
                                 id_miejscowosci );

ALTER TABLE miejscowosc
    ADD CONSTRAINT powiat_fk FOREIGN KEY ( id_powiatu )
        REFERENCES powiat ( id_powiatu );

ALTER TABLE certyfikat_pracownik
    ADD CONSTRAINT pracownik_fk FOREIGN KEY ( id_pracownika )
        REFERENCES pracownik ( id_pracownika );

ALTER TABLE zespol
    ADD CONSTRAINT pracownik_fkv1 FOREIGN KEY ( id_lidera )
        REFERENCES pracownik ( id_pracownika );

ALTER TABLE benefit_t
    ADD CONSTRAINT pracownik_fkv2 FOREIGN KEY ( id_pracownika )
        REFERENCES pracownik ( id_pracownika );

ALTER TABLE zespol_pracownik
    ADD CONSTRAINT pracownik_fkv3 FOREIGN KEY ( id_pracownika )
        REFERENCES pracownik ( id_pracownika );

ALTER TABLE dane_kontaktowe
    ADD CONSTRAINT pracownik_fkv4 FOREIGN KEY ( id_pracownika )
        REFERENCES pracownik ( id_pracownika );

ALTER TABLE umowa
    ADD CONSTRAINT pracownik_fkv6 FOREIGN KEY ( id_pracownika )
        REFERENCES pracownik ( id_pracownika );

ALTER TABLE wniosek_t
    ADD CONSTRAINT pracownik_fkv7 FOREIGN KEY ( id_pracownika )
        REFERENCES pracownik ( id_pracownika );

ALTER TABLE pracownik_logowanie
    ADD CONSTRAINT pracownik_fkv8 FOREIGN KEY ( id_pracownika )
        REFERENCES pracownik ( id_pracownika );

ALTER TABLE pracownik
    ADD CONSTRAINT stanowisko_fk FOREIGN KEY ( id_stanowiska )
        REFERENCES stanowisko ( id_stanowiska );

ALTER TABLE wniosek_urlop_t
    ADD CONSTRAINT wniosek_fk FOREIGN KEY ( id_wniosku )
        REFERENCES wniosek_t ( id_wniosku );

ALTER TABLE wniosek_bonus_t
    ADD CONSTRAINT wniosek_fkv1 FOREIGN KEY ( id_wniosku )
        REFERENCES wniosek_t ( id_wniosku );

ALTER TABLE wniosek_inny_t
    ADD CONSTRAINT wniosek_fkv2 FOREIGN KEY ( id_wniosku )
        REFERENCES wniosek_t ( id_wniosku );

ALTER TABLE powiat
    ADD CONSTRAINT wojewodztwo_fk FOREIGN KEY ( id_wojewodztwa )
        REFERENCES wojewodztwo ( id_wojewodztwa );

ALTER TABLE zespol_pracownik
    ADD CONSTRAINT zespol_fk FOREIGN KEY ( id_zespolu )
        REFERENCES zespol ( id_zespolu );


-- creating materilized views

CREATE MATERIALIZED VIEW Benefit ( Id_benefitu, Nazwa, Data_przyznania, Data_odebrania, Id_pracownika, Kwota, Nr_rejestracyjny, Marka, Model, Ostatni_przeglad, Nastepny_przeglad, Rodzaj, Model_1, Marka_1, Nr_seryjny, Krotki_opis )
BUILD IMMEDIATE
REFRESH FORCE ON COMMIT AS
SELECT b.*, 
p.Kwota as Kwota,
s.Nr_rejestracyjny as Nr_rejestracyjny,
s.Marka as Marka,
s.Model as Model,
s.Ostatni_przeglad as Ostatni_przeglad,
s.Nastepny_przeglad as Nastepny_przeglad,
u.Rodzaj as Rodzaj,
u.Model as Model,
u.Marka as Marka,
u.Nr_seryjny as Nr_seryjny,
ib.Krotki_opis as Krotki_opis
FROM BENEFIT_T b, PREMIA_T p, 
SAMOCHOD_T s, Urzadzenie_elektroniczne_T u,
INNY_BENEFIT_T ib
WHERE 
b.Id_benefitu = p.Id_benefitu (+) AND
b.Id_benefitu = s.Id_benefitu (+) AND
b.Id_benefitu = u.Id_benefitu (+) AND
b.Id_benefitu = ib.Id_benefitu (+) 
;

CREATE MATERIALIZED VIEW Inny_benefit ( Id_benefitu, Nazwa, Data_przyznania, Data_odebrania, Id_pracownika, Krotki_opis ) 
BUILD IMMEDIATE
REFRESH FORCE ON COMMIT AS
SELECT b.*, 
ib.Krotki_opis as Krotki_opis
FROM BENEFIT_T b, INNY_BENEFIT_T ib
WHERE b.Id_benefitu = ib.Id_benefitu 
;

CREATE MATERIALIZED VIEW Premia ( Id_benefitu, Nazwa, Data_przyznania, Data_odebrania, Id_pracownika, Kwota ) 
BUILD IMMEDIATE
REFRESH FORCE ON COMMIT AS
SELECT b.*, 
p.Kwota as Kwota
FROM BENEFIT_T b, PREMIA_T p
WHERE b.Id_benefitu = p.Id_benefitu 
;

CREATE MATERIALIZED VIEW Samochod ( Id_benefitu, Nazwa, Data_przyznania, Data_odebrania, Id_pracownika, Nr_rejestracyjny, Marka, Model, Ostatni_przeglad, Nastepny_przeglad ) 
BUILD IMMEDIATE
REFRESH FORCE ON COMMIT AS
SELECT b.*, 
s.Nr_rejestracyjny as Nr_rejestracyjny,
s.Marka as Marka,
s.Model as Model,
s.Ostatni_przeglad as Ostatni_przeglad,
s.Nastepny_przeglad as Nastepny_przeglad
FROM BENEFIT_T b, SAMOCHOD_T s
WHERE b.Id_benefitu = s.Id_benefitu 
;

CREATE MATERIALIZED VIEW Urzadzenie_elektroniczne ( Id_benefitu, Nazwa, Data_przyznania, Data_odebrania, Id_pracownika, Rodzaj, Model, Marka, Nr_seryjny ) 
BUILD IMMEDIATE
REFRESH FORCE ON COMMIT AS
SELECT b.*, 
u.Rodzaj as Rodzaj,
u.Model as Model,
u.Marka as Marka,
u.Nr_seryjny as Nr_seryjny
FROM BENEFIT_T b, Urzadzenie_elektroniczne_T u
WHERE b.Id_benefitu = u.Id_benefitu 
;

CREATE MATERIALIZED VIEW Wniosek ( Id_wniosku, Data_zlozenia, Nazwa_zalacznika, Status, Id_pracownika, Stawka, Czy_jednorazowy, Data_rozpoczecia, Data_zakonczenia, Rodzaj, krotki_opis ) 
BUILD IMMEDIATE
REFRESH FORCE ON COMMIT AS
SELECT w.*,
wb.Stawka as Stawka,
wb.Czy_jednorazowy as Czy_jednorazowy,
wu.Data_rozpoczecia as Data_rozpoczecia,
wu.Data_zakonczenia as Data_zakonczenia,
wu.Rodzaj as Rodzaj,
win.krotki_opis as krotki_opis 
FROM WNIOSEK_T w, 
WNIOSEK_BONUS_T wb,
WNIOSEK_URLOP_T wu,
WNIOSEK_INNY_T win
WHERE
w.Id_wniosku = wb.Id_wniosku (+) AND
w.Id_wniosku = wu.Id_wniosku (+) AND
w.Id_wniosku = win.Id_wniosku (+) 
;

CREATE MATERIALIZED VIEW Wniosek_bonus ( Id_wniosku, Data_zlozenia, Nazwa_zalacznika, Status, Id_pracownika, Stawka, Czy_jednorazowy ) 
BUILD IMMEDIATE
REFRESH FORCE ON COMMIT AS
SELECT w.*, 
wb.Stawka as Stawka,
wb.Czy_jednorazowy as Czy_jednorazowy
FROM WNIOSEK_T w, WNIOSEK_BONUS_T wb 
WHERE w.Id_wniosku=wb.Id_wniosku 
;

CREATE MATERIALIZED VIEW Wniosek_inny ( Id_wniosku, Data_zlozenia, Nazwa_zalacznika, Status, Id_pracownika, krotki_opis ) 
BUILD IMMEDIATE
REFRESH FORCE ON COMMIT AS
SELECT w.*, win.krotki_opis as krotki_opis 
FROM WNIOSEK_T w, WNIOSEK_INNY_T win 
WHERE w.Id_wniosku=win.Id_wniosku 
;

CREATE MATERIALIZED VIEW Wniosek_urlop ( Id_wniosku, Data_zlozenia, Nazwa_zalacznika, Status, Id_pracownika, Data_rozpoczecia, Data_zakonczenia, Rodzaj ) 
BUILD IMMEDIATE
REFRESH FORCE ON COMMIT AS
SELECT w.*, 
wu.Data_rozpoczecia as Data_rozpoczecia,
wu.Data_zakonczenia as Data_zakonczenia,
wu.Rodzaj as Rodzaj
FROM WNIOSEK_T w, WNIOSEK_URLOP_T wu 
WHERE w.Id_wniosku=wu.Id_wniosku 
;

commit;