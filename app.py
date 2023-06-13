from flask import Flask, render_template, request, redirect, url_for
from werkzeug.exceptions import BadRequestKeyError
from database_manager import DatabaseManager
from data_functions import *
from file_manager import *
import utilities
import resources.constants as const
import database_classes.Table as Table

app = Flask(__name__)
bd_info = read_bd_info_from_file()
database = DatabaseManager(bd_info[0], bd_info[1], bd_info[2])


@app.route('/viewpracownicy', methods=['POST', 'GET'])
def view_pracownicy():
    rows = database.get_all_pracownicy()
    try:
        phrase = request.form['fraza']
    except BadRequestKeyError:
        pass
    try:
        rows = filter_table_by_phrase(rows, phrase)
        return render_template('viewpracownicy.html',
                               rows=rows,
                               the_title="Pracownicy",
                               fraza=phrase)
    except UnboundLocalError:
        return render_template('viewpracownicy.html',
                               rows=rows,
                               the_title="Pracownicy",
                               fraza="")


@app.route('/modifypracownik', methods=['POST'])
def modify_pracownik():
    Id = request.form['id']
    demo_benefits = database.get_all_bonuses() #dostępne benefity
    demo_wnioski = database.get_all_applications(Id)
    demo_zespoły= database.get_all_teams()
    demo_positions = database.get_all_positions()
    return render_template('modifypracownicy.html', id=Id, benefity=demo_benefits,
                           applications=demo_wnioski, teams=demo_zespoły,
                           positions=demo_positions)


@app.route('/deletepracownikcheck', methods=['POST'])
def delete_pracownik_check():
    Id = request.form['id']
    return render_template('deletepracownik.html', id=Id)


@app.route('/deletepracownik', methods=['POST'])
def delete_pracownik():
    Id = request.form['id']
    database.delete_from_table(Table.TABLE_EMPLOYEE, Id)
    return redirect('/entry')


@app.route('/gotoaddpracownik', methods=['GET'])
def go_to_addpracownik():
    demo_positions = database.get_all_positions()
    demo_towns = database.get_all_towns()
    return render_template('addpracownik.html',
                           towns=demo_towns,
                           positions=demo_positions)


@app.route('/addpracownik', methods=['POST'])
def addpracownik():
    data = utilities.read_employee_data()
    database.insert_into_table(Table.TABLE_EMPLOYEE, data)
    return redirect('/entry')


@app.route('/givebenefittoppracownik', methods=['POST'])
def give_benefit():
    # @TODO dać benefit wybrany z modifypracownicy.html

    return redirect('/entry')


@app.route('/modifychosenapplication', methods=['POST'])
def modify_application():
    # @TODO zmienić status wniosku wybranego z modifypracownicy.html
    return redirect('/entry')


@app.route('/addtoteampracownik', methods=['POST'])
def add_to_team():
    # @TODO dodać do zespołu i może uczynić liderem, dane z modifypracownicy.html
    return redirect('/entry')


@app.route('/movetopositionpracownik', methods=['POST'])
def move_to_position():
    # @TODO zmienić stanowisko z modifypracownicy.html
    return redirect('/entry')


@app.route('/blockpracownik', methods=['POST'])
def block_pracownik():
    # @TODO jak się da zablokować pracownika z modifypracownicy.html
    return redirect('/entry')


@app.route('/modifyowndata', methods=['POST', 'GET'])
def go_to_modify_own_data():
    # @TODO dane postawowe z bd usera trzeba wysłać może być w postaci jak demo niżej
    demo_dane = ["id", "Imię", "Nazwisko", "Ulica", "Numer domu", "Numer mieszkania", "PESEL", "mail służbowy",
                 "id powiatu", "id miejscowości", "hasło"]
    # Tylko jeśli jako tabelka to w tej kolejności koniecznie, można też przekazać poprzez oddzielne zmienne
    return render_template('modifyowndata.html', data=demo_dane)


@app.route('/additionalcontactdetails', methods=['POST', 'GET'])
def go_to_additional_contact_details():
    # @TODO zaimplementować pobieranie dodatkowych danych kontaktowych usera z bd, może być jak wyżej
    return render_template('additionalcontactdetails.html', id=database.user_id)


@app.route('/saveadditionalcontactdetails', methods=['POST'])
def modify_additional_contact_details():
    # @TODO Zaimplementować dodawanie danych kontaktowych do pracownika o danych z additionalcontactdetails.html
    return redirect('/simpleentry')


@app.route('/addcertificatetoself', methods=['POST', 'GET'])
def go_to_add_certificate():
    # @TODO Pobieranie już dostępnych certyfikatów z bd i utworzenie jakieś tabelki [[str1, str2]] jak niżej
    demo_certs = [['0', 'certyfikat 1 jakis tam'], ['1', 'certyfikat inny i opis']]
    return render_template('addcertificate.html', certificates=demo_certs)


@app.route('/createnewcertificate', methods=['POST'])
def add_new_certificate_to_db():
    # @TODO Zaimplementować dodawanie certyfikatu do bazy danych a potem do pracownika o danych z addcertificate.html
    return redirect('/simpleentry')


@app.route('/addcertficatetopracownik', methods=['POST'])
def add_certificate_to_pracownik():
    # @TODO Zaimplementować dodawanie certyfikatu do pracownika o danych z addcertificate.html
    return redirect('/simpleentry')


@app.route('/manageselfapplications', methods=['POST', 'GET'])
def go_to_manage_self_applications():
    demo_wnioski_urlop = [[1, '11/02/2023', 'zalacznik.docx', 'R', '21/08/2023', '25/08/2023', 'zdrowotny']]
    demo_wnioski_bonus = [[103, '22/05/2022', 'aaaa.pdf', 'Z', 100, 1]]
    demo_wnioski_inne = [[]]
    # @TODO Zaimplementować dodawanie wniosków do gui jak wyżej przykład jest
    return render_template('manageselfapplications.html',
                           wnioski_urlop=demo_wnioski_urlop,
                           wnioski_bonus=demo_wnioski_bonus,
                           wnioski_inne=demo_wnioski_inne)


@app.route('/applyforvacation', methods=['POST', 'GET'])
def apply_for_vacation():
    # @TODO dodać wniosek o urlop o danych z manageselfapplications.html do bd
    return redirect('/simpleentry')


@app.route('/applyforbonus', methods=['POST', 'GET'])
def apply_for_bonus():
    # @TODO dodać wniosek o bonus o danych z manageselfapplications.html do bd
    return redirect('/simpleentry')


@app.route('/applyforsthelse', methods=['POST', 'GET'])
def apply_for_sth_else():
    # @TODO dodać wniosek inny o danych z manageselfapplications.html do bd
    return redirect('/simpleentry')


@app.route('/login_check', methods=['POST'])
def login_check():
    login = request.form['login']
    password = request.form['password']
    # @TODO w komentarzu
    """
    zaimplementować inaczej check login - musi sprawdzić czy jest kadrowym czy nie, 
    też imo by sie przydało zapisać imię i nazwisko do bd (mi z gui będzie łatwiej)
    """
    if database.check_login(login, password):
        if login == 'jkowalski':
            return redirect('/entry')
        else:
            return redirect('/simpleentry')
    else:
        return redirect(url_for('login_page', title="Zły login i/lub password"))


@app.route('/entry')
def entry_page():
    return render_template('entry.html',
                           the_title=f'Witamy na stronie internetowej!')


@app.route('/simpleentry')
def simple_entry_page():
    return render_template('simpleentry.html',
                           the_title=f'Witamy na stronie internetowej!')


@app.route('/')
def login_page():
    title_new = request.args.get('title')
    if title_new is None:
        title_new = "Witamy!"
    return render_template('loginpage.html',
                           the_title=title_new)


if __name__ == '__main__':
    app.run(debug=True)
