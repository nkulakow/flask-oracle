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

INSERT INTO pracownik VALUES (1, 'Jan', 'Kowalski', 'Kwiatowa', 10, 1, '81082637483', 'jkowalski@firma.com', 0, 2, 1, 1);
INSERT INTO pracownik VALUES (2, 'Anna', 'Nowak', 'Sloneczna', 15, 2, '89032976129', 'anowak@firma.com', 0, 5, 4, 1);
INSERT INTO pracownik VALUES (3, 'Piotr', 'Wojcik', 'Krotka', 20, 3, '85102798375', 'pwojcik@firma.com', 0, 8, 6, 1);
INSERT INTO pracownik VALUES (4, 'Maria', 'Kaczmarek', 'Lipowa', 30, 4, '92070267823', 'mkaczmarek@firma.com', 0, 1, 7, 1);
INSERT INTO pracownik VALUES (10, 'Katarzyna', 'Kaminska', 'Morska', 90, 10, '80042045871', 'kkaminska@firma.com', 0, 6, 7, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (5, 'Tomasz', 'Lewandowski', 'Kosciuszki', 40, '85081513243', 'tlewandowski@firma.com', 3, 24, 4);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (6, 'Agnieszka', 'Dabrowska', 'Swietokrzyska', 50, '81030484689', 'adabrowska@firma.com', 10, 24, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (7, 'Marcin', 'Zielinski', 'Warszawska', 60, '91070254375', 'mzielinski@firma.com', 4, 23, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (8, 'Magdalena', 'Szymanska', 'Mickiewicza', 70, '90071525837', 'mszymanska@firma.com', 9, 15, 3);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (9, 'Michal', 'Wozniak', 'Krzywa', 80, '79052783265', 'mwozniak@firma.com', 7, 15, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (11, 'Pawel', 'Kozlowski', 'Koscielna', 11, '88031054733', 'pkozlowski@firma.com', 2, 15, 3);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (12, 'Beata', 'Kowalczyk', 'Szkolna', 12, '85070684629', 'bkowalczyk@firma.com', 5, 15, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (13, 'Piotr', 'Nowak', 'Sloneczna', 10, 2, '88032845432', 'piotr.nowak@gmail.com', 4, 3, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (14, 'Anna', 'Kowalska', 'Szkolna', 3, 13, '92082867891', 'anna.kowalska@wp.pl', 3, 3, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (15, 'Marek', 'Kaczmarek', 'Krakowska', 25, 4, '86050723456', 'marek.kaczmarek@o2.pl', 2, 3, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (16, 'Katarzyna', 'Lewandowska', 'Wroclawska', 7, 17, '95021418769', 'katarzyna.lewandowska@gmail.com', 5, 2, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (17, 'Tomasz', 'Wójcik', 'Pilsudskiego', 15, 1, '78060998765', 'tomasz.wojcik@interia.pl', 7, 2, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (18, 'Karolina', 'Dąbrowska', 'Mickiewicza', 8, 2, '89010234512', 'karolina.dabrowska@gmail.com', 2, 2, 2);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (19, 'Kamil', 'Zielinski', 'Polna', 14, 2, '94080787654', 'kamil.zielinski@wp.pl', 6, 1, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (20, 'Weronika', 'Szymanska', 'Targowa', 5, 3, '90060924589', 'weronika.szymanska@o2.pl', 8, 1, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, nr_mieszkania, pesel, email, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (21, 'Robert', 'Krupa', 'Lesna', 9, 5, '82031776543', 'robert.krupa@interia.pl', 1, 1, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, zablokowany, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (22, 'Marta', 'Pawlak', 'Slowackiego', 22, '87041887654', 'marta.pawlak@gmail.com', 0, 9, 1, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, zablokowany, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (23, 'Jan', 'Michalski', 'Podgorna', 7, '81072734567', 'jan.michalski@wp.pl', 0, 5, 9, 1);
INSERT INTO pracownik (id_pracownika, imie, nazwisko, ulica, nr_domu, pesel, email, zablokowany, id_stanowiska, id_powiatu, id_miejscowosci) VALUES (24, 'Dorota', 'Witkowska', 'Kopernika', 13, '93081212345', 'dorota.witkowska@o2.pl', 0, 10, 9, 1);

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
INSERT INTO inny_benefit_t VALUES (10, '24 bilety do wykorzystania w ciagu roku');

INSERT INTO premia_t VALUES (11, 100);
INSERT INTO premia_t VALUES (12, 200);
INSERT INTO premia_t VALUES (13, 300);

INSERT INTO wniosek_t VALUES (1, TO_DATE('19/04/2023', 'DD/MM/YYYY'), 'Zalacznik1.docx', 'wyslany', 1);
INSERT INTO wniosek_t VALUES (2, TO_DATE('17/03/2021', 'DD/MM/YYYY'), NULL, 'odrzucony', 2);
INSERT INTO wniosek_t VALUES (3, TO_DATE('01/05/2023', 'DD/MM/YYYY'), 'Zalacznik3.docx', 'wyslany', 3);
INSERT INTO wniosek_t VALUES (4, TO_DATE('26/11/2022', 'DD/MM/YYYY'), 'Zalacznik4.docx', 'zaakceptowany', 4);
INSERT INTO wniosek_t VALUES (5, TO_DATE('15/07/2021', 'DD/MM/YYYY'), NULL, 'zaakceptowany', 5);
INSERT INTO wniosek_t VALUES (6, TO_DATE('29/12/2020', 'DD/MM/YYYY'), NULL, NULL, 1);
INSERT INTO wniosek_t VALUES (7, TO_DATE('02/04/2022', 'DD/MM/YYYY'), 'Zalacznik7.docx', 'odrzucony', 6);
INSERT INTO wniosek_t VALUES (8, TO_DATE('15/12/2019', 'DD/MM/YYYY'), NULL, 'zaakceptowany', 2);
INSERT INTO wniosek_t VALUES (9, TO_DATE('10/10/2022', 'DD/MM/YYYY'), 'Zalacznik9.docx', NULL, 3);

INSERT INTO wniosek_urlop_t VALUES (1, TO_DATE('19/07/2023', 'DD/MM/YYYY'), TO_DATE('27/07/2023', 'DD/MM/YYYY'), 'wypoczynkowy');
INSERT INTO wniosek_urlop_t VALUES (2, TO_DATE('20/03/2021', 'DD/MM/YYYY'), TO_DATE('29/03/2021', 'DD/MM/YYYY'), 'okolicznosciowy');
INSERT INTO wniosek_urlop_t VALUES (3, TO_DATE('20/05/2023', 'DD/MM/YYYY'), TO_DATE('25/05/2023', 'DD/MM/YYYY'), 'dla poratowania zdrowia');

INSERT INTO wniosek_bonus_t VALUES (4, 100, 0);
INSERT INTO wniosek_bonus_t VALUES (5, 1000, 1);
INSERT INTO wniosek_bonus_t VALUES (6, 300, 0);

INSERT INTO wniosek_inny_t VALUES (7, 'Przyznanie tytulu senior developera');
INSERT INTO wniosek_inny_t VALUES (8, 'Usuniecie jednego czlonka z zespolu');
INSERT INTO wniosek_inny_t VALUES (9, 'Zmiana stanowiska');

INSERT INTO umowa VALUES (1, 'Umowa o prace', TO_DATE('01/01/2020', 'DD/MM/YYYY'), TO_DATE('31/12/2024', 'DD/MM/YYYY'), 5000.00, 'PLN', '95896831474964698683331061', 1);
INSERT INTO umowa VALUES (2, 'Umowa o prace', TO_DATE('01/02/2020', 'DD/MM/YYYY'), TO_DATE('28/02/2024', 'DD/MM/YYYY'), 1500.00, 'PLN', '80438714648452848126807274', 2);
INSERT INTO umowa VALUES (3, 'Umowa o prace', TO_DATE('15/02/2020', 'DD/MM/YYYY'), TO_DATE('14/08/2023', 'DD/MM/YYYY'), 7000.00, 'PLN', '82455814389298669390075612', 3);
INSERT INTO umowa VALUES (4, 'Umowa prace', TO_DATE('01/03/2020', 'DD/MM/YYYY'), TO_DATE('30/09/2023', 'DD/MM/YYYY'), 3000.00, 'PLN', '49123512354095380227417767', 4);
INSERT INTO umowa VALUES (5, 'Umowa o dzielo', TO_DATE('15/03/2020', 'DD/MM/YYYY'), TO_DATE('14/09/2023', 'DD/MM/YYYY'), 2000.00, 'PLN', '81914322370037723731078346', 5);
INSERT INTO umowa VALUES (6, 'Umowa o prace', TO_DATE('01/04/2020', 'DD/MM/YYYY'), TO_DATE('30/09/2023', 'DD/MM/YYYY'), 8000.00, 'PLN', '62249982237788813023897734', 6);
INSERT INTO umowa VALUES (7, 'Umowa zlecenie', TO_DATE('15/04/2020', 'DD/MM/YYYY'), TO_DATE('14/09/2023', 'DD/MM/YYYY'), 3500.00, 'PLN', '81225735768075648085568862', 7);
INSERT INTO umowa VALUES (8, 'Umowa o dzielo', TO_DATE('01/05/2020', 'DD/MM/YYYY'), TO_DATE('30/11/2023', 'DD/MM/YYYY'), 2500.00, 'PLN', '67653665501082115209853538', 8);
INSERT INTO umowa VALUES (9, 'Umowa o prace', TO_DATE('15/05/2020', 'DD/MM/YYYY'), TO_DATE('14/07/2023', 'DD/MM/YYYY'), 9000.00, 'PLN', '76886283123658172983883773', 9);
INSERT INTO umowa VALUES (10, 'Umowa zlecenie', TO_DATE('01/06/2020', 'DD/MM/YYYY'), TO_DATE('30/06/2023', 'DD/MM/YYYY'), 4000.00, 'PLN', '11856680304593126427071469', 10);
INSERT INTO umowa VALUES (11, 'Umowa o prace', TO_DATE('15/06/2020', 'DD/MM/YYYY'), TO_DATE('14/06/2023', 'DD/MM/YYYY'), 10000.00, 'PLN', '17422358650479298198881168', 11);
INSERT INTO umowa VALUES (12, 'Umowa o prace', TO_DATE('01/02/2020', 'DD/MM/YYYY'), TO_DATE('02/08/2024', 'DD/MM/YYYY'), 1500.00, 'PLN', '18791227056329095742731397', 9);
INSERT INTO umowa VALUES (13, 'Umowa o prace', TO_DATE('03/01/2020', 'DD/MM/YYYY'), TO_DATE('03/09/2023', 'DD/MM/YYYY'), 4500.00, 'PLN', '26131575820943726087651672', 10);
INSERT INTO umowa VALUES (14, 'Umowa zlecenie', TO_DATE('04/01/2019', 'DD/MM/YYYY'), TO_DATE('05/01/2024', 'DD/MM/YYYY'), 2500.00, 'PLN', '71154777241188311909917482', 11);
INSERT INTO umowa VALUES (15, 'Umowa o prace', TO_DATE('05/01/2019', 'DD/MM/YYYY'), TO_DATE('05/01/2024', 'DD/MM/YYYY'), 5500.00, 'PLN', '98344455810588883162463535', 12);
INSERT INTO umowa VALUES (16, 'Umowa o dzielo', TO_DATE('06/01/2019', 'DD/MM/YYYY'), TO_DATE('06/09/2024', 'DD/MM/YYYY'), 2000.00, 'PLN', '83650016200384465969328416', 13);
INSERT INTO umowa VALUES (17, 'Umowa o prace', TO_DATE('07/01/2020', 'DD/MM/YYYY'), TO_DATE('08/01/2023', 'DD/MM/YYYY'), 2500.00, 'PLN', '45410426764591248789371938', 14);
INSERT INTO umowa VALUES (18, 'Umowa o prace', TO_DATE('01/01/2019', 'DD/MM/YYYY'), TO_DATE('01/01/2024', 'DD/MM/YYYY'), 3500.00, 'PLN', '38253693209852240835093435', 15);
INSERT INTO umowa VALUES (19, 'Umowa o prace', TO_DATE('01/01/2020', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 5000, 'PLN', '84026707055835615918338554', 16);
INSERT INTO umowa VALUES (20, 'Umowa o prace', TO_DATE('01/05/2020', 'DD/MM/YYYY'), TO_DATE('30/06/2023', 'DD/MM/YYYY'), 1500, 'PLN', '77813178545287584008718743', 17);
INSERT INTO umowa VALUES (21, 'Umowa o dzieło', TO_DATE('01/06/2020', 'DD/MM/YYYY'), TO_DATE('30/06/2023', 'DD/MM/YYYY'), 1200, 'PLN', '21097938378222380885222533', 18);
INSERT INTO umowa VALUES (22, 'Umowa o prace', TO_DATE('01/01/2020', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 4800, 'PLN', '58585634819433082445292774', 20);
INSERT INTO umowa VALUES (23, 'Umowa zlecenie', TO_DATE('01/07/2020', 'DD/MM/YYYY'), TO_DATE('31/08/2023', 'DD/MM/YYYY'), 2000, 'PLN', '52053105637292978243200073', 19);
INSERT INTO umowa VALUES (24, 'Umowa o dzielo', TO_DATE('01/08/2020', 'DD/MM/YYYY'), TO_DATE('31/08/2023', 'DD/MM/YYYY'), 1000, 'PLN', '26674018980335633694453531', 21);
INSERT INTO umowa VALUES (25, 'Umowa o prace', TO_DATE('01/01/2020', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 550, 'EUR', '1234567890123456789032111', 22);
INSERT INTO umowa VALUES (26, 'Umowa o prace', TO_DATE('01/01/2023', 'DD/MM/YYYY'), TO_DATE('31/12/2024', 'DD/MM/YYYY'), 5000, 'PLN', '90136376833377483098469932', 23);
INSERT INTO umowa VALUES (27, 'Umowa o dzielo', TO_DATE('01/04/2023', 'DD/MM/YYYY'), TO_DATE('30/09/2023', 'DD/MM/YYYY'), 1000, 'PLN', '71112865289982957943675528', 24);
INSERT INTO umowa VALUES (28, 'Umowa zlecenie', TO_DATE('15/06/2023', 'DD/MM/YYYY'), TO_DATE('30/06/2023', 'DD/MM/YYYY'), 3000, 'PLN', '12346544876015376340532097', 1);
INSERT INTO umowa VALUES (29, 'Umowa o prace', TO_DATE('01/05/2023', 'DD/MM/YYYY'), TO_DATE('31/07/2023', 'DD/MM/YYYY'), 1500, 'PLN', '46249166302782380112201786', 2);
INSERT INTO umowa VALUES (30, 'Umowa o prace', TO_DATE('01/01/2023', 'DD/MM/YYYY'), TO_DATE('31/12/2023', 'DD/MM/YYYY'), 6000, 'PLN', '68979948084147869490664187', 6);

INSERT INTO dane_logowania VALUES (1, 'jkowalski', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (2, 'anowak', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (3, 'pwojcik', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (4, 'mkaczmarek', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (5, 'tlewandowski', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (6, 'adabrowska', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (7, 'mzielinski', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (8, 'mszymanska', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (9, 'mwozniak', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (10, 'kkaminska', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (11, 'pkozlowski', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (12, 'bkowalczyk', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (13, 'pnowak', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (14, 'akowalska', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (15, 'mkaczmarek1', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (16, 'klewandowska', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (17, 'twojcik', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (18, 'kdabrowska', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (19, 'kzielinski', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (20, 'wszymanska', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (21, 'rkrupa', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (22, 'mpawlak', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (23, 'jmichalski', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (24, 'dwitkowska', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (25, 'jkowalski@firma.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);
INSERT INTO dane_logowania VALUES (26, 'anowak@firma.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', NULL);

INSERT INTO pracownik_logowanie VALUES(1, 1);
INSERT INTO pracownik_logowanie VALUES(1, 25);
INSERT INTO pracownik_logowanie VALUES(2, 2);
INSERT INTO pracownik_logowanie VALUES(2, 26);
INSERT INTO pracownik_logowanie VALUES(3, 3);
INSERT INTO pracownik_logowanie VALUES(4, 4);
INSERT INTO pracownik_logowanie VALUES(5, 5);
INSERT INTO pracownik_logowanie VALUES(6, 6);
INSERT INTO pracownik_logowanie VALUES(7, 7);
INSERT INTO pracownik_logowanie VALUES(8, 8);
INSERT INTO pracownik_logowanie VALUES(9, 9);
INSERT INTO pracownik_logowanie VALUES(10, 10);
INSERT INTO pracownik_logowanie VALUES(11, 11);
INSERT INTO pracownik_logowanie VALUES(12, 12);
INSERT INTO pracownik_logowanie VALUES(13, 13);
INSERT INTO pracownik_logowanie VALUES(14, 14);
INSERT INTO pracownik_logowanie VALUES(15, 15);
INSERT INTO pracownik_logowanie VALUES(16, 16);
INSERT INTO pracownik_logowanie VALUES(17, 17);
INSERT INTO pracownik_logowanie VALUES(18, 18);
INSERT INTO pracownik_logowanie VALUES(19, 19);
INSERT INTO pracownik_logowanie VALUES(20, 20);
INSERT INTO pracownik_logowanie VALUES(21, 21);
INSERT INTO pracownik_logowanie VALUES(22, 22);
INSERT INTO pracownik_logowanie VALUES(23, 23);
INSERT INTO pracownik_logowanie VALUES(24, 24);

commit;