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

        var loop_permissao = "S" #loop feito para continuar rodando até o usuario decidir finalizar
        while (loop_permissao = "S" || loop_permissao = "s")
        echo "Deseja adicionar quais permissões para o usuario?"
        echo "1. authorized_for_system_information"
        echo "2. authorized_for_configuration_information"
        echo "3. authorized_for_system_commands"
        echo "4. authorized_for_all_services"
        echo "5. authorized_for_all_hosts"
        echo "6. authorized_for_all_service_commands"
        echo "7. authorized_for_all_host_commands"
        
        read -p "Escolha uma permissão (1/2/3/4/5/6/7): " permissao
        case $opcaoPermissao in 
            1) adicionarAFSY()
        read -p "Deseja continuar? (S/N)" loop_permissao
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
