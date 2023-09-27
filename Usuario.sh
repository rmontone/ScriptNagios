#!/bin/bash

adicionarAFSY($nomeUsuario) {
    echo 'teste adicionar1'
}


echo "Menu:"
echo "1. Adicionar Usuario"
echo "2. Deletar Usuario"
echo "3. Sair"


# Ask the user for input
read -p "Escolha uma opção (1/2/3): " opcao

# Use a case statement to perform actions based on user input
case $opcao in
    1)
        echo "Adicionar Usuario"
        read -p "Digite o nome do usuário seguindo o padrão nome.sobrenome (Exemplo: fulano.silva): " nomeUsuario #Variavel nomeUsuario criada localmente para posteriormente adicionar no final
        echo $nomeUsuario

        echo "Deseja adicionar o usuario no grupo authorized_for_system_information?"
        read -p "Escolha (S/N)" AFSY # AFSY por conta do nome authorized_for_system_information
        adicionarAFSY;

        echo "Deseja adicionar o usuario no grupo authorized_for_configuration_information"
        read -p "Escolha (S/N)" AFCI # AFCI por conta do nome authorized_for_configuration_information
        adicionarAFCI;

        echo "Deseja adicionar o usuario no grupo authorized_for_system_commands"
        read -p "Escolha (S/N)" AFSC # AFSC por conta do nome authorized_for_system_commands
        adicionarAFSC;

        echo "Deseja adicionar o usuario no grupo authorized_for_all_services"
        read -p "Escolha (S/N)" AFAS # AFAS por conta do nome authorized_for_all_services
        adicionarAFAS;

        echo "Deseja adicionar o usuario no grupo authorized_for_all_hosts"
        read -p "Escolha (S/N)" AFAH # AFAH por conta do nome authorized_for_all_hosts
        adicionarAFAH;

        echo "Deseja adicionar o usuario no grupo authorized_for_all_service_commands"
        read -p "Escolha (S/N)" AFASC # AFASC por conta do nome authorized_for_all_service_commands
        adicionarAFASC;

        echo "Deseja adicionar o usuario no grupo authorized_for_all_host_commands"
        read -p "Escolha (S/N)" AFAHC # AFAHC por conta do nome authorized_for_all_host_commands
        adicionarAFAHC;
        ;;
    2)
        echo "Deletar Usuario"
        deletarUsuario;
        ;;
    3)
        echo "Sair"
        exit 0
        ;;
    *)
        echo "Opção invalida (1/2/3)."
        ;;
esac


#authorized_for_system_information=nagiosadmin,username1
#authorized_for_configuration_information=nagiosadmin,username1
#authorized_for_system_commands=nagiosadmin,username1
#authorized_for_all_services=nagiosadmin,username1
#authorized_for_all_hosts=nagiosadmin,username1
#authorized_for_all_service_commands=nagiosadmin,username1
#authorized_for_all_host_commands=nagiosadmin,username1
