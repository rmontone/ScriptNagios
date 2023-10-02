#!/bin/bash

# Função para adicionar um usuário a um grupo
adicionarUsuarioAoGrupo() {
    local nomeUsuario="$1"
    local grupo="$2"

    if grep -q "$grupo" "cgi.cfg"; then
        #if grep -q "$nomeUsuario" "cgi.cfg"; then
            echo "O usuário $nomeUsuario já está no grupo $grupo."
        #else
            sed -i "/$grupo/ s/$/,$nomeUsuario/" "cgi.cfg"
            echo "Usuário $nomeUsuario adicionado ao grupo $grupo com sucesso."
        #fi
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
    echo "1. Adicionar Usuário"
    echo "2. Deletar Usuário"
    echo "3. Sair"
    
    # Solicitar a escolha do usuário
    read -p "Escolha uma opção (1/2/3): " opcao
    
    case $opcao in
        1)
            echo "Adicionar Usuário"
            read -p "Digite o nome do usuário seguindo o padrão nome.sobrenome (Exemplo: fulano.silva): " nomeUsuario
            
            # Menu para escolher grupos
           
            authorized_for_system_information=authorized_for_system_information
            authorized_for_configuration_information=authorized_for_configuration_information
            authorized_for_system_commands=authorized_for_system_commands
            authorized_for_all_services=authorized_for_all_services
            authorized_for_all_hosts=authorized_for_all_hosts
            authorized_for_all_service_commands=authorized_for_all_service_commands
            authorized_for_all_host_commands=authorized_for_all_host_commands
    
            while true; do
                echo "Escolha o grupo para adicionar o usuário:"
                echo "1. authorized_for_system_information" 
                echo "2. authorized_for_configuration_information" 
                echo "3. authorized_for_system_commands"
                echo "4. authorized_for_all_services"
                echo "5. authorized_for_all_hosts"
                echo "6. authorized_for_all_service_commands"
                echo "7. authorized_for_all_host_commands"
                echo "8. Concluir"
                
                read -p "Escolha um grupo (1/2/3/4/5/6/7/8): " opcaoGrupo
                
                case $opcaoGrupo in
                    1) adicionarUsuarioAoGrupo $nomeUsuario $authorized_for_system_information ;;
                    2) adicionarUsuarioAoGrupo $nomeUsuario $authorized_for_configuration_information ;;
                    3) adicionarUsuarioAoGrupo $nomeUsuario $authorized_for_system_commands ;;
                    4) adicionarUsuarioAoGrupo $nomeUsuario $authorized_for_all_services ;;
                    5) adicionarUsuarioAoGrupo $nomeUsuario $authorized_for_all_hosts ;;
                    6) adicionarUsuarioAoGrupo $nomeUsuario $authorized_for_all_service_commands ;;
                    7) adicionarUsuarioAoGrupo $nomeUsuario $authorized_for_all_host_commands ;;
                    8) break ;;
                    *) echo "Opção inválida" ;;
                esac
            done
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
