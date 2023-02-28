#!/bin/bash

MINER=astrominer-V1.7_BETA4_aarch64_linux
MINER_BIN=astrominer

MINER_PORT=10300

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e -n "${GREEN}Enter Your Miner Wallet Address: ${NC} \n"
read WALLET

ANSWER=N

while [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
do
        echo -n "Is this ($WALLET) correct? (y)"
        read ANSWER

        if [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
        then
               echo -n "Enter Your Miner Wallet Address: "
                read WALLET
        fi
done

echo " "

echo "Using Wallet Address: $WALLET"

NODE=dero-node-overlode.mysrv.cloud:$MINER_PORT

ANSWER=N

while [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
do
        echo -n "Use Following Mining Node? ($NODE)? (y)"
        read ANSWER

        if [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
        then
            echo -n "Enter Your Mining Node Address: "
            read NODE
        fi
done



[[ -f $MINER.tar.gz ]] && rm -f $MINER.tar.gz
[[ -d $MINER ]] && rm -rf $MINER

echo "Downloading Latest ($MINER) version ...."

wget -c -q https://github.com/dero-am/astrobwt-miner/releases/download/V1.7-BETA4/$MINER.tar.gz

[[ ! -d $MINER ]] && tar -xf $MINER.tar.gz

clear

echo "Starting up Dero Miner using wallet: $WALLET...."

# Run Miner

./astrominer -w $WALLET -r $NODE -p rpc

