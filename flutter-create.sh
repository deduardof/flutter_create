#!/bin/bash

# Validação de parâmetros obrigatórios.
if [ $# -eq 0 ];
then
  echo "Utilize o comando: flutter-create <NOME_DO_PROJETO>"
  exit 0;
fi

###################################
# Abaixo as configurações básicas para criação do projeto.     #
###################################

# Organização do seu projeto
ORG="br.dev.deduardof" 

## Plataformas de desenvolvimento.
# Opções disponíveis: android, ios, linux, windows, macos, web, 
PLATFORMS="linux,android" 

## Comentários criados na criação do projeto.
# Oções disponíveis: --no-empty ou --empty
NO_COMMENTS="--empty" 

# Preencha com a descrição do projeto.
DESCRIPTION="Aplicativo desenvolvido em Flutter." 

#OBRIGATÓRIO
PROJECT_NAME=$1 
PROJECT_DIR=$1

if [ $# == 2 ];
then
  PROJECT_DIR=$2
fi

##################################
# Execução de comandos para criação do projeto.                 #
# Cria o projeto com base nas configurações acima e cria    #
# a estrutura de pastas básica.                                                   #
##################################

flutter create --org $ORG --platforms=$PLATFORMS --description "$DESCRIPTION"  $NO_COMMENTS --project-name $PROJECT_NAME $PROJECT_DIR

if [ -d $PROJECT_DIR ];
then
  cd $PROJECT_DIR/lib/
  mkdir -p src src/core src/models src/data src/ui
  cd src
  mkdir -p core/constants core/extensions core/themes core/routes
  mkdir -p data/repositories data/services
  mkdir -p ui/pages ui/widgets ui/modals ui/alerts
fi
