#!/bin/bash

echo "Excluindo arquivos zip antigos..."

rm -rf l2jrevMobiusInterlude.zip

# Nome do arquivo ZIP
ZIP_NAME="l2jrevMobiusInterlude.zip"

# Arquivos e diretórios a serem incluídos
INCLUDES=("sl2" "Dockerfile" "README.md" "docker-compose.yml")

# Diretórios e arquivos a serem excluídos
EXCLUDES=(".git" "mysql" "sl2/game/log/*" "sl2/login/log/*")

# Verifica se o arquivo ZIP já existe e o remove
if [ -f "$ZIP_NAME" ]; then
    echo "Removendo arquivo ZIP existente: $ZIP_NAME"
    rm "$ZIP_NAME"
fi

# Cria o arquivo ZIP com exclusões
echo "Criando o arquivo ZIP: $ZIP_NAME"
zip -r "$ZIP_NAME" "${INCLUDES[@]}" $(printf " -x %s" "${EXCLUDES[@]}")

# Verifica se o ZIP foi criado com sucesso
if [ $? -eq 0 ]; then
    echo "Arquivo ZIP criado com sucesso: $ZIP_NAME"
else
    echo "Erro ao criar o arquivo ZIP."
fi
