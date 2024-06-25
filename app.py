# Importam librariile necesare pentru a rula aplicatia
from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
import pymysql

# Instalam MySql pentru baza de date
pymysql.install_as_MySQLdb()

# Inițializarea aplicației cu flask
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/recipe_finder'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initializam SQLAlchemy pentru prelucrarea datelor din baza de date
db = SQLAlchemy(app)

# Importam tabelele din baza de date definite in fisierul models.py
from models import Retete, Recenzii


# Am definit ruta de baza cu care porneste aplicatia
@app.route('/', methods=['GET', 'POST'])
def index():
    # Selectăm primele 4 rețete pentru recomandări
    retete_recomandate = Retete.query.limit(4).all()
    retete_potrivite = []
    mesaj_fara_retete = None

    # Metoda 'POST' preia datele din formular, separate printr-o virgula cu functia 'split' +
    # le face mici cu 'lower' si le elimina spatiile albe cu functia 'strip'
    if request.method == 'POST':
        ingrediente_input = request.form.get('ingredients').split(',')
        ingrediente_input = [i.strip().lower() for i in ingrediente_input]

        # Preluam toate retetele din baza de date
        toate_retetele = Retete.query.all()

        # Verificam fiecare reteta din toate_retetele
        for reteta in toate_retetele:
            # Cream un set pentru a stoca numele ingredientelor
            ingrediente_reteta = set()

            # Parcurgem prin fiecare ingredient asociat cu rețeta curentă
            for ingrediente in reteta.ingrediente:
                # Adăugăm numele ingredientului în setul ingrediente_reteta
                ingrediente_reteta.add(ingrediente.ingredient.nume)

            # Aici verificam daca toate ingredientele retetei se gasesc in lista de ingrediente specificata de user.
            if ingrediente_reteta.issubset(ingrediente_input):
                # Daca toate ingredientele sunt in lista ingredientelor, bagam reteta la rețete potrivite
                retete_potrivite.append(reteta)

        # Daca lista de retete este goala inseamna ca avem nici-o reteta care poate fi facuta cu ingredientele introduse
        if not retete_potrivite:
            mesaj_fara_retete = "Nu ai suficiente ingrediente pentru a compune o reteta"

    # Afisam pe pagina principala (index.html) cu retetele gasite si retetele recomandate
    return render_template('index.html', recipes=retete_potrivite, recommended_recipes=retete_recomandate,
                           no_recipes_message=mesaj_fara_retete)


# Am definit metoda 'recipes' care afiseaza toate retetele
@app.route('/recipes')
def recipes():
    # Preia parametru din url
    cautare = request.args.get('search', '')
    # Filtram rețetele care conțin cuvantul introdus de utilizator in titlu cu functia like
    if cautare:
        retete = Retete.query.filter(Retete.titlu.ilike(f'%{cautare}%')).all()
    else:
        # Daca bara este goala afisam toate retele existente
        retete = Retete.query.all()

    # Afisam retele, fie ele filtrate, fie toate retele.
    return render_template('retete.html', recipes=retete)


# Am definit metoda 'recipe_detail' care afiseaza detalii despre o reteta
@app.route('/recipe/<int:recipe_id>', methods=['GET', 'POST'])
def recipe_detail(recipe_id):
    # Gasim reteta dupa id-ul acesteia din baza de date, daca nu este gasita reteta se afiseaza o eroare
    reteta = Retete.query.get_or_404(recipe_id)

    # Metoda 'POST' preia datele din formular si luam datele din tabelul cu recenzii
    if request.method == 'POST':
        nume = request.form['nume']
        nota = request.form['nota']
        comentariu = request.form['comentariu']

        # Cream recenzia facuta de utilizator si o daugam in baza de date in tebelul 'recenzii' cu comanda commit
        recenzie = Recenzii(nume=nume, nota=nota, comentariu=comentariu, reteta_id=recipe_id)
        db.session.add(recenzie)
        db.session.commit()

    # Aici se gasesc toate recenziile filtrate pe id-ul retetei respective.
    recenzii = Recenzii.query.filter_by(reteta_id=recipe_id).all()
    # Afisam pagina 'detalii_retete.html' in care este afisata reteta + recenziile acesteia.
    return render_template('detalii_retete.html', recipe=reteta, recenzii=recenzii)


# Am definit metoda 'about' care afiseaza pagina 'about.html' cu detalii despre acest proiect.
@app.route('/about')
def about():
    return render_template('about.html')


# De aici se ruleaza aplicatia si se porneste serverul.
if __name__ == '__main__':
    app.run(debug=True)
