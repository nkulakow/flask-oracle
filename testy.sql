-- 3 Testy wstawienia
-- Dla tabeli z podtypami
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

select count(*) from benefit_t where benefit_t.id_benefitu = 14;

-- 6. Testy wprowadzonych ogranicze?/zabezpiecze?/procedur
-- 6.1 Usuni?cie lidera
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

-- Zablokowanie lidera
DECLARE
    err_msg VARCHAR2(64);
    id_zesp zespol.id_zespolu%TYPE;
    id_lid pracownik.id_pracownika%TYPE := 4;
BEGIN
    SELECT id_zespolu INTO id_zesp FROM zespol WHERE id_lidera = id_lid;
    UPDATE pracownik SET zablokowany = 1 WHERE id_pracownika = id_lid;
    SELECT id_lidera INTO id_lid FROM zespol WHERE id_zespolu = id_zesp;
    Assert(CASE WHEN id_lid IS NULL THEN 1 ELSE 0 END,  'Id lidera nie zosta?o ustawione na null po jego zablokowaniu');
    ROLLBACK;
EXCEPTION
WHEN OTHERS THEN
    ROLLBACK;
    err_msg := SUBSTR(SQLERRM, 1, 64);
    dbms_output.put_line(err_msg);
END;
/

-- Usuni?cie benefitu
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

-- Przypisanie benefitu
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
    Assert(CASE WHEN other_emp_id IS NULL THEN 1 ELSE 0 END, 'Ten test jest wykonywany ze z?ym id benefitu, poniewa? jest on ju? przypisany do danego pracownika - wybierz inny benefit');
    
    przypisz_benefit(emp_id, benef_id, date_end);
    
    SELECT id_pracownika INTO other_emp_id FROM benefit_t WHERE id_benefitu = benef_id;
    Assert(CASE WHEN other_emp_id IS NOT NULL THEN 1 ELSE 0 END, 'Benefit nie zosta? przypisany do ?adnego pracownika');
    
    SELECT data_przyznania INTO other_date FROM benefit_t WHERE id_benefitu = benef_id;
    Assert(CASE WHEN other_date = SYSDATE THEN 1 ELSE 0 END, 'Nowa data przyznania nie zosta?a ustawiona na dat? dzisiejsz?');
    
    SELECT data_odebrania INTO other_date FROM benefit_t WHERE id_benefitu = benef_id;
    Assert(CASE WHEN other_date = date_end THEN 1 ELSE 0 END, 'Data odebrania nie zosta?a ustawiona na now? podana w  wywo?aniu procedury');
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
    Assert(CASE WHEN other_emp_id IS NOT NULL THEN 1 ELSE 0 END, 'Benefit nie zosta? przypisany do ?adnego pracownika');
    
    SELECT data_odebrania INTO other_date FROM benefit_t WHERE id_benefitu = benef_id;
    Assert(CASE WHEN other_date = date_end THEN 1 ELSE 0 END, 'Data odebrania nie zosta?a ustawiona na now? podana w  wywo?aniu procedury');
    ROLLBACK;
EXCEPTION
WHEN OTHERS THEN
    ROLLBACK;
    err_msg := SUBSTR(SQLERRM, 1, 128);
    dbms_output.put_line(err_msg);
END;
/

-- !!!!! Tymczasowa wersja testu moze do poprawy po zaimplementowaniu funkcji podobnej do catch
-- Wersja 3 przypisanie z data przeszla
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

-- Wersja 4 Pr�ba przypisania benefitu ktory juz byl przypisany do kogos innego
DECLARE 
    err_msg VARCHAR2(128);
    emp_id NUMBER := 3;
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
