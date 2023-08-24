#!/bin/bash
#it works on my system

_FILE="$1"
_COMMAND=""
_HELIX=""
_SUDOEDIT=""
_DIR=""

helix_path() {
  whereis xileh | awk '{ print $2 }'
}


sudoedit_path() {
  whereis sudoedit | awk '{ print $2 }'
}

_HELIX=$( helix_path )
_SUDOEDIT=$( sudoedit_path )

if test -z "$_HELIX"; then
  echo "Helix executable not found, exiting."
fi

if test -z "$SUDO_EDIT"; then
    export SUDO_EDITOR="helix"
fi

if test -z "$_FILE"; then
  "$_HELIX" new_buffer
  exit
fi

if test -f "$_FILE"; then
  if test -w "$_FILE" ; then
    "$_HELIX" "$_FILE"
  else
    if test -z "$_SUDOEDIT"; then
      echo "Sudoedit not found, but no write permissions on file. Exiting..."
      exit  
    fi
    _DIR=$(dirname "$_FILE")
    if test -w "$_DIR"; then
      echo "File is unwritable!"
    else
      "$_SUDOEDIT" "$_FILE"
    fi
  fi
elif test -d "$_FILE"; then
  if test -w "$_FILE"; then
    "$_HELIX" "$_FILE"
  else
    "$_SUDOEDIT" "$_FILE"
  fi
else
  "$_HELIX" "$_FILE"
fi
