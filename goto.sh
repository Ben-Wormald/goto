#!/usr/bin/env bash

workspace=${GOTO_WORKSPACE:-$HOME}
ignoreDirs=${GOTO_IGNORE:-'professor-cam'}

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

cd "$workspace/$target"
