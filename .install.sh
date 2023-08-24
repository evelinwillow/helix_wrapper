#!/bin/bash
#it works on my system

_PATH=""
_NEW_PATH=""
_NEW_BIN=""

get_helix_path()
{
  whereis helix | awk '{ print $2 }'
}

get_xileh_path()
{
  whereis xileh | awk '{ print $2 }'
}

get_base_path()
{
  echo "$_PATH" | sed 's/helix//g'
}

rename_bin()
{
  _NEW_PATH=$( get_base_path )"xileh"
  sudo mv "$_PATH" "$_NEW_PATH"
}

_PATH=$( get_helix_path )

if [[ -n $(echo "$_PATH" | grep "bin/") ]]; then
  echo "Helix binary found."
  if cmp -s "$_PATH" .wrapper.sh; then
    echo "Wrapper has already been installed!"
    exit
  fi
  rename_bin
  ./.move.sh
else
  echo "Helix binary not found!"
  exit
fi

if test -z "$_PATH"; then
  echo "An error occurred; exiting!"
fi

