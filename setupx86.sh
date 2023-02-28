#!/bin/bash

MINER=astrominer-V1.7_BETA4_modern_amd64_linux
MINER_BIN=astrominer

MINER_PORT=10300

GREEN='\033[0;32m'
NC='\033[0m' # No Color
RED='\033[0;31m'
YELLOW='\033[0;33m'

echo -e -n "${GREEN}Enter your Dero wallet address: ${NC}"
read WALLET

ANSWER=N

while [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
do
        echo -e "\n"
        echo -e -n "Is this ${GREEN} ($WALLET) ${NC} correct? (y)"
        read ANSWER

        if [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
        then
        echo -e "\n"
        echo -e -n "${GREEN}Enter your Dero wallet address: ${NC}"
                read WALLET
        fi
done

        echo -e "\n"

        echo -e -n "Using Wallet Address: ${GREEN} $WALLET ${NC}"

NODE=dero-node-overlode.mysrv.cloud:$MINER_PORT

ANSWER=N

while [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
do
        echo -e "\n"
        echo -e -n "Use Following Mining Node? ${GREEN} ($NODE) ${NC}? (y)"
        read ANSWER

        if [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
        then
            echo -n "Enter Your Mining Node Address: "
            read NODE
        fi
done

echoe -e "\n"

            echo -n "Enter number of threads to use: "
            read THREADS

echo -e "\n"

[[ -f $MINER.tar.gz ]] && rm -f $MINER.tar.gz
[[ -d $MINER ]] && rm -rf $MINER

echo -e -n "${RED}Downloading Latest Astrominer version .... ${NC}"

wget -c -q https://github.com/dero-am/astrobwt-miner/releases/download/V1.7-BETA4/$MINER.tar.gz

[[ ! -d $MINER ]] && tar -xf $MINER.tar.gz

echo -e "\n"

read -t 5 -p "Astrominer downloaded, running miner"

clear

echo -e "\n"

echo -e -n "Starting Astrominer using wallet:${YELLOW} $WALLET  ${NC}"

echo -e "\n"

# Run Miner

./astrominer -w $WALLET -r $NODE -p rpc
