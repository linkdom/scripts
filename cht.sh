#!/bin/bash

languages=`echo "laravel flutter dart nodejs c cpp golang javascript typescript php java bash rust lua carbon python" | tr ' ' '\n'`
coreutils=`echo "xargs bc awk sed mkdir touch find mv cp" | tr ' ' '\n'`

selected=`printf "$languages\n$coreutils" | fzf`
read -p "query: " query

if echo $languages | grep -qs $selected; then
    tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
