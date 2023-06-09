DROP INDEX pracownik_imie;

DROP INDEX pracownik_nazwisko;

DROP INDEX pracownik_ulica;

DROP INDEX pracownik_nr_domu;

DROP INDEX pracownik_nr_mieszkania;

DROP INDEX pracownik_zablokowany;

DROP INDEX pracownik_id_stanowiska;

DROP INDEX pracownik_id_powiatu;

DROP INDEX pracownik_id_miejscowosci;

DROP INDEX pracownik_full;

DROP INDEX dane_logowania_skrot;

DROP INDEX dane_logowania_ostatnio_zalogowany;

DROP INDEX dane_logowania_full;

DROP INDEX dane_kontaktowe_id_pracownika;

DROP INDEX dane_kontaktowe_full;

DROP INDEX umowa_data_podpisania;

DROP INDEX umowa_data_zakonczenia;

DROP INDEX umowa_kwota_rozliczenia;

DROP INDEX umowa_nr_konta;

DROP INDEX umowa_id_pracownika;

CREATE INDEX pracownik_imie
  ON pracownik (imie);
CREATE  INDEX pracownik_nazwisko
  ON pracownik (nazwisko);
CREATE  INDEX pracownik_ulica
  ON pracownik (ulica);
CREATE  INDEX pracownik_nr_domu
  ON pracownik (nr_domu);
CREATE  INDEX pracownik_nr_mieszkania
  ON pracownik (nr_mieszkania);
CREATE  INDEX pracownik_zablokowany
  ON pracownik (zablokowany);
CREATE  INDEX pracownik_id_stanowiska
  ON pracownik (id_stanowiska);
CREATE  INDEX pracownik_id_powiatu
  ON pracownik (id_powiatu);
CREATE  INDEX pracownik_id_miejscowosci
  ON pracownik (id_miejscowosci);
CREATE INDEX pracownik_full
  ON pracownik (imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, zablokowany, id_stanowiska, id_powiatu, id_miejscowosci);
CREATE INDEX dane_logowania_skrot
  ON dane_logowania (skrot);
CREATE INDEX dane_logowania_ostatnio_zalogowany
  ON dane_logowania (ostatnio_zalogowany);
CREATE INDEX dane_logowania_full
  ON dane_logowania (id_loginu, login, skrot, ostatnio_zalogowany);
CREATE INDEX dane_kontaktowe_id_pracownika
 ON dane_kontaktowe (id_pracownika);
CREATE INDEX dane_kontaktowe_full
 ON dane_kontaktowe (id_danych, nr_telefonu,fax, email_prywatny, id_pracownika);
CREATE INDEX umowa_data_podpisania
 ON umowa (data_podpisania);
CREATE INDEX umowa_data_zakonczenia
 ON umowa (data_zakonczenia);
CREATE INDEX umowa_kwota_rozliczenia
 ON umowa (kwota_rozliczenia);
CREATE INDEX umowa_nr_konta
 ON umowa (nr_konta);
CREATE INDEX umowa_id_pracownika
 ON umowa (id_pracownika);




