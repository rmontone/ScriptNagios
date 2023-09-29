#!/bin/bash

# Função para adicionar um usuário a um grupo
adicionarUsuarioAoGrupo() {
    local nomeUsuario="$1"
    local grupo="$2"

    if grep -q "$grupo" "cgi.cfg"; then
        if grep -q "$nomeUsuario" "cgi.cfg"; then
            echo "O usuário $nomeUsuario já está no grupo $grupo."
        else
            sed -i "/$grupo/ s/$/,$nomeUsuario/" "cgi.cfg"
            echo "Usuário $nomeUsuario adicionado ao grupo $grupo com sucesso."
        fi
    else
        echo "O grupo $grupo não foi encontrado em cgi.cfg."
    fi
}

# Função para deletar um usuário de todos os grupos listados
removerUsuarioDeGrupos() {
    local nomeUsuario="$1"
    local grupos=("authorized_for_system_information" "authorized_for_configuration_information" "authorized_for_system_commands" "authorized_for_all_services" "authorized_for_all_hosts" "authorized_for_all_service_commands" "authorized_for_all_host_commands")

    for grupo in "${grupos[@]}"; do
        if grep -q "$grupo" "cgi.cfg"; then
            if grep -q "$nomeUsuario" "cgi.cfg"; then
                sed -i "/$grupo/ s/,$nomeUsuario//" "cgi.cfg"
                echo "Usuário $nomeUsuario removido do grupo $grupo com sucesso."
            else
                echo "O usuário $nomeUsuario não está no grupo $grupo."
            fi
        else
            echo "O grupo $grupo não foi encontrado em cgi.cfg."
        fi
    done
}

# Loop principal do menu
while true; do
    clear
    echo "Menu:"
    echo "1. Adicionar Usuário a um Grupo"
    echo "2. Remover Usuário de todos os Grupos"
    echo "3. Sair"

    # Solicitar a escolha do usuário
    read -p "Escolha uma opção (1/2/3): " opcao

    case $opcao in
        1)
            echo "Adicionar Usuário a um Grupo"
            read -p "Digite o nome do usuário: " nomeUsuario
            read -p "Digite o nome do grupo: " grupo
            adicionarUsuarioAoGrupo "$nomeUsuario" "$grupo"
            ;;
        2)
            echo "Remover Usuário de todos os Grupos"
            read -p "Digite o nome do usuário que deseja deletar de todos os grupos: " nomeUsuario
            removerUsuarioDeGrupos "$nomeUsuario"
            ;;
        3)
            echo "Sair"
            exit 0
            ;;
        *)
            echo "Opção inválida (1/2/3)."
            ;;
    esac
    read -n1 -r -p "Pressione qualquer tecla para continuar..."
done
