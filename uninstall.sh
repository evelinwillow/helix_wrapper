#!/bin/bash
#it works on my system

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
  echo "$_PATH" | sed 's/xileh//g'
}

rename_bin()
{
  _NEW_PATH=$( get_base_path )"helix"
  sudo mv "$_PATH" "$_NEW_PATH"
}

_PATH=$( get_xileh_path )

if [[ -n $(echo "$_PATH" | grep "bin/") ]]; then
  echo "Modified binary found, restoring changes..."
  rename_bin
  echo "The wrapper has been uninstalled and the original helix binary has been restored."
else
  echo "Modified binary not found... either the wrapper has not been installed, or an unknown error occurred."
  
  exit
fi

if test -z "$_PATH"; then
  echo "An error occurred; exiting!"
fi

