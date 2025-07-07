from app.services.db import conectar

def listar():
    conexao = conectar()
    cursor = conexao.cursor(dictionary=True)
    cursor.execute("Select * from user")
    usuarios=cursor.fetchall()
    cursor.close()
    conexao.close()
    return usuarios

def criar(dados):
    conexao = conectar() 
    cursor = conexao.cursor()

    try:
        sql_insert = "INSERT INTO user(tipo_user, ra_user, cpf_user, situacao_user, senha_user) VALUES(%s, %s, %s, %s, %s)"
        cursor.execute(sql_insert, (dados['tipo'], dados['ra'], dados['cpf'], dados['situacao'], dados['senha']))
        conexao.commit()
        print("User inserted successfully!")

        sql_select = "SELECT id_user FROM user WHERE cpf_user = %s"
        cursor.execute(sql_select, (dados['cpf'],)) 
        usuario_criado = cursor.fetchone()[0]


        return usuario_criado

    except Exception as e:
        conexao.rollback() 
        print(f"An error occurred: {e}")
        return None
    finally:
        if cursor:
            cursor.close()
        if conexao:
            conexao.close()