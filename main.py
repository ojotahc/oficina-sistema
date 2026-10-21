from db import conectar

conexao = conectar()

if conexao is not None:
    conexao.close()
else:
    print("Não foi possível conectar.")