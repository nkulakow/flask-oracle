from flask import Flask, render_template, request
from werkzeug.exceptions import BadRequestKeyError
from database_manager import DatabaseManager
from data_functions import *

app = Flask(__name__)
database = DatabaseManager("system", "BD2pass", 'TESTDB')


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


@app.route('/viewpracownicy', methods=['POST'])
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


@app.route('/')
@app.route('/entry')
def entry_page():
    return render_template('entry.html',
                           the_title='Witamy na stronie internetowej search4letters!')


if __name__ == '__main__':
    app.run(debug=True)
