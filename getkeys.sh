#!/bin/bash

# (c)2022 Koraltan Kaynak <koraltan.kaynak@gmail.com>
# Licensed under MIT License https://choosealicense.com/licenses/mit

umask 077

KFILE="/tmp/authkeys.$$"
RC=0

if [[ $# -ne 1 ]]; then
  echo "Please start with a github user account..." >&2
  exit 1
fi

GITHUBUSER=$1

curl -s https://github.com/${GITHUBUSER}.keys > $KFILE

LINE=$(head -n 1 $KFILE)

if [ "$LINE" = "Not Found" ]; then
  echo "Couldn't get any keys. Does the github account exist?" >&2
  RC=!
else
  cat $KFILE >> ~/.ssh/authorized_keys
  rm $KFILE
  echo "Done. Added keys for [$GITHUBUSER] in folder [.ssh/]"
  exit $RC
fi