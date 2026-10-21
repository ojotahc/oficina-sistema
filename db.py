import mysql.connector
import os
from dotenv import load_dotenv
from mysql.connector import errorcode


load_dotenv()

def conectar():
    host = os.getenv('DB_HOST')
    user = os.getenv('DB_USER')
    password = os.getenv('DB_PASSWORD')
    database = os.getenv('DB_NAME')
    if not host:
        print("DB_HOST não definido no .env")
        return None
    if not user:
        print("DB_USER não definido no .env")
        return None
    if not password:
        print("DB_PASSWORD não definido no .env")
        return None
    if not database:
        print("DB_NAME não definido no .env")
        return None
    try:
        # mysql.connector.connect já é uma função só passo os argumentos
        conexao = mysql.connector.connect(host=host, user=user, password=password, database=database, connection_timeout=5)
        print('Conexão bem sucedida!')
        return conexao
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Nome de usuário ou senha incorretos")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Banco de dados não existe")
        else:
            print(f"Erro {err.errno}: {err.msg}")
        return None