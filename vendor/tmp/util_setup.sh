#! /bin/sh

# app, db コンテナを立ち上げた後に実行する

eval 'dpkg-reconfigure locales' # <- en_US.utf8 を選択
echo 'export LANG=en_US.utf8' >> ~/.bashrc
eval 'source ~/.bashrc'
eval 'cp -r .vim ~/'
eval 'cp .vimrc ~/'
echo "ok"
