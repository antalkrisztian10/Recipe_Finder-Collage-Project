from app import db  # Import the db instance from app.py


class Retete(db.Model):
    __tablename__ = 'retete'
    id = db.Column(db.Integer, primary_key=True)
    titlu = db.Column(db.String(255), nullable=False)
    instructiuni = db.Column(db.Text)
    imagine = db.Column(db.String(255))
    ingrediente = db.relationship('IngredienteRetete', back_populates='reteta')
    recenzii = db.relationship('Recenzii', back_populates='reteta')


class Ingrediente(db.Model):
    __tablename__ = 'ingrediente'
    id = db.Column(db.Integer, primary_key=True)
    nume = db.Column(db.String(255), nullable=False)
    retete = db.relationship('IngredienteRetete', back_populates='ingredient')


class IngredienteRetete(db.Model):
    __tablename__ = 'ingrediente_retete'
    reteta_id = db.Column(db.Integer, db.ForeignKey('retete.id'), primary_key=True)
    ingredient_id = db.Column(db.Integer, db.ForeignKey('ingrediente.id'), primary_key=True)
    cantitate = db.Column(db.String(255))
    reteta = db.relationship('Retete', back_populates='ingrediente')
    ingredient = db.relationship('Ingrediente', back_populates='retete')


class Recenzii(db.Model):
    __tablename__ = 'recenzii'
    id = db.Column(db.Integer, primary_key=True)
    nume = db.Column(db.String(255), nullable=False)
    nota = db.Column(db.Integer, nullable=False)
    comentariu = db.Column(db.Text, nullable=False)
    reteta_id = db.Column(db.Integer, db.ForeignKey('retete.id'))
    reteta = db.relationship('Retete', back_populates='recenzii')
