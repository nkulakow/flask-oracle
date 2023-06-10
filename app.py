from flask import Flask, render_template, request, redirect, url_for
from werkzeug.exceptions import BadRequestKeyError
from database_manager import DatabaseManager
from data_functions import *
from file_manager import *

app = Flask(__name__)
bd_info = read_bd_info_from_file()
database = DatabaseManager(bd_info[0], bd_info[1], bd_info[2])


def search4vowels(phrase: str) -> set:
    vowels = set('aeiou')
    return vowels.intersection(set(phrase))


def search4letters(phrase: str, letters: str) -> set:
    return set(letters).intersection(set(phrase))


@app.route('/search4', methods=['POST'])
def do_search():
    phrase = request.form['phrase']
    letters = request.form['letters']
    title = 'Oto Twoje wyniki:'
    results = str(search4letters(phrase, letters))
    return render_template('results.html',
                           the_title=title,
                           the_phrase=phrase,
                           the_letters=letters,
                           the_results=results, )


@app.route('/viewpracownicy', methods=['POST', 'GET'])
def view_pracownicy():
    rows = database.get_all_pracownicy()
    try:
        pharse = request.form['fraza']
    except BadRequestKeyError:
        pass
    try:
        rows = filter_table_by_phrase(rows, pharse)
        return render_template('viewpracownicy.html',
                               rows=rows,
                               the_title="Pracownicy",
                               fraza=pharse)
    except UnboundLocalError:
        return render_template('viewpracownicy.html',
                               rows=rows,
                               the_title="Pracownicy",
                               fraza="")


@app.route('/modifypracownik', methods=['POST'])
def modify_pracownik():
    Id = request.form['id']
    # @TODO z bazy danych dać benefity, wnioski ziomka z danym id, wszystkie zespoły i stanowiska w postaci listy jak poniżej
    benefits = [[1, "Id: 1 Samochod ABC"], [2, "Id: 2 Samochod 2 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"]]
    return render_template('modifypracownicy.html', id=Id, benefity=benefits)


@app.route('/deletepracownikcheck', methods=['POST'])
def delete_pracownik_check():
    Id = request.form['id']
    return render_template('deletepracownik.html', id=Id)


@app.route('/deletepracownik', methods=['POST'])
def delete_pracownik():
    Id = request.form['id']
    print(Id)
    # @TODO zaimplementować usuwanie pracownika o danym id
    return redirect('/entry')


@app.route('/gotoaddpracownik', methods=['GET'])
def go_to_addpracownik():
    # @TODO wysłać na tą stronę rzeczy takie jak: pary id_stanowiska i jego nazwa
    return render_template('addpracownik.html')


@app.route('/addpracownik', methods=['POST'])
def addpracownik():
    # @TODO odebrać dane i walnąć je do db
    return redirect('/entry')


@app.route('/login_check', methods=['POST'])
def login_check():
    login = request.form['login']
    password = request.form['password']
    if database.check_login(login, password):
        return redirect('/entry')
    else:
        return redirect(url_for('login_page', title="Zły login i/lub password"))


@app.route('/entry')
def entry_page():
    return render_template('entry.html',
                           the_title=f'Witamy na stronie internetowej search4letters!')


@app.route('/')
def login_page():
    title_new = request.args.get('title')
    if title_new is None:
        title_new = "Witamy!"
    return render_template('loginpage.html',
                           the_title=title_new)


if __name__ == '__main__':
    app.run(debug=True)
