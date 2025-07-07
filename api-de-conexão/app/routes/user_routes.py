from flask import Blueprint, jsonify, request
import app.controllers.user_controllers as controller

usuario_bp=Blueprint('usuarios', __name__, url_prefix='/usuarios')

@usuario_bp.route('/', methods=['GET'])
def listar_usuarios():
    try:
        usuarios =  controller.listar_todos()
        return jsonify(usuarios), 200
    except Exception as e:
        return jsonify({'mensagem': str(e)}), 500
    
@usuario_bp.route('/registrar', methods=['POST'])
def criar():
    try:
        dados = request.json
        novo_id=controller.criar(dados)
        return jsonify({'id': novo_id, 'mensagem':'Usuário criado com sucesso'}), 200
    
    except Exception as e:
        return jsonify({'mensagem': str(e)}), 500