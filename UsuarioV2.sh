#!/bin/bash
    #!/bin/bash
    #value=$(<nomes.cgi) # ver se esta lendo o arquivo .cgi pra posteriormente modificar
    #echo "$value" não tenho wsl na maquina pra testar agora

# cgi.cfg path == /usr/local/nagios/etc/cgi.cfg
var cgiCFG ="/usr/local/nagios/etc/cgi.cfg" 
#authorized_for_system_information
    adicionarAFSI() {
    local nomeUsuario="$1" # está atribuindo um valor à variável nomeUsuario. O valor é obtido a partir do primeiro argumento passado para a função, que é representado por $1.
    ultimoCharDaLinha=$(awk -v pattern="authorized_for_system_information" '$0 ~ pattern {print substr($0, length)}' "$cgiCFG")

    echo "esse eh o ultimo caractere"$ultimoCharDaLinha
    }
#authorized_for_configuration_information    
    adicionarAFCI() {
    echo 'a' # coloquei echo a em todos porque em bash não pode ter funcao vazia
    }
#authorized_for_system_commands    
    adicionarAFSC() {
        echo 'a'
    }
#authorized_for_all_services
    adicionarAFAS() {
      echo 'a'  
    }
#authorized_for_all_hosts
    adicionarAFAH() {
        echo 'a'
    }
#authorized_for_all_service_commands    
    adicionarAFASC() {
        echo 'a'
    }
#authorized_for_all_host_commands
    adicionarAFAHC() {
        echo 'a'
    }
    
    
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
                adicionarAFSI "$nomeUsuario"
            ;;
                2) 
                adicionarAFCI
            ;;
                3) 
                adicionarAFSC
            ;;
                4) 
                adicionarAFAS
            ;;
                5) 
                adicionarAFAH
            ;;
                6) 
                adicionarAFASC
            ;;
                7) 
                adicionarAFAHC
            ;;
                *) 
                   echo "permissao invalida"
            ;;
            esac
            #fim do switch case de escolhas de permissao
            read -p "Deseja continuar? (S/N)" loop_permissao
    
        done
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
