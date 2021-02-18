#!/usr/bin/env bash

usage='Usage: goto [-c] target'

workspace=${GOTO_WORKSPACE:-$HOME}
ignoreDirs=${GOTO_IGNORE:-'professor-cam'}
mode='cd'

while getopts ":c" opt; do
  case ${opt} in
    c ) mode='code'
      ;;
    \? ) echo "$usage"
      ;;
  esac
done
shift $((OPTIND -1))

if [[ $1 == '' ]]; then
  echo "$usage"
  exit 1
fi

target=''
for dir in $(ls $workspace); do
  if [[ $ignoreDirs =~ $dir ]]; then
    continue
  fi
  dir_initials=''
  for word in $(echo $dir | tr '-' ' '); do
    dir_initials="$dir_initials${word:0:1}"
  done
  if [[ $dir_initials == $1 ]]; then
    target="$dir"
    break
  fi
done

if [[ $target == '' ]]; then
  case $1 in
  'pca' | 'passport-control-activity')
    target='passport-control/packages/passport-control-activity'
    ;;
  *)
    target=$1
    ;;
  esac
fi

if [[ $mode == 'cd' ]]; then
  cd "$workspace/$target"
elif [[ $mode == 'code' ]]; then
  code "$workspace/$target"
fi
