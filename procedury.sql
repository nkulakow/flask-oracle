CREATE OR REPLACE PROCEDURE przypisz_benefit (emp_id NUMBER, benef_id NUMBER, date_end DATE)
AS
    curr_emp_id    NUMBER;
    end_date    DATE;
BEGIN
    SELECT id_pracownika, data_odebrania
    INTO curr_emp_id, end_date
    FROM benefit
    WHERE id_benefitu = benef_id;

    IF curr_emp_id IS NOT NULL AND curr_emp_id != emp_id AND end_date > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001,'Benefit jest przypisany aktualnie do innego pracownika');
    END IF;
    
    UPDATE benefit
    SET data_odebrania = date_end
    WHERE id_benefitu = benef_id;
    
    IF curr_emp_id IS NULL OR curr_emp_id != emp_id THEN
        UPDATE benefit
        SET id_pracownika = emp_id, data_przyznania = SYSDATE
        WHERE id_benefitu = benef_id;
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE zablokuj_pracownika (emp_id NUMBER)
AS
    l_zespolow    NUMBER;
BEGIN
    --DLA LIDERA
    SELECT COUNT(*)
    INTO l_zespolow
    FROM zespol
    WHERE id_pracownika = emp_id AND (data_rozwiazania IS NULL OR data_rozwiazania > SYSDATE);

    IF l_zespolow > 0 THEN
        UPDATE zespol
        SET id_pracownika = NULL
        WHERE id_pracownika = emp_id AND (data_rozwiazania IS NULL OR data_rozwiazania > SYSDATE);
    END IF;
    
    UPDATE pracownik
    SET zablokowany = 1
    WHERE id_pracownika = emp_id;
END;
/

commit;
