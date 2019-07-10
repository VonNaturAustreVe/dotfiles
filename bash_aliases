# Ativa o hotspot
alias hotspot-up="sudo ap-hotspot start"

# Desativa o hotspot
alias hotspot-down="sudo ap-hotspot stop"

# Inseri com na saida dos comandos
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias bc='bc -l'

# Exibe o diff com as cores
alias diff='colordiff'

# Exibe as portas abertas
alias ports='netstat -tulanp'

# Exibe os listens e processos utilizando
alias listen="lsof -P -i -n"

# Exibe os hearders de uma pagina
alias header='curl -I'
 
# Exibe os hearders de uma pagina com gzip
alias headerc='curl -I --compress'

# Informa a qtd. de memoria
alias meminfo='free -m -l -t'

# Lista os processos ordenando por memoria
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# Lista os procesos ordenando por cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Obtem informacoes do cpu
alias cpuinfo='lscpu'

# Faz o wget sempre com o continue
alias wget='wget -c'

# Obtem a previsao do tempo
alias clima="curl wttr.in/brasilia"

###############################################################################
# Funcoes
###############################################################################

# Checa o md5 de um arquivo
md5check() { 
    md5sum "$1" | grep "$2";
}

# Executa a extracao de arquivos
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' nao pode ser extraido via extract()" ;;
        esac
    else
        echo "'$1' nao e um arquivo valido"
    fi
}

# Executa o add, commit e push no git
gitacp() {
    git add .
    git commit -m "$1"
    git push origin master
}

# Update all git repositories
gitupdate(){
    for i in */.git 
    do ( 
        echo $i
        cd $i/..
        git pull 
        ); 
    done
}
