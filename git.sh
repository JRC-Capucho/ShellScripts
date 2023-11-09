#!/usr/bin/env sh

# Inicializa o agente SSH para gerenciar chaves privadas
eval $(ssh-agent)

# Adiciona uma chave SSH específica para autenticação
ssh-add ~/.ssh/id_ed25519

# Obtém URLs SSH dos repositórios públicos do usuário "JRC-Capucho" no GitHub
urls=$(curl https://api.github.com/users/JRC-Capucho/repos | \
  grep ssh_url | \
  awk '{print $2}' | \
  sed 's/"//g' | \
  sed 's/,//g')

# Inicializa um array para armazenar as URLs dos repositórios
repo_array=()

# Lê cada URL de repositório e a adiciona ao array
while IFS= read -r repos; do
  repo_array+=("$repos")
done <<< "$urls"

# Itera sobre as URLs dos repositórios e clona cada um deles no sistema
for repo in "${repo_array[@]}"
do
  ghq get -p "$repo"
done

