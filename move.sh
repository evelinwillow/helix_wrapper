#!/bin/bash
#it works on my system

_FLAG="failure"

echo "Installing the wrapper..."

sudo chmod -w .wrapper.sh && \
sudo chmod +x .wrapper.sh && \
sudo cp .wrapper.sh /usr/bin/helix && _FLAG="success"

if test "$_FLAG" = "success"; then
  echo "Successfully installed the wrapper."
else
  echo "An issue occurred while installing the wrapper!"
fi