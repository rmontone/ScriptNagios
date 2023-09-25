#!/bin/bash

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
        echo "Digite o nome do usuario seguindo o padrao nome.sobrenome \n Exemplo: fulano.silva"
        
        echo "Deseja adicionar o usuario no grupo authorized_for_system_information?"
        read -p "Escolha (S/N)" AFSY # AFSY por conta do nome authorized_for_system_information
        adicionarAFSY();
        echo "Deseja adicionar o usuario no grupo authorized_for_configuration_information"
        read -p "Escolha (S/N)" AFCI # AFCI por conta do nome authorized_for_configuration_information
        adicionarAFCI();
        echo "Desej"
        ;;
    2)
        echo "Deletar Usuario"
        # Add your code for Option 2 here
        ;;
    3)
        echo "Sair"
        exit 0
        ;;
    *)
        echo "Opção invalida (1/2/3)."
        ;;
esac


#authorized_for_system_information=nagiosadmin, username1
#authorized_for_configuration_information=nagiosadmin, username1
authorized_for_system_commands=nagiosadmin, username1
authorized_for_all_services=nagiosadmin, username1
authorized_for_all_hosts=nagiosadmin, username1
authorized_for_all_service_commands=nagiosadmin, username1
authorized_for_all_host_commands=nagiosadmin, username1