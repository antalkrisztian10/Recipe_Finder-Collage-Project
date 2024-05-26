from app import db

class Ingrediente(db.Model):
    __tablename__ = 'ingrediente'
    id = db.Column(db.Integer, primary_key=True)
    nume = db.Column(db.String(255), nullable=False)
    retete = db.relationship('IngredienteRetete', back_populates='ingredient')

class Retete(db.Model):
    __tablename__ = 'retete'
    id = db.Column(db.Integer, primary_key=True)
    titlu = db.Column(db.String(255), nullable=False)
    instructiuni = db.Column(db.Text)
    imagine = db.Column(db.String(255))  # Noua coloană pentru imagine
    ingrediente = db.relationship('IngredienteRetete', back_populates='reteta')

class IngredienteRetete(db.Model):
    __tablename__ = 'ingrediente_retete'
    reteta_id = db.Column(db.Integer, db.ForeignKey('retete.id'), primary_key=True)
    ingredient_id = db.Column(db.Integer, db.ForeignKey('ingrediente.id'), primary_key=True)
    cantitate = db.Column(db.String(255))
    reteta = db.relationship('Retete', back_populates='ingrediente')
    ingredient = db.relationship('Ingrediente', back_populates='retete')
