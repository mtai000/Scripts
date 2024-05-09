#!/bin/bash
CACHE_FILE="$HOME/.cj_cache"
MAX=100

cj() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 directory"
        return 1
    fi
    
    dst=$1
    cached_path=""
    if [ ! -d "$dst" ]; then
        if [ -f "$CACHE_FILE" ]; then
            # echo "grep $dst $CACHE_FILE"
            cached_path=$(grep "$dst\$" "$CACHE_FILE")
            if [ -n "$cached_path" ]; then
                dst=$cached_path
            else
                echo "Directory not found $1 in cache"
                return 1
            fi
        fi
    fi
    if [ -f "$CACHE_FILE" ]; then
        if [ $(wc -l < "$CACHE_FILE") -ge $MAX ]; then
            sed -i 'id' "$CACHE_FILE"
        fi
    fi

    cd "$dst" || return 1
         
    if [ ! -n $(grep "$PWD\$" "$CACHE_FILE") ]; then 
        echo "$PWD" >> "$CACHE_FILE"
    fi
}

cj "$1"


