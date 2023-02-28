#!/bin/bash

MINERAMD=dero_linux_amd64
MINER_BIN_AMD=dero-miner-linux-amd64
MINERARM=astrominer-V1.7_BETA4_aarch64_linux.tar.gz
MINER_BIN_AARCH64=astrominer

MINER_PORT=10300
echo -n "Please enter your Dero wallet address: "
read WALLET

ANSWER=N

while [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
do
        echo -n "Is this ($WALLET) correct? (y)"
        read ANSWER

        if [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
        then
               echo -n "Please enter your Dero wallet address: "
                read WALLET
        fi
done

echo "Using Dero wallet address: $WALLET"

NODE=dero-node-overlode.mysrv.cloud:$MINER_PORT

ANSWER=N
while [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
do
        echo -n "Would you like to use OvErLoDe Node? ($NODE)? (y)"
        read ANSWER

        if [[ $ANSWER != "Y" && $ANSWER != "y" && $ANSWER != "" ]]
        then
            echo -n "Please enter your preferred mining node address: "
            read NODE
        fi
done



[[ -f $MINERAMD.tar.gz ]] && rm -f $MINERAMD.tar.gz
[[ -d $MINERAMD ]] && rm -rf $MINERAMD

[[ -f $MINERARM.tar.gz ]] && rm -f $MINERARM.tar.gz
[[ -d $MINERARM ]] && rm -rf $MINERARM

echo "Downloading latest Astrominer version ...."

wget -c https://github.com/dero-am/astrobwt-miner/releases/download/V1.7-BETA4/$MINERARM.tar.gz

[[ ! -d $MINERARM ]] && tar -zxpvf $MINERARM.tar.gz

echo "Starting Astrominer using Dero wallet address: $WALLET...."

# dero.rabidmining.com
MINER_SCRIPT=$PWD/$MINER/astrominer.sh

echo $PWD/$MINER/$MINER_BIN_AARCH64 -w $WALLET -r $NODE -p rpc
chmod +x $MINER_SCRIPT

$MINER_SCRIPT

echo -e "To start miner again, run\n$ $MINER_SCRIPT"
