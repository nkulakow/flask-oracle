ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";

INSERT INTO stanowisko VALUES (1, 'Manager', 1);
INSERT INTO stanowisko VALUES (2, 'Specjalista ds. marketingu', 0);
INSERT INTO stanowisko VALUES (3, 'Analityk biznesowy', 0);
INSERT INTO stanowisko VALUES (4, 'Koordynator projektow', 1);
INSERT INTO stanowisko VALUES (5, 'Pracownik administracyjny', 0);
INSERT INTO stanowisko VALUES (6, 'Inzynier jakosci', 0);
INSERT INTO stanowisko VALUES (7, 'Programista', 0);
INSERT INTO stanowisko VALUES (8, 'Doradca klienta', 0);
INSERT INTO stanowisko VALUES (9, 'Handlowiec', 1);
INSERT INTO stanowisko VALUES (10, 'Asystentka biura', 0);

INSERT INTO wojewodztwo VALUES (1, 'dolnoslaskie');
INSERT INTO wojewodztwo VALUES (2, 'kujawsko-pomorskie');
INSERT INTO wojewodztwo VALUES (3, 'lubelskie');
INSERT INTO wojewodztwo VALUES (4, 'lubuskie');
INSERT INTO wojewodztwo VALUES (5, 'lodzkie');
INSERT INTO wojewodztwo VALUES (6, 'malopolskie');
INSERT INTO wojewodztwo VALUES (7, 'mazowieckie');
INSERT INTO wojewodztwo VALUES (8, 'opolskie');
INSERT INTO wojewodztwo VALUES (9, 'podkarpackie');
INSERT INTO wojewodztwo VALUES (10, 'podlaskie');
INSERT INTO wojewodztwo VALUES (11, 'pomorskie');
INSERT INTO wojewodztwo VALUES (12, 'slaskie');
INSERT INTO wojewodztwo VALUES (13, 'swietokrzyskie');
INSERT INTO wojewodztwo VALUES (14, 'warminsko-mazurskie');
INSERT INTO wojewodztwo VALUES (15, 'wielkopolskie');
INSERT INTO wojewodztwo VALUES (16, 'zachodniopomorskie');

INSERT INTO powiat VALUES (1, 'warszawski', 7);
INSERT INTO powiat VALUES (2, 'piaseczynski', 7);
INSERT INTO powiat VALUES (3, 'otwocki', 7);
INSERT INTO powiat VALUES (4, 'krakowski', 6);
INSERT INTO powiat VALUES (5, 'wielickie', 6);
INSERT INTO powiat VALUES (6, 'gdanski', 11);
INSERT INTO powiat VALUES (7, 'sopot', 11);
INSERT INTO powiat VALUES (8, 'gdynskie', 11);
INSERT INTO powiat VALUES (9, 'wroclawskie', 1);
INSERT INTO powiat VALUES (10, 'legnicki', 1);
INSERT INTO powiat VALUES (11, 'jeleniogorski', 1);
INSERT INTO powiat VALUES (12, 'boleslawieckie', 1);
INSERT INTO powiat VALUES (13, 'poznanskie', 15);
INSERT INTO powiat VALUES (14, 'gnieznienski', 15);
INSERT INTO powiat VALUES (15, 'kaliskie', 15);
INSERT INTO powiat VALUES (16, 'jarocinskie', 15);
INSERT INTO powiat VALUES (17, 'lodzkie', 5);
INSERT INTO powiat VALUES (18, 'pabianickie', 5);
INSERT INTO powiat VALUES (19, 'piotrkowski', 5);
INSERT INTO powiat VALUES (20, 'zgierski', 5);
INSERT INTO powiat VALUES (21, 'katowicki', 12);
INSERT INTO powiat VALUES (22, 'czestochowski', 12);
INSERT INTO powiat VALUES (23, 'rzeszowski', 9);
INSERT INTO powiat VALUES (24, 'przemyski', 9);

INSERT INTO miejscowosc VALUES (1, 1, 'Warszawa', '00-001');
INSERT INTO miejscowosc VALUES (2, 1, 'Piaseczno', '05-500');
INSERT INTO miejscowosc VALUES (3, 1, 'Otwock', '05-400');
INSERT INTO miejscowosc VALUES (3, 2, 'Jozefow', '05-410');
INSERT INTO miejscowosc VALUES (2, 2, 'Konstancin-Jeziorna', '05-510');
INSERT INTO miejscowosc VALUES (4, 1, 'Krakow', '30-001');
INSERT INTO miejscowosc VALUES (5, 1, 'Wieliczka', '32-020');
INSERT INTO miejscowosc VALUES (4, 2, 'Skawina', '32-050');
INSERT INTO miejscowosc VALUES (5, 2, 'Niepolomice', '32-005');
INSERT INTO miejscowosc VALUES (6, 1, 'Gdansk', '80-001');
INSERT INTO miejscowosc VALUES (7, 1, 'Sopot', '81-701');
INSERT INTO miejscowosc VALUES (8, 1, 'Gdynia', '81-001');
INSERT INTO miejscowosc VALUES (9, 1, 'Wroclaw', '50-001');
INSERT INTO miejscowosc VALUES (10, 1, 'Legnica', '59-220');
INSERT INTO miejscowosc VALUES (11, 1, 'Jelenia Gora', '58-500');
INSERT INTO miejscowosc VALUES (12, 1, 'Boleslawiec', '59-700');
INSERT INTO miejscowosc VALUES (13, 1, 'Poznan', '60-001');
INSERT INTO miejscowosc VALUES (14, 1, 'Gniezno', '62-200');
INSERT INTO miejscowosc VALUES (15, 1, 'Kalisz', '62-800');
INSERT INTO miejscowosc VALUES (15, 2, 'Slupia', '63-410');
INSERT INTO miejscowosc VALUES (15, 3, 'Skalmierzyce', '63-430');
INSERT INTO miejscowosc VALUES (16, 1, 'Jarocin', '63-200');
INSERT INTO miejscowosc VALUES (17, 1, 'Lodz', '90-001');
INSERT INTO miejscowosc VALUES (18, 1, 'Pabianice', '95-200');
INSERT INTO miejscowosc VALUES (19, 1, 'Piotrkow Trybunalski', '97-300');
INSERT INTO miejscowosc VALUES (20, 1, 'Zgierz', '95-100');
INSERT INTO miejscowosc VALUES (21, 1, 'Katowice', '40-001');
INSERT INTO miejscowosc VALUES (22, 1, 'Czestochowa', '42-200');
INSERT INTO miejscowosc VALUES (23, 1, 'Rzeszow', '35-001');
INSERT INTO miejscowosc VALUES (24, 1, 'Przemysl', '37-700');
INSERT INTO miejscowosc VALUES (24, 2, 'Dubiecko',	'37-730');
INSERT INTO miejscowosc VALUES (24, 3, 'Bircza', '37-710');
INSERT INTO miejscowosc VALUES (24, 4, 'Krasiczyn', '37-730');

INSERT INTO pracownik VALUES (1, 'Jan', 'Kowalski', 'Kwiatowa', 10, 1, '81082637483', 'jkowalski@firma.com', 0, 2, 7, 1, 1);
INSERT INTO pracownik VALUES (2, 'Anna', 'Nowak', 'Sloneczna', 15, 2, '89032976129', 'anowak@firma.com', 0, 5, 6, 4, 1);
INSERT INTO pracownik VALUES (3, 'Piotr', 'Wojcik', 'Krotka', 20, 3, '85102798375', 'pwojcik@firma.com', 0, 8, 11, 6, 1);
INSERT INTO pracownik VALUES (4, 'Maria', 'Kaczmarek', 'Lipowa', 30, 4, '92070267823', 'mkaczmarek@firma.com', 0, 1, 11, 7, 1);
INSERT INTO pracownik VALUES (10, 'Katarzyna', 'Kaminska', 'Morska', 90, 10, '80042045871', 'kkaminska@firma.com', 0, 6, 11, 7, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (5, 'Tomasz', 'Lewandowski', 'Kosciuszki', 40, '85081513243', 'tlewandowski@firma.com', 3, 9, 24, 4);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (6, 'Agnieszka', 'Dabrowska', 'Swietokrzyska', 50, '81030484689', 'adabrowska@firma.com', 10, 9, 24, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (7, 'Marcin', 'Zielinski', 'Warszawska', 60, '91070254375', 'mzielinski@firma.com', 4, 9, 23, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (8, 'Magdalena', 'Szymanska', 'Mickiewicza', 70, '90071525837', 'mszymanska@firma.com', 9, 15, 15, 3);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (9, 'Michal', 'Wozniak', 'Krzywa', 80, '79052783265', 'mwozniak@firma.com', 7, 15, 15, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (11, 'Pawel', 'Kozlowski', 'Koscielna', 11, '88031054733', 'pkozlowski@firma.com', 2, 15, 15, 3);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (12, 'Beata', 'Kowalczyk', 'Szkolna', 12, '85070684629', 'bkowalczyk@firma.com', 5, 15, 15, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (13, 'Piotr', 'Nowak', 'Sloneczna', 10, 2, '88032845432', 'piotr.nowak@gmail.com', 4, 7, 3, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (14, 'Anna', 'Kowalska', 'Szkolna', 3, 13, '92082867891', 'anna.kowalska@wp.pl', 3, 7, 3, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (15, 'Marek', 'Kaczmarek', 'Krakowska', 25, 4, '86050723456', 'marek.kaczmarek@o2.pl', 2, 7, 3, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (16, 'Katarzyna', 'Lewandowska', 'Wroclawska', 7, 17, '95021418769', 'katarzyna.lewandowska@gmail.com', 5, 7, 2, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (17, 'Tomasz', 'Wójcik', 'Pilsudskiego', 15, 1, '78060998765', 'tomasz.wojcik@interia.pl', 7, 7, 2, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (18, 'Karolina', 'Dąbrowska', 'Mickiewicza', 8, 2, '89010234512', 'karolina.dabrowska@gmail.com', 2, 7, 2, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (19, 'Kamil', 'Zielinski', 'Polna', 14, 2, '94080787654', 'kamil.zielinski@wp.pl', 6, 7, 1, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (20, 'Weronika', 'Szymanska', 'Targowa', 5, 3, '90060924589', 'weronika.szymanska@o2.pl', 8, 7, 1, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (21, 'Robert', 'Krupa', 'Lesna', 9, 5, '82031776543', 'robert.krupa@interia.pl', 1, 7, 1, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, zablokowany, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (22, 'Marta', 'Pawlak', 'Slowackiego', 22, '87041887654', 'marta.pawlak@gmail.com', 0, 9, 7, 1, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, zablokowany, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (23, 'Jan', 'Michalski', 'Podgorna', 7, '81072734567', 'jan.michalski@wp.pl', 0, 5, 1, 9, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, zablokowany, id_stanowiska, id_wojewodztwa, id_powiatu, id_miejscowosci) VALUES (24, 'Dorota', 'Witkowska', 'Kopernika', 13, '93081212345', 'dorota.witkowska@o2.pl', 0, 10, 1, 9, 1);

INSERT INTO dane_kontaktowe VALUES (1, NULL, '123456789', 'jan.kowalski@mail.com', 1);
INSERT INTO dane_kontaktowe VALUES (2, '234567890', NULL, 'anna.nowak@mail.com', 2);
INSERT INTO dane_kontaktowe VALUES (3, '345678901', '345678901', 'piotrwojcik2@mail.com', 3);
INSERT INTO dane_kontaktowe VALUES (4, '456789012', NULL, 'mariakaczmarek@mail.com', 4);
INSERT INTO dane_kontaktowe VALUES (5, '567890123', '567890123', 'tomasz.lewandowski@mail.com', 5);
INSERT INTO dane_kontaktowe VALUES (6, '678901234', NULL, 'agnieszkadabrowska@mail.com', 6);
INSERT INTO dane_kontaktowe VALUES (7, '789012345', '789012345', 'marcinzielinski@mail.com', 7);
INSERT INTO dane_kontaktowe VALUES (8, '890123456', NULL, 'magenaszymanska@mail.com', 8);
INSERT INTO dane_kontaktowe VALUES (9, '901234567', '901234567', 'wozniakmichalek@mail.com', 9);
INSERT INTO dane_kontaktowe VALUES (10, '012345678', NULL, NULL, 10);

INSERT INTO zespol VALUES (1, 'Projekt A', TO_DATE('01/01/2022', 'DD/MM/YYYY'), NULL, TO_DATE('01/06/2022', 'DD/MM/YYYY'), 4);
INSERT INTO zespol VALUES (2, 'Projekt B', TO_DATE('15/02/2022', 'DD/MM/YYYY'), NULL, TO_DATE('30/06/2022', 'DD/MM/YYYY'), 8);
INSERT INTO zespol VALUES (3, 'Projekt C', TO_DATE('01/03/2022', 'DD/MM/YYYY'), TO_DATE('01/07/2022', 'DD/MM/YYYY'), TO_DATE('15/06/2022', 'DD/MM/YYYY'), 13);
INSERT INTO zespol VALUES (4, 'Projekt D', TO_DATE('10/04/2022', 'DD/MM/YYYY'), NULL, NULL, 21);
INSERT INTO zespol VALUES (5, 'Projekt E', TO_DATE('01/05/2022', 'DD/MM/YYYY'), NULL, NULL, 17);

INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (1, 1);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (2, 2);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (3, 1);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (4, 4);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (5, 5);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (6, 2);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (7, 3);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (8, 5);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (9, 4);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (10, 1);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (11, 3);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (12, 2);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (13, 4);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (14, 5);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (15, 1);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (16, 2);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (17, 3);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (18, 4);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (19, 5);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (20, 1);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (17, 2);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (9, 3);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (2, 4);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (1, 5);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (21, 5);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (22, 5);
INSERT INTO zespol_pracownik (id_pracownika, id_zespolu) VALUES (18, 5);

INSERT INTO certyfikat VALUES (1, 'Excel+', 50, 'Excel dla zaawansowanych', 'Firma A');
INSERT INTO certyfikat VALUES (2, 'Zarzad projektem', NULL, 'Zarzadzanie projektami efektywnie', 'Firma B');
INSERT INTO certyfikat VALUES (3, 'Python', 80, 'Podstawy pythona', NULL);
INSERT INTO certyfikat VALUES (4, 'Senior UML', 100, 'Zaawansowane diagramy UML', 'Firma C');
INSERT INTO certyfikat VALUES (5, 'Iberystyka UW', NULL, NULL, NULL);

INSERT INTO certyfikat_pracownik VALUES (1, 1, TO_DATE('01/03/2021', 'DD/MM/YYYY'), 5);
INSERT INTO certyfikat_pracownik VALUES (3, 2, TO_DATE('15/04/2023', 'DD/MM/YYYY'), 13);
INSERT INTO certyfikat_pracownik VALUES (2, 3, TO_DATE('12/01/2020', 'DD/MM/YYYY'), 8);
INSERT INTO certyfikat_pracownik VALUES (4, 4, TO_DATE('27/02/2022', 'DD/MM/YYYY'), 22);
INSERT INTO certyfikat_pracownik VALUES (5, 5, TO_DATE('09/03/2020', 'DD/MM/YYYY'), 11);
INSERT INTO certyfikat_pracownik VALUES (1, 6, TO_DATE('08/02/2019', 'DD/MM/YYYY'), 20);
INSERT INTO certyfikat_pracownik VALUES (2, 7, TO_DATE('21/01/2019', 'DD/MM/YYYY'), 4);
INSERT INTO certyfikat_pracownik VALUES (3, 8, TO_DATE('03/04/2022', 'DD/MM/YYYY'), 18);
INSERT INTO certyfikat_pracownik VALUES (4, 9, TO_DATE('19/02/2022', 'DD/MM/YYYY'), 15);
INSERT INTO certyfikat_pracownik VALUES (5, 10, TO_DATE('23/03/2021', 'DD/MM/YYYY'), 9);

INSERT INTO benefit_t VALUES (1, 'Samochod', TO_DATE('19/02/2022', 'DD/MM/YYYY'), NULL, 1);
INSERT INTO benefit_t VALUES (2, 'Samochod', TO_DATE('19/03/2021', 'DD/MM/YYYY'), TO_DATE('21/09/2023', 'DD/MM/YYYY'), 2);
INSERT INTO benefit_t VALUES (3, 'Telefon', TO_DATE('18/02/2022', 'DD/MM/YYYY'), NULL, 3);
INSERT INTO benefit_t VALUES (4, 'Telefon', TO_DATE('18/02/2019', 'DD/MM/YYYY'), TO_DATE('30/11/2024', 'DD/MM/YYYY'), 1);
INSERT INTO benefit_t VALUES (5, 'Telefon', NULL, NULL, NULL);
INSERT INTO benefit_t VALUES (6, 'Laptop', TO_DATE('18/05/2022', 'DD/MM/YYYY'), NULL, 4);
INSERT INTO benefit_t VALUES (7, 'Laptop', NULL, NULL, NULL);
INSERT INTO benefit_t VALUES (8, 'MultiSport', NULL, NULL, NULL);
INSERT INTO benefit_t VALUES (9, 'GetProfit', NULL, NULL, NULL);
INSERT INTO benefit_t VALUES (10, 'Multikino', NULL, NULL, NULL);
INSERT INTO benefit_t VALUES (11, 'Premia', NULL, NULL, NULL);
INSERT INTO benefit_t VALUES (12, 'Premia', NULL, NULL, NULL);
INSERT INTO benefit_t VALUES (13, 'Premia', NULL, NULL, NULL);

INSERT INTO samochod_t VALUES (1, 'WAW 1234S', 'Opel', '7s', TO_DATE('20/03/2022', 'DD/MM/YYYY'), NULL);
INSERT INTO samochod_t VALUES (2, 'WAW 676GH', 'Volvo', NULL, NULL, NULL);

INSERT INTO urzadzenie_elektroniczne_t VALUES (3, 'Telefon komorkowy', 'Galaxy A5', 'Samsung', '1234567890');
INSERT INTO urzadzenie_elektroniczne_t VALUES (4, 'Telefon komorkowy', 'Power M3', 'Motorola', '0123456789');
INSERT INTO urzadzenie_elektroniczne_t VALUES (5, 'Telefon komorkowy', 'iPhone11', 'Apple', '2345678901');
INSERT INTO urzadzenie_elektroniczne_t VALUES (6, 'Laptop', 'Lite 16', 'Lenovo', '5678901234');
INSERT INTO urzadzenie_elektroniczne_t VALUES (7, 'Laptop', 'ProGaMe 12', 'Acer', '3456789012');

INSERT INTO inny_benefit_t VALUES (8, 'Karnet Multisport, na 2 lata');
INSERT INTO inny_benefit_t VALUES (9, 'Karnet GetProfit - uroda');
INSERT INTO inny_benefit_t VALUES (10, '24 bilety do wykorzystania w ciagu roku od 01/07/23');

INSERT INTO premia_t VALUES (11, 100);
INSERT INTO premia_t VALUES (12, 200);
INSERT INTO premia_t VALUES (13, 300);








