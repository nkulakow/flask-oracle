-- 3 Testy wstawienia
-- 3.1.1 Dla tabeli benefit z podtypami 
DECLARE
    counter number;
    err_msg VARCHAR2(64);
BEGIN
    INSERT INTO benefit_t VALUES (14, 'Premia', NULL, NULL, NULL);
    INSERT INTO premia_t VALUES (14, 700);

    select count(*) into counter from benefit_t where benefit_t.id_benefitu = 14;
    Assert(counter, 'Data was inserted incorrectly into benefit_t table');

    select count(*) into counter from premia_t where premia_t.id_benefitu = 14;
    Assert(counter, 'Data was inserted incorrectly into premia_t table');

    select count(*) into counter from BENEFIT where id_benefitu = 14;
    Assert(case when counter = 0 then 1 else 0 end, 'Data is visible inside materalized view before commiting');

    commit;

    select count(*) into counter from BENEFIT where id_benefitu = 14;
    Assert(counter, 'Materilzed view did not update after commiting');

    delete from premia_t where id_benefitu = 14;
    delete from benefit_t where id_benefitu = 14;

    commit;
EXCEPTION
WHEN OTHERS THEN
    rollback;
    delete from premia_t where id_benefitu = 14;
    delete from benefit_t where id_benefitu = 14;
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/

-- 3.1.2 Dla tabeli wniosek z podtypami
DECLARE
    counter number;
    err_msg VARCHAR2(64);
BEGIN
    INSERT INTO wniosek_t VALUES (10, TO_DATE('11/09/2024', 'DD/MM/YYYY'), NULL, 'rozpatrywany', 1);
    INSERT INTO wniosek_bonus_t VALUES (10, 500, 0);

    select count(*) into counter from WNIOSEK where id_wniosku = 10;
    Assert(case when counter = 0 then 1 else 0 end, 'Dane sa widoczne w zmaterializowany widoku przed commitem');

    commit;

    select count(*) into counter from WNIOSEK where id_wniosku = 10;
    Assert(counter, 'Widok WNIOSEK nie zaktualizowal sie po commitcie');

    delete from wniosek_bonus_t where id_wniosku = 10;
    delete from wniosek_t where id_wniosku = 10;
    commit;
EXCEPTION
WHEN OTHERS THEN
    rollback;
    delete from wniosek_bonus_t where id_wniosku = 10;
    delete from wniosek_t where id_wniosku = 10;
    commit;
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/

-- 3.2.1 Wstawienie danych dla tabeli umowa bez pod typow
DECLARE
    counter NUMBER;
    err_msg VARCHAR2(64);
BEGIN
    INSERT INTO umowa VALUES (31, 'B2B', TO_DATE('01/02/2022', 'DD/MM/YYYY'), TO_DATE('06/03/2027', 'DD/MM/YYYY'), 3500.00, 'USD', '12345678910111213141516171', 24);

    SELECT count(*) INTO counter FROM umowa WHERE id_umowy = 31;
    Assert(counter, 'Dane nie zosatly dodane do tabeli umowa');

    DELETE FROM umowa WHERE id_umowy = 31;
EXCEPTION
WHEN OTHERS THEN
    DELETE FROM umowa WHERE id_umowy = 31;
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/

-- 3.2.2 Wstawienie danych dla tebeli certyfikat bez pod typow
DECLARE
    counter NUMBER;
    err_msg VARCHAR2(64);
BEGIN
    SELECT count(*) INTO counter FROM certyfikat WHERE id_certyfikatu = 100;
    Assert(CASE WHEN counter = 0 THEN 1 ELSE 0 END, 'W tabeli istnieje juz certyfikat o tym id');
    
    INSERT INTO certyfikat VALUES (100, 'C1 Advaced English', NULL, 'Miedzynarodowy test z jezyka angielskiego', 'Cambridge Assesment');

    SELECT count(*) INTO counter FROM certyfikat WHERE id_certyfikatu = 100;
    Assert(counter, 'Dane nie zosatly dodane do tabeli certyfikat');

    DELETE FROM certyfikat WHERE id_certyfikatu = 100;
EXCEPTION
WHEN OTHERS THEN
    DELETE FROM certyfikat WHERE id_certyfikatu = 100;
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/

-- 4 Testy aktualizacji
-- 4.1 Aktualizowanie tabeli z podtypami
DECLARE
    n_benf benefit_t.nazwa%TYPE;
    new_n_benf benefit_t.nazwa%TYPE := 'Motor';
    mar samochod_t.marka%TYPE;
    new_mar samochod_t.marka%TYPE := 'Honda';
    temp VARCHAR2(20);
    err_msg VARCHAR2(64);
BEGIN
    SELECT nazwa INTO n_benf FROM benefit_t WHERE id_benefitu = 1;
    SELECT marka INTO mar FROM samochod_t WHERE id_benefitu = 1;
    Assert(CASE WHEN n_benf != new_n_benf THEN 1 ELSE 0 END, 'Nowa nazwa benefitu jest taka sama jak jego aktualna');
    Assert(CASE WHEN mar != new_mar THEN 1 ELSE 0 END, 'Nowa marka pojazdu jest taka sama jak jego aktualna');

    UPDATE benefit_t SET  nazwa = new_n_benf WHERE id_benefitu = 1;
    UPDATE samochod_t SET  marka = new_mar WHERE id_benefitu = 1;
    COMMIT;
    
    SELECT nazwa INTO temp FROM benefit_t WHERE id_benefitu = 1;
    Assert(CASE WHEN temp = new_n_benf THEN 1 ELSE 0 END, 'Nazwa benefitu nie zaktualizowala sie w tabeli benefit_t');
    
    SELECT marka INTO temp FROM samochod_t WHERE id_benefitu = 1;
    Assert(CASE WHEN temp = new_mar THEN 1 ELSE 0 END, 'Marka benefitu nie zaktualizowala sie w tabeli samochod_t');
    
    SELECT nazwa INTO temp FROM benefit WHERE id_benefitu = 1;
    Assert(CASE WHEN temp = new_n_benf THEN 1 ELSE 0 END, 'Nazwa benefitu nie zaktualizowala sie w widoki benefit');
    SELECT marka INTO temp FROM benefit WHERE id_benefitu = 1;
    Assert(CASE WHEN temp = new_mar THEN 1 ELSE 0 END, 'Marka benefitu nie zaktualizowala sie w widoku benefit');
    
    UPDATE benefit_t SET  nazwa = n_benf WHERE id_benefitu = 1;
    UPDATE samochod_t SET  marka = mar WHERE id_benefitu = 1;
    COMMIT;
EXCEPTION
WHEN OTHERS THEN
    UPDATE benefit_t SET  nazwa = n_benf WHERE id_benefitu = 1;
    UPDATE samochod_t SET  marka = mar WHERE id_benefitu = 1;
    COMMIT;
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/

-- 4.2 Aktualizowanie tabeli bez podtypow
DECLARE
    n_proj zespol.nazwa_projektu%TYPE;
    new_n_proj zespol.nazwa_projektu%TYPE := 'Minix destroyer';
    err_msg VARCHAR2(64);
BEGIN
    SELECT nazwa_projektu INTO n_proj FROM zespol WHERE id_zespolu = 1;
    Assert(CASE WHEN n_proj != new_n_proj THEN 1 ELSE 0 END, 'Nowa nazwa zespolu jest taka sama jak jego aktualna');

    UPDATE zespol SET nazwa_projektu = new_n_proj;
    
    SELECT nazwa_projektu INTO n_proj FROM zespol WHERE id_zespolu = 1;
    Assert(CASE WHEN n_proj = new_n_proj THEN 1 ELSE 0 END, 'Dane nie zostaly zaktualizowane w poprawny sposob');
    
    ROLLBACK;
EXCEPTION
WHEN OTHERS THEN
    ROLLBACK;
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/

-- 5 Testy usuwania
-- 5.1 Usuwanie danych z tabeli z podtypami
DECLARE
counter number;
err_msg VARCHAR2(64);
BEGIN
    INSERT INTO benefit_t VALUES (100, 'Premia', NULL, NULL, NULL);
    INSERT INTO premia_t VALUES (100, 700);
    COMMIT;
    
    DELETE FROM premia_t WHERE id_benefitu = 100;
    DELETE FROM benefit_t WHERE id_benefitu = 100;
    COMMIT;

    SELECT count(*) INTO counter FROM benefit_t WHERE benefit_t.id_benefitu = 100;
    Assert(CASE WHEN counter = 0 THEN 1 ELSE 0 END, 'Dane nie zosatly usuniete w poprawny sposob z benefit_t');

    SELECT count(*) INTO counter FROM premia_t WHERE premia_t.id_benefitu = 100;
    Assert(CASE WHEN counter = 0 THEN 1 ELSE 0 END, 'Dane nie zosatly usuniete w poprawny sposob z premia_t');
    
    SELECT count(*) INTO counter FROM BENEFIT WHERE id_benefitu = 100;
    Assert(CASE WHEN counter = 0 THEN 1 ELSE 0 END, 'Widok nie zaktualizowal sie po commitcie');
EXCEPTION
WHEN OTHERS THEN
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/


-- 5.2 Usuwanie z tabeli bez podtypow
DECLARE
counter number;
err_msg VARCHAR2(64);
BEGIN
    INSERT INTO umowa VALUES (100, 'Umowa o prace', TO_DATE('01/02/2020', 'DD/MM/YYYY'), TO_DATE('01/01/2050', 'DD/MM/YYYY'), 10000.00, 'PLN', '12345678910111213141516171', 24);
    DELETE FROM umowa WHERE id_umowy = 100;
    
    SELECT count(*) INTO counter FROM umowa WHERE id_umowy = 100;
    Assert(CASE WHEN counter = 0 THEN 1 ELSE 0 END, 'Dane nie zosatly usuniete z tabeli umowa');
EXCEPTION
WHEN OTHERS THEN
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/


-- 6. Testy wprowadzonych ogranicze?/zabezpiecze?/procedur
-- 6.1 Usuniecie lidera (zwraca blad)
DECLARE
    err_msg VARCHAR2(74);
BEGIN
    DELETE FROM pracownik WHERE id_pracownika = 4;
EXCEPTION
WHEN OTHERS THEN
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/

-- 6.2 Zablokowanie lidera
DECLARE
    err_msg VARCHAR2(64);
    id_zesp zespol.id_zespolu%TYPE;
    id_lid pracownik.id_pracownika%TYPE := 4;
BEGIN
    SELECT id_zespolu INTO id_zesp FROM zespol WHERE id_lidera = id_lid;
    UPDATE pracownik SET zablokowany = 1 WHERE id_pracownika = id_lid;
    SELECT id_lidera INTO id_lid FROM zespol WHERE id_zespolu = id_zesp;
    Assert(CASE WHEN id_lid IS NULL THEN 1 ELSE 0 END,  'Id lidera nie zostalo ustawione na null po jego zablokowaniu');
    ROLLBACK;
EXCEPTION
WHEN OTHERS THEN
    ROLLBACK;
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/

-- 6.3 Usuniecie przypisanego benefitu (zwraca blad)
DECLARE 
    err_msg VARCHAR2(74);
BEGIN
    DELETE FROM benefit_t WHERE id_benefitu = 1;
EXCEPTION
WHEN OTHERS THEN
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/

-- 6.4 Przypisanie benefitu
-- Wersja 1 poprawne przypisanie benefitu i pracownika gdy nie byl on przypisany do niczego innego z data przyszla
DECLARE 
    err_msg VARCHAR2(128);
    emp_id NUMBER := 1;
    other_emp_id NUMBER;
    benef_id NUMBER := 5;
    date_end DATE := SYSDATE + 1;
    other_date DATE;
BEGIN
    SELECT id_pracownika INTO other_emp_id FROM benefit_t WHERE id_benefitu = benef_id;
    Assert(CASE WHEN other_emp_id IS NULL THEN 1 ELSE 0 END, 'Ten test jest wykonywany ze zlym id benefitu poniewaz jest on juz przypisany do danego pracownika - wybierz inny benefit');
    
    przypisz_benefit(emp_id, benef_id, date_end);
    
    SELECT id_pracownika INTO other_emp_id FROM benefit_t WHERE id_benefitu = benef_id;
    Assert(CASE WHEN other_emp_id IS NOT NULL THEN 1 ELSE 0 END, 'Benefit nie zostal przypisany do zadnego pracownika');
    
    SELECT data_przyznania INTO other_date FROM benefit_t WHERE id_benefitu = benef_id;
    Assert(CASE WHEN other_date = SYSDATE THEN 1 ELSE 0 END, 'Nowa data przyznania nie zostala ustawiona na date dzisiejsza');
    
    SELECT data_odebrania INTO other_date FROM benefit_t WHERE id_benefitu = benef_id;
    Assert(CASE WHEN other_date = date_end THEN 1 ELSE 0 END, 'Data odebrania nie zostala ustawiona na nowa podana w  wywolaniu procedury');
    ROLLBACK;
EXCEPTION
WHEN OTHERS THEN
    ROLLBACK;
    err_msg := SUBSTR(SQLERRM, 1, 128);
    dbms_output.put_line(err_msg);
END;
/

-- Wersja 2 Przedluzenie benefitu ktory juz byl przypisany do pracownika
DECLARE 
    err_msg VARCHAR2(128);
    emp_id NUMBER := 1;
    other_emp_id NUMBER;
    benef_id NUMBER := 1;
    date_end DATE := SYSDATE + 1;
    other_date DATE;
BEGIN
    SELECT id_pracownika INTO other_emp_id FROM benefit_t WHERE id_benefitu = benef_id;
    Assert(CASE WHEN other_emp_id = emp_id THEN 1 ELSE 0 END, 'Ten benefit nie jest przypisany do tego pracownika w wywolaniu');
    
    przypisz_benefit(emp_id, benef_id, date_end);
    
    SELECT id_pracownika INTO other_emp_id FROM benefit_t WHERE id_benefitu = benef_id;
    Assert(CASE WHEN other_emp_id IS NOT NULL THEN 1 ELSE 0 END, 'Benefit nie zostal przypisany do zadnego pracownika');
    
    SELECT data_odebrania INTO other_date FROM benefit_t WHERE id_benefitu = benef_id;
    Assert(CASE WHEN other_date = date_end THEN 1 ELSE 0 END, 'Data odebrania nie zostala ustawiona na now? podana w  wywolaniu procedury');
    ROLLBACK;
EXCEPTION
WHEN OTHERS THEN
    ROLLBACK;
    err_msg := SUBSTR(SQLERRM, 1, 128);
    dbms_output.put_line(err_msg);
END;
/

-- !!!!! Tymczasowa wersja testu moze do poprawy po zaimplementowaniu funkcji podobnej do catch
-- Wersja 3 przypisanie z data przeszla (zwraca blad)
DECLARE 
    err_msg VARCHAR2(128);
    emp_id NUMBER := 1;
    benef_id NUMBER := 5;
    date_end DATE := SYSDATE - 1;
BEGIN
    przypisz_benefit(emp_id, benef_id, date_end);
EXCEPTION
WHEN OTHERS THEN
    err_msg := SUBSTR(SQLERRM, 1, 128);
    dbms_output.put_line(err_msg);
END;
/

-- Wersja 4 Proba przypisania benefitu ktory juz byl przypisany do kogos innego
DECLARE 
    err_msg VARCHAR2(128);
    emp_id NUMBER := 5;
    benef_id NUMBER := 1;
    date_end DATE := SYSDATE + 1;
BEGIN
    przypisz_benefit(emp_id, benef_id, date_end);
EXCEPTION
WHEN OTHERS THEN
    err_msg := SUBSTR(SQLERRM, 1, 128);
    dbms_output.put_line(err_msg);
END;
/

-- Usuniecie pracownika
DECLARE
    err_msg VARCHAR2(128);
    emp_id NUMBER := 1;
    benef_count NUMBER;
    assert_num NUMBER;
BEGIN
    SELECT count(*) INTO benef_count FROM benefit_t;
    DELETE FROM pracownik WHERE id_pracownika = emp_id;
    SELECT count(id_wniosku) INTO assert_num FROM wniosek_t WHERE id_pracownika = emp_id;
    Assert(CASE WHEN assert_num = 0 THEN 1 ELSE 0 END, 'Wszytskie wnioski danego pracownika nie zostaly usuniete');
    
    SELECT count(id_danych) INTO assert_num FROM dane_kontaktowe WHERE id_pracownika = emp_id;
    Assert(CASE WHEN assert_num = 0 THEN 1 ELSE 0 END, 'Wszytskie dane kontaktowe danego pracownika nie zostaly usuniete');
    
    SELECT count(id_umowy) INTO assert_num FROM umowa WHERE id_pracownika = emp_id;
    Assert(CASE WHEN assert_num = 0 THEN 1 ELSE 0 END, 'Wszytskie umowy danego pracownika nie zostaly usuniete');
    
    SELECT count(id_pracownika) INTO assert_num FROM pracownik_logowanie WHERE id_pracownika = emp_id;
    Assert(CASE WHEN assert_num = 0 THEN 1 ELSE 0 END, 'Wszytskie dane do logowania danego pracownika nie zostaly usuniete');
    
    SELECT count(id_pracownika) INTO assert_num FROM zespol_pracownik WHERE id_pracownika = emp_id;
    Assert(CASE WHEN assert_num = 0 THEN 1 ELSE 0 END, 'Wszytskie przynaleznosci do zespolow danego pracownika nie zostaly usuniete');
    
    SELECT count(id_pracownika) INTO assert_num FROM zespol_pracownik WHERE id_pracownika = emp_id;
    Assert(CASE WHEN assert_num = 0 THEN 1 ELSE 0 END, 'Wszytskie przynaleznosci do zespolow danego pracownika nie zostaly usuniete');
    
    SELECT count(id_pracownika) INTO assert_num FROM certyfikat_pracownik WHERE id_pracownika = emp_id;
    Assert(CASE WHEN assert_num = 0 THEN 1 ELSE 0 END, 'Wszytskie certyfikaty danego pracownika nie zostaly usuniete');
    
    SELECT count(id_pracownika) INTO assert_num FROM benefit_t WHERE id_pracownika = emp_id;
    Assert(CASE WHEN assert_num = 0 THEN 1 ELSE 0 END, 'Nie wszystkie id tego pracownika zostaly ustawione na null po jego usunieciu');
    
    SELECT count(*) INTO assert_num FROM benefit_t;
    Assert(CASE WHEN assert_num = benef_count THEN 1 ELSE 0 END, 'Usuniecie pracownika zmienilo ilosc benefitow w tabeli');
    ROLLBACK;
EXCEPTION
WHEN OTHERS THEN
    ROLLBACK;
    err_msg := SUBSTR(SQLERRM, 1, 128);
    dbms_output.put_line(err_msg);
END;
/
