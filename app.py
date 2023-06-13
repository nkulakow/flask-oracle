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
    data = utilities.read_employee_data(database.gen_next_id(Table.TABLE_EMPLOYEE))
    database.insert_into_table(Table.TABLE_EMPLOYEE, data[:-2])
    login_id = database.gen_next_id(Table.TABLE_LOGIN_DATA)
    contact_id = database.gen_next_id(Table.TABLE_CONTACT_DATA)
    emp_id = data[0]
    database.insert_into_table(Table.TABLE_LOGIN_DATA, [login_id, f"{data[-2]}", f"{data[-1]}", 'NULL'])
    database.insert_into_table(Table.TABLE_EMPLOYEE_LOGIN, [emp_id, login_id])
    database.insert_into_table(Table.TABLE_CONTACT_DATA, [contact_id, 'NULL', 'NULL', 'NULL', emp_id])
    return redirect('/entry')


@app.route('/givebenefittoppracownik', methods=['POST'])
def give_benefit():
    employee_id = request.form['id']
    benefit_id = request.form['benefit_id']
    date = request.form['return_date']
    database.give_benefit(employee_id, benefit_id, date)
    return redirect('/entry')


@app.route('/modifychosenapplication', methods=['POST'])
def modify_application():
    application_id = request.form['application_id']
    status = request.form['status']
    database.change_application_status(application_id, status)
    return redirect('/entry')


@app.route('/addtoteampracownik', methods=['POST'])
def add_to_team():
    emp_id = request.form['id']
    team_id = request.form['team_id']
    make_leader = request.form['is_leader']
    database.assign_to_team(emp_id, team_id)
    if make_leader == "1":
        database.make_leader(emp_id, team_id)
    return redirect('/entry')


@app.route('/movetopositionpracownik', methods=['POST'])
def move_to_position():
    emp_id = request.form['id']
    position_id = request.form['position_id']
    database.change_position(emp_id, position_id)
    return redirect('/entry')


@app.route('/blockpracownik', methods=['POST'])
def block_pracownik():
    emp_id = request.form['id']
    database.block_employee(emp_id)
    return redirect('/entry')


@app.route('/modifyowndata', methods=['POST', 'GET'])
def go_to_modify_own_data():
    demo_dane = database.get_user_data()
    return render_template('modifyowndata.html', data=demo_dane)


@app.route('/saveownmodification', methods=['POST', 'GET'])
def save_own_modification():
  name = request.form['name']
  surname = request.form['surname']
  pesel = request.form['pesel']
  mail = request.form['mail']
  database.save_user_data([name, surname, pesel, mail])
  return redirect('/simpleentry')


@app.route('/additionalcontactdetails', methods=['POST', 'GET'])
def go_to_additional_contact_details():
    demo_dane = database.get_user_contact_data()
    return render_template('additionalcontactdetails.html', data=demo_dane)


@app.route('/saveadditionalcontactdetails', methods=['POST'])
def modify_additional_contact_details():
    phone_num = request.form['phone_nr']
    fax = request.form['fax']
    private_mail = request.form['private_mail']
    database.save_user_contact_data([phone_num, fax, private_mail])
    return redirect('/simpleentry')


@app.route('/addcertificatetoself', methods=['POST', 'GET'])
def go_to_add_certificate():
    demo_certs = database.get_all_certificates()
    return render_template('addcertificate.html', certificates=demo_certs)


@app.route('/addcertficatetopracownik', methods=['POST'])
def add_certificate_to_pracownik():
    cert_id = request.form['certificate_id']
    date = request.form['receive_date']
    database.assign_certificate(cert_id, date)
    return redirect('/simpleentry')


@app.route('/createnewcertificate', methods=['POST'])
def add_new_certificate_to_db():
    id = database.gen_next_id(Table.TABLE_CERTIFICATE)
    name = request.form['name']
    hours = request.form['hours_nr']
    description = request.form['description']
    issuer = request.form['issuer']
    date = request.form['receive_date']
    database.insert_into_table(Table.TABLE_CERTIFICATE, [id, f"'{name}'", hours, f"'{description}'", f"'{issuer}'"])
    database.assign_certificate(id, date)
    return redirect('/simpleentry')


@app.route('/manageselfapplications', methods=['POST', 'GET'])
def go_to_manage_self_applications():
    demo_wnioski_urlop = database.get_user_holiday_applications()
    demo_wnioski_bonus = database.get_user_bonus_applications()
    demo_wnioski_inne = database.get_user_other_applications()
    return render_template('manageselfapplications.html',
                           wnioski_urlop=demo_wnioski_urlop,
                           wnioski_bonus=demo_wnioski_bonus,
                           wnioski_inne=demo_wnioski_inne)


@app.route('/applyforvacation', methods=['POST', 'GET'])
def apply_for_vacation():
    id = database.gen_next_id(Table.TABLE_APPLICATION)
    date_applied = 'SYSDATE'
    attachment = request.form['filename']
    status = 'wyslany'
    emp_id = database.user_id
    date_begin = request.form['date_start']
    date_end = request.form['date_end']
    type = request.form['type']
    database.insert_into_table(Table.TABLE_APPLICATION, [id, date_applied, f"'{attachment}'", f"'{status}'", emp_id])
    database.insert_into_table(Table.TABLE_APPLICATION_HOLIDAY, [id, f"TO_DATE('{date_begin}', 'YYYY/MM/DD')", f"TO_DATE('{date_end}', 'YYYY/MM/DD')", f"'{type}'"])
    return redirect('/simpleentry')


@app.route('/applyforbonus', methods=['POST', 'GET'])
def apply_for_bonus():
    id = database.gen_next_id(Table.TABLE_APPLICATION)
    date_applied = 'SYSDATE'
    attachment = request.form['filename']
    status = 'wyslany'
    emp_id = database.user_id
    rate = request.form['rate']
    once = request.form['once']
    database.insert_into_table(Table.TABLE_APPLICATION, [id, date_applied, f"'{attachment}'", f"'{status}'", emp_id])
    database.insert_into_table(Table.TABLE_APPLICATION_BONUS, [id, rate, once])
    return redirect('/simpleentry')


@app.route('/applyforsthelse', methods=['POST', 'GET'])
def apply_for_sth_else():
    # @TODO dodać wniosek inny o danych z manageselfapplications.html do bd
    id = database.gen_next_id(Table.TABLE_APPLICATION)
    date_applied = 'SYSDATE'
    attachment = request.form['filename']
    status = 'wyslany'
    emp_id = database.user_id
    description = request.form['description']
    database.insert_into_table(Table.TABLE_APPLICATION, [id, date_applied, f"'{attachment}'", f"'{status}'", emp_id])
    database.insert_into_table(Table.TABLE_APPLICATION_OTHER, [id, f"'{description}'"])
    return redirect('/simpleentry')


@app.route('/login_check', methods=['POST'])
def login_check():
    login = request.form['login']
    password = request.form['password']
    if not database.check_login(login, password):
        return redirect(url_for('login_page', title="Zły login i/lub hasło"))
    if database.is_user_staff():
        return redirect('/entry')
    return redirect('/simpleentry')


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
