import app.models.user_models as model

def listar_todos():
    return model.listar()

def criar(dados):
    return model.criar(dados)
