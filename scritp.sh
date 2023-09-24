#!/bin/bash

# Nome do arquivo de texto
arquivo="nomes.txt"

# Função para adicionar um nome à linha especificada
adicionar_nome() {
    linha="$1"
    nome="$2"
    sed -i "${linha}s/$/,${nome}/" "$arquivo"
}

# Função para deletar um nome da linha especificada
deletar_nome() {
    linha="$1"
    nome="$2"
    sed -i "${linha}s/${nome}//" "$arquivo"
    # Remover vírgulas extras, se houver, após a exclusão
    sed -i "${linha}s/,,/,/g" "$arquivo"
}

# Verificar os argumentos da linha de comando
while getopts "a:d:" opcao; do
    case "${opcao}" in
        a)
            linha="${OPTARG}"
            nome="${3}"
            adicionar_nome "$linha" "$nome"
            echo "Nome '${nome}' adicionado à linha ${linha} do arquivo."
            ;;
        d)
            linha="${OPTARG}"
            nome="${3}"
            deletar_nome "$linha" "$nome"
            echo "Nome '${nome}' deletado da linha ${linha} do arquivo."
            ;;
        *)
            echo "Uso: $0 [-a LINHA NOME] [-d LINHA NOME]"
            exit 1
            ;;
    esac
done

# Exibir o conteúdo atualizado do arquivo
echo "Conteúdo do arquivo:"
cat "$arquivo"
