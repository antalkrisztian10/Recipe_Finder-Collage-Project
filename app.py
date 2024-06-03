# Importam libariile necesare pentru a rula aplicatia
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
from models import Retete, Ingrediente, IngredienteRetete, Recenzii


# Am definit ruta de baza cu care porneste aplicatia
@app.route('/', methods=['GET', 'POST'])
def index():
    # Selectăm primele 4 rețete pentru recomandări
    recommended_recipes = Retete.query.limit(4).all()

    # Metoda 'POST' preia datele din formular, separate printr-o virgula cu functia 'split' +
    # le face mici cu 'lower' si le elimina spatiile albe cu functia 'strip'
    if request.method == 'POST':
        ingrediente_input = request.form.get('ingredients').split(',')
        ingrediente_input = [i.strip().lower() for i in ingrediente_input]

        # Cautam toate retele cu ingredientele specificate de utilizator
        subinterogare = db.session.query(IngredienteRetete.reteta_id).join(Ingrediente).filter(
        Ingrediente.nume.in_(ingrediente_input)).group_by(IngredienteRetete.reteta_id).having(db.func.count(IngredienteRetete.ingredient_id) == len(ingrediente_input)).subquery()

        # Dupa cautare selecteaza toate retele care se potrivesc pe baza critetiilor puse de utilizator
        retete_potrivite = db.session.query(Retete).filter(Retete.id.in_(subinterogare)).all()

        # Afisam pe pagina principala (index.html) cu retetele gasite si retetele recomandate
        return render_template('index.html', recipes=retete_potrivite, recommended_recipes=recommended_recipes)

    # Daca nu s-au gasit retete potrivite, pagina index.html va afisa doar retetele recomandate
    return render_template('index.html', recommended_recipes=recommended_recipes)


# Am definit metoda 'recipes' care afiseaza toate retetele
@app.route('/recipes')
def recipes():
    # Preia parametru din url
    cautare = request.args.get('search', '')
    # Filtrăm rețetele care conțin cuvantul introdus de utilizator in titlu cu functia ilike
    if cautare:
        retete = Retete.query.filter(Retete.titlu.ilike(f'%{cautare}%')).all()
    else:
        # Daca nu s-a gasit cuvantul respectiv afisam toate retele existente
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
    app.run()
