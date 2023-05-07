CREATE OR REPLACE TRIGGER usun_benefity_trigger 
BEFORE DELETE ON pracownik
FOR EACH ROW 
BEGIN   
    UPDATE benefit
    SET id_pracownika = NULL
    WHERE id_pracownika = :old.id_pracownika;
END;
/
CREATE OR REPLACE TRIGGER nie_usuwaj_przypisanego_benefitu_trigger
BEFORE DELETE ON benefit
FOR EACH ROW 
BEGIN   
    if :old.id_pracownika IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20001,'Nie można usunąć przydzielonego benefitu.');
    END IF;
END;
/
commit;
