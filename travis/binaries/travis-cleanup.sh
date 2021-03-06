#!/bin/sh

# See travis/upload.sh for more documentation

git remote set-url --push origin git@github.com:haskell-pushbot/cabal-binaries.git
(umask 177 && tr A-Za-z N-ZA-Mn-za-m < id_rsa.rot13 > $HOME/.ssh/id_rsa)
ssh-keyscan github.com >> $HOME/.ssh/known_hosts
git push origin --delete "$(git rev-parse --abbrev-ref HEAD)"
