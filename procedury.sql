CREATE OR REPLACE PROCEDURE przypisz_benefit (emp_id NUMBER, benef_id NUMBER, new_date_end DATE)
AS
    curr_emp_id    NUMBER;
    end_date    DATE;
BEGIN
    SELECT id_pracownika, data_odebrania
    INTO curr_emp_id, end_date
    FROM benefit_t
    WHERE id_benefitu = benef_id;

    IF curr_emp_id IS NOT NULL AND curr_emp_id != emp_id AND end_date > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001,'Benefit jest przypisany aktualnie do innego pracownika');
    END IF;
    
    IF end_date > new_date_end THEN
        RAISE_APPLICATION_ERROR(-20001,'Nowa data odebrania nie może być wcześniejsza od aktualnej');
    END IF;
    
    UPDATE benefit_t
    SET data_odebrania = new_date_end
    WHERE id_benefitu = benef_id;
    
    IF curr_emp_id IS NULL OR curr_emp_id != emp_id THEN
        UPDATE benefit_t
        SET id_pracownika = emp_id, data_przyznania = SYSDATE
        WHERE id_benefitu = benef_id;
    END IF;
END;
/


CREATE OR REPLACE PROCEDURE odblokuj_pracownika (emp_id NUMBER)
AS
BEGIN    
    UPDATE pracownik
    SET zablokowany = 0
    WHERE id_pracownika = emp_id;
END;
/



commit;
