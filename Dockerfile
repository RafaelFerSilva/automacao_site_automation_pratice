# Passo 01: Instancio uma imagem de SO linux, no caso usei o FEDORA,
# mas pode ser o Ubunto, Alpine, Debian, etc...
# Procure no Docker Hub a imagem que desejar! https://hub.docker.com
FROM ubuntu

# Passo 02: Vou mapear os volumes (diretórios do container) onde deixarei
# os testes (inputs) e os resultados (outputs).
VOLUME /opt/robotframework/results
VOLUME /opt/robotframework/tests

# Passo 03: Vou rodar os comandos que instalam tudo que preciso para rodar o robot
# nesse container linux. Como estou usando o FEDORA, os comandos aqui executados
# devem ser compatíveis com ele!!
RUN apt-get -y update && apt install -y build-essential libssl-dev libffi-dev python3-dev

RUN apt install -y python3-pip

# Passo 04: Instalo o Robot e as libraries que precisarei. No caso abaixo,
# especifiquei a versão do robot que eu quero e não especifiquei a da
# library Faker, com isso ele pegara a mais recente liberada.
# Obs.: As barras são para indicar quebra de linha, mas o comando é um só,
# é como se eu tivesso rodando tudo numa linha só.
RUN pip3 install \
robotframework \
robotframework-faker \
robotframework-selenium2library

RUN apt-get install -y chromium-browser