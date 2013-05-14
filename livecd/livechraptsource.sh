#!/bin/bash

export HOME=/root
export LC_ALL=C

# zmiana repozytoriow
echo "Kopiowanie sources.list"
cp /etc/apt/sources.list /etc/apt/sources.list_bak

#nowe repa
echo "Kopiowanie nowego sources.list"
cp /root/etc/apt/sources.list /etc/apt/sources.list

apt-get update

# dociagniece brakujacych kluczy
echo 'Prosze czekac...' && sudo apt-get update 2> klucze > /dev/null && sed -i '/NO_PUBKEY/!d;s/.*NO_PUBKEY //' klucze && gpg --keyserver keyserver.ubuntu.com --recv-keys $(cat klucze) && gpg --export --armor $(cat klucze) | sudo apt-key add - && rm -f klucze


