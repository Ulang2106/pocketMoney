#!/bin/sh

# db コンテナを立ち上げた後に実行する

# system update
USER="root"

echo "system update"
/bin/su -s /bin/sh "$USER" \
        -c "apt-get update && apt-get install -y vim less locales dialog && sh util_setup.sh"

