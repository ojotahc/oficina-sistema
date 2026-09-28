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
    try:
        conexao = mysql.connector.connect(host=host, user=user, password=password, database=database)
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

conectar()
