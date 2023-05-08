create or replace TRIGGER usun_benefit_tabela_glowna_trigger
BEFORE DELETE ON benefit_t
FOR EACH ROW 
BEGIN   
    if :old.id_pracownika IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20001,'Nie można usunąć przydzielonego benefitu.');
    END IF;
    
    DELETE FROM inny_benefit_t WHERE id_benefitu = :old.id_benefitu;
    DELETE FROM premia_t WHERE id_benefitu = :old.id_benefitu;
    DELETE FROM samochod_t WHERE id_benefitu = :old.id_benefitu;
    DELETE FROM urzadzenie_elektroniczne_t WHERE id_benefitu = :old.id_benefitu;
END;
/


CREATE OR REPLACE TRIGGER usuwanie_lidera_trigger 
BEFORE DELETE ON pracownik
FOR EACH ROW 
DECLARE
    nmb NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO nmb
    FROM zespol
    WHERE id_lidera = :old.id_pracownika AND (data_rozwiazania IS NULL OR data_rozwiazania > SYSDATE);

    IF nmb > 0 THEN
        RAISE_APPLICATION_ERROR(-20001,'Nie można usunąć pracownika, dopóki jest liderem zespołu.');
    END IF;
END;
/


create or replace TRIGGER usun_wniosek_tabela_glowna_trigger
BEFORE DELETE ON wniosek_t
FOR EACH ROW 
BEGIN       
    DELETE FROM wniosek_bonus_t WHERE id_wniosku = :old.id_wniosku;
    DELETE FROM wniosek_inny_t WHERE id_wniosku = :old.id_wniosku;
    DELETE FROM wniosek_urlop_t WHERE id_wniosku = :old.id_wniosku;
END;
/


create or replace TRIGGER usun_pracownika_trigger
BEFORE DELETE ON pracownik
FOR EACH ROW 
BEGIN
    UPDATE benefit_t
    SET id_pracownika = NULL
    WHERE id_pracownika = :old.id_pracownika;

    DELETE FROM wniosek_t where id_pracownika = :old.id_pracownika;
    DELETE FROM dane_kontaktowe where id_pracownika = :old.id_pracownika;
    DELETE FROM umowa where id_pracownika = :old.id_pracownika;
    DELETE FROM pracownik_logowanie where id_pracownika = :old.id_pracownika;
    DELETE FROM zespol_pracownik where id_pracownika = :old.id_pracownika;
    DELETE FROM certyfikat_pracownik where id_pracownika = :old.id_pracownika;
END;
/

commit;
