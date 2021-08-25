#!/bin/zsh

yynn=()

function pp {
  echo -e ${(j. \033[0;31m≪\033[0m .)yynn}
}

function yy {
  local dir="$1"
  [ -z "$dir" ] && dir="$(pwd)"
  [ ${yynn[(ie)$dir]} -gt ${#yynn} ] && yynn=($yynn $dir)
}

function nn {
  [ ${#yynn} -lt 1 ] && return 1 
  local i=${1-1}
  i=$(( i ))
  local dir=$yynn[$i]
  yynn[$i]=()
  local tail=($yynn)
  yynn=($yynn $dir)
  cd "${dir}"
  local line='\033[0;31m'${dir}' ≪\033[0m '
  line="${line}${(j. \033[0;31m≪\033[0m .)tail}" 
  echo -e ${line}
}

function dd {
  local dir="$1"
  [ -z "$dir" ] && dir="$(pwd)"
  yynn[${yynn[(ie)$dir]}]=()
}

function xx {
  local i=${1-1}
  i=$(( i ))
  yynn[$i]=()
}

