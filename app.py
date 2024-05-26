from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
import pymysql

pymysql.install_as_MySQLdb()

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/recipe_finder'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0  # Disable caching for development

db = SQLAlchemy(app)

from models import Retete, Ingrediente, IngredienteRetete

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        ingrediente_input = request.form.get('ingredients').split(',')
        ingrediente_input = [i.strip().lower() for i in ingrediente_input]

        subinterogare = db.session.query(IngredienteRetete.reteta_id).join(Ingrediente).filter(
            Ingrediente.nume.ilike(f'%{i}%') for i in ingrediente_input).subquery()

        retete_potrivite = db.session.query(Retete).join(IngredienteRetete,
                                                         Retete.id == IngredienteRetete.reteta_id).filter(
            IngredienteRetete.reteta_id.in_(subinterogare)).all()

        return render_template('index.html', recipes=retete_potrivite)
    return render_template('index.html')

@app.route('/recipes')
def recipes():
    cautare = request.args.get('search', '')
    if cautare:
        retete = Retete.query.filter(Retete.titlu.ilike(f'%{cautare}%')).all()
    else:
        retete = Retete.query.all()

    return render_template('retete.html', recipes=retete)

@app.route('/recipe/<int:recipe_id>')
def recipe_detail(recipe_id):
    reteta = Retete.query.get_or_404(recipe_id)
    return render_template('detalii_retete.html', recipe=reteta)

@app.route('/about')
def about():
    return render_template('about.html')

if __name__ == '__main__':
    app.run(debug=True)
