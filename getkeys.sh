#!/bin/bash

# (c)2022 Koraltan Kaynak <koraltan.kaynak@gmail.com>
# Licensed under MIT License https://choosealicense.com/licenses/mit

umask 077

DEFAULTUSER="kori2000"
KFILE="/tmp/authkeys.$$"
RC=0

if [[ $# -ne 1 ]]; then
  echo "No GitHub User given => Okay, take [$DEFAULTUSER]..." >&2
  GITHUBUSER=$DEFAULTUSER
else
  echo "Selected GitHub User [$1]. Loading Keys... "
  GITHUBUSER=$1
fi

curl -s https://github.com/${GITHUBUSER}.keys > $KFILE

LINE=$(head -n 1 $KFILE)

if [ "$LINE" = "Not Found" ]; then
  echo "Couldn't get any Keys for GitHub User [$GITHUBUSER] :(" >&2
  RC=!
else
  cat $KFILE >> ~/.ssh/authorized_keys
  rm $KFILE
  echo "Done. Added keys from [$GITHUBUSER] :)"
  exit $RC
fi