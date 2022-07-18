#!/bin/bash

# (c)2022 Koraltan Kaynak <koraltan.kaynak@gmail.com>
# Licensed under MIT License https://choosealicense.com/licenses/mit

umask 077

tmpfile="/tmp/authkeys.$$"
rc=0

if [[ $# -ne 1 ]]; then
  echo "Please start with a github user account..." >&2
  exit 1
fi

githubuser=$1

curl -s https://github.com/${githubuser}.keys >$tmpfile
if [[ $( stat -c'%s' $tmpfile ) -gt 1 ]]; then
  cat $tmpfile >>~/.ssh/authorized_keys
  echo >>~/.ssh/authorized_keys
else
  echo "Couldn't get any keys. Does the github account exist?" >&2
  rc=1
fi

rm $tmpfile

echo "Done. Added keys for [$githubuser]"
exit $rc