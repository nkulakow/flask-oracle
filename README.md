# BD2

## do aplikacji:  
Apka jest tak zrobiona że trza dane do bazy (username, password, servicename) w danej kolejności po enterach wpisać do pliku resources/dane_bazy.txt, przykładowo ja mam: 
   
system    
BD2pass   
TESTDB

Zakładam że każdy z nas będzie miał takie samo IP i port, najwyżej się zmieni
I tego pliku dane_bazy.txt nie wysyłajcie przypadkiem na gita, bo każdy może mieć inaczej - szczególnie ten service name
(jak coś to jest to używane na samym początku pliku app.py i w funkcji w pliku file_manager.py)

Apkę uruchamiamy poprzez app.py  

Jak was zapyta o login i hasło: no to możecie sb wybrać ze skryptów kogoś, np jkowalski, wszyscy mają takie same hasło : password.   


### kolejność odpalania skryptów:
1. create_tables_views.ddl
2. insertdata.sql
3. reszta

### ważne rzeczy:
1. commity! szczególnie po zmienianiu danych w tabelach które wpływają na widoki zmaterializowane - inaczej się nie zrefreshują
