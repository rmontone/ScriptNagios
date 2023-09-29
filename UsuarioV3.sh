#!/bin/bash
    #value=$(<nomes.cgi) # ver se esta lendo o arquivo .cgi pra posteriormente modificar
    #echo "$value" não tenho wsl na maquina pra testar agora

#cgi.cfg path == /usr/local/nagios/etc/cgi.cfg
#cgiCFG=$(<cgi.cfg)
#echo "$cgiCFG" # por alguma razão se eu atribuir o nomes.cgi aqui não vai funcionar

#authorized_for_system_information
    adicionarAFSI() {
    local nomeUsuario="$1" # está atribuindo um valor à variável nomeUsuario. O valor é obtido a partir do primeiro argumento passado para a função, que é representado por $1.i
    local padrao="authorized_for_system_information" # padrao usado na pesquisa do awk
        # Usando o AWK pra dar um update na linha e salvar temporariamente
        awk -v usuario="$nomeUsuario" -v padrao="$padrao" '$0 ~ padrao { gsub(/\r/, ""); print $0 "," usuario; next } { gsub(/\r/, ""); print $0 }' "cgi.cfg" > tmpfile
        # Substituindo a original pela temporaria
        mv tmpfile "cgi.cfg"
        echo "Usuario adicionado com sucesso no grupo authorized_for_system_information"
}
#authorized_for_configuration_information    
    adicionarAFCI() {
    local nomeUsuario="$1" # está atribuindo um valor à variável nomeUsuario. O valor é obtido a partir do primeiro argumento passado para a função, que é representado por $1.i
    local padrao="authorized_for_configuration_information" # padrao usado na pesquisa do awk
        # Usando o AWK pra dar um update na linha e salvar temporariamente
        awk -v usuario="$nomeUsuario" -v padrao="$padrao" '$0 ~ padrao { gsub(/\r/, ""); print $0 "," usuario; next } { gsub(/\r/, ""); print $0 }' "cgi.cfg" > tmpfile

        # Substituindo a original pela temporaria
        mv tmpfile "cgi.cfg"
        echo "Usuario adicionado com sucesso no grupo authorized_for_configuration_information"
}
#authorized_for_system_commands    
    adicionarAFSC() {
    local nomeUsuario="$1" # está atribuindo um valor à variável nomeUsuario. O valor é obtido a partir do primeiro argumento passado para a função, que é representado por $1.i
    local padrao="authorized_for_system_commands" # padrao usado na pesquisa do awk
        # Usando o AWK pra dar um update na linha e salvar temporariamente
        awk -v usuario="$nomeUsuario" -v padrao="$padrao" '$0 ~ padrao { gsub(/\r/, ""); print $0 "," usuario; next } { gsub(/\r/, ""); print $0 }' "cgi.cfg" > tmpfile

        # Substituindo a original pela temporaria
        mv tmpfile "cgi.cfg"
        echo "Usuario adicionado com sucesso no grupo authorized_for_system_commands"
    }
#authorized_for_all_services
    adicionarAFAS() {
    local nomeUsuario="$1" # está atribuindo um valor à variável nomeUsuario. O valor é obtido a partir do primeiro argumento passado para a função, que é representado por $1.i
    local padrao="authorized_for_all_services" # padrao usado na pesquisa do awk
        # Usando o AWK pra dar um update na linha e salvar temporariamente
        awk -v usuario="$nomeUsuario" -v padrao="$padrao" '$0 ~ padrao { gsub(/\r/, ""); print $0 "," usuario; next } { gsub(/\r/, ""); print $0 }' "cgi.cfg" > tmpfile

        # Substituindo a original pela temporaria
        mv tmpfile "cgi.cfg"
        echo "Usuario adicionado com sucesso no grupo authorized_for_all_services"
    }
#authorized_for_all_hosts
    adicionarAFAH() {
    local nomeUsuario="$1" # está atribuindo um valor à variável nomeUsuario. O valor é obtido a partir do primeiro argumento passado para a função, que é representado por $1.i
    local padrao="authorized_for_all_hosts" # padrao usado na pesquisa do awk
        # Usando o AWK pra dar um update na linha e salvar temporariamente
        awk -v usuario="$nomeUsuario" -v padrao="$padrao" '$0 ~ padrao { gsub(/\r/, ""); print $0 "," usuario; next } { gsub(/\r/, ""); print $0 }' "cgi.cfg" > tmpfile

        # Substituindo a original pela temporaria
        mv tmpfile "cgi.cfg"
        echo "Usuario adicionado com sucesso no grupo authorized_for_all_hosts"
    }
#authorized_for_all_service_commands

    adicionarAFASC() {
    local nomeUsuario="$1" # está atribuindo um valor à variável nomeUsuario. O valor é obtido a partir do primeiro argumento passado para a função, que é representado por $1.i
    local padrao="authorized_for_all_service_commands" # padrao usado na pesquisa do awk
        # Usando o AWK pra dar um update na linha e salvar temporariamente
        awk -v usuario="$nomeUsuario" -v padrao="$padrao" '$0 ~ padrao { gsub(/\r/, ""); print $0 "," usuario; next } { gsub(/\r/, ""); print $0 }' "cgi.cfg" > tmpfile

        # Substituindo a original pela temporaria
        mv tmpfile "cgi.cfg"
        echo "Usuario adicionado com sucesso no grupo authorized_for_all_service_commands"
    }
#authorized_for_all_host_commands
    adicionarAFAHC() {
    local nomeUsuario="$1" # está atribuindo um valor à variável nomeUsuario. O valor é obtido a partir do primeiro argumento passado para a função, que é representado por $1.i
    local padrao="authorized_for_all_host_commands" # padrao usado na pesquisa do awk
        # Usando o AWK pra dar um update na linha e salvar temporariamente
        awk -v usuario="$nomeUsuario" -v padrao="$padrao" '$0 ~ padrao { gsub(/\r/, ""); print $0 "," usuario; next } { gsub(/\r/, ""); print $0 }' "cgi.cfg" > tmpfile

        # Substituindo a original pela temporaria
        mv tmpfile "cgi.cfg"
        echo "Usuario adicionado com sucesso no grupo authorized_for_all_host_commands"
}
#deletarUsuario()
    deletarUsuario() {
    local nomeUsuario="$1" # está atribuindo um valor à variável nomeUsuario. O valor é obtido a partir do primeiro argumento passado para a função, que é representado por $1.i
    if grep -qw "$nomeUsuario" "cgi.cfg"; then
        # Use awk to remove the specific user while preserving the rest of the line
        awk -v user="$nomeUsuario" -F, '
            {
                for(i=1; i<=NF; i++) {
                    if($i != user) {
                        if (i > 1) printf ","
                        printf "%s", $i
                    }
                }
                print ""
            }
        ' cgi.cfg > temp_file && mv temp_file cgi.cfg
        echo "Usuário $nomeUsuario foi deletado do arquivo cgi.cfg."
    else
        echo "O usuário $nomeUsuario não existe no arquivo cgi.cfg."
    fi
}  

loop_menu=S
while [[ $loop_menu = "S" || $loop_menu = "s" ]]; do
    echo "Menu:"
    echo "1. Adicionar Usuario"
    echo "2. Deletar Usuario"
    echo "3. Sair"
    
    
    # Perguntar input pro usuario escolher
    read -p "Escolha uma opção (1/2/3): " opcao
    
    # case pro usuario escolher o primeiro menu
    case $opcao in
        1)
            echo "Adicionar Usuario"
            read -p "Digite o nome do usuário seguindo o padrão nome.sobrenome (Exemplo: fulano.silva): " nomeUsuario #Variavel nomeUsuario criada localmente para posteriormente adicionar no final
            echo $nomeUsuario
    
            loop_permissao="S" #loop feito para continuar rodando até o usuario decidir finalizar
            while [[ $loop_permissao = "S" || $loop_permissao = "s" ]]; do
            echo "Deseja adicionar quais permissões para o usuario?"
            echo "1. authorized_for_system_information"
            echo "2. authorized_for_configuration_information"
            echo "3. authorized_for_system_commands"
            echo "4. authorized_for_all_services"
            echo "5. authorized_for_all_hosts"
            echo "6. authorized_for_all_service_commands"
            echo "7. authorized_for_all_host_commands"
            
            read -p "Escolha uma permissão (1/2/3/4/5/6/7): " opcaoPermissao
            case $opcaoPermissao in #switch case feito no intuito de escolher qual permissão escolher para o usuario
                1) 
                adicionarAFSI $nomeUsuario
            ;;
                2) 
                adicionarAFCI $nomeUsuario
            ;;
                3) 
                adicionarAFSC $nomeUsuario
            ;;
                4) 
                adicionarAFAS $nomeUsuario
            ;;
                5) 
                adicionarAFAH $nomeUsuario
            ;;
                6) 
                adicionarAFASC $nomeUsuario
            ;;
                7) 
                adicionarAFAHC $nomeUsuario
            ;;
                *) 
                   echo "permissao invalida"
            ;;
            esac
            #fim do switch case de escolhas de permissao
            read -r -p "Deseja continuar? (S/N) " loop_permissao

    
        done
        ;;
        2)
            echo "Deletar Usuario"
            read -p "Digite o nome do usuário que deseja deletar: " nomeUsuario #Variavel nomeUsuario criada localmente para posteriormente adicionar no final
            deletarUsuario "$nomeUsuario"
            #echo "O usuário $nomeUsuario foi deletado"
            ;;
        3)
            echo "Sair"
            exit 0
            ;;
        *)
            echo "Opção invalida (1/2/3)."
            ;;
    esac
done    
    
    #authorized_for_system_information=nagiosadmin,username1
    #authorized_for_configuration_information=nagiosadmin,username1
    #authorized_for_system_commands=nagiosadmin,username1
    #authorized_for_all_services=nagiosadmin,username1
    #authorized_for_all_hosts=nagiosadmin,username1
    #authorized_for_all_service_commands=nagiosadmin,username1
    #authorized_for_all_host_commands=nagiosadmin,username1
