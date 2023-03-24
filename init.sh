#!/bin/bash

# Copia el archivo .env.template y lo renombra como .env
cp .env.template .env

# Elimina la carpeta .git
rm -rf .git

# Inicializa un nuevo repositorio Git
git init

# Realiza un commit inicial
git add .
git commit -m "Commit inicial"