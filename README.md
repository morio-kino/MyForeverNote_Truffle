[to Wiki](../../wiki)

# MyForeverNote

## Overview.
MyForeverNote uses Ethereum to.

+ Create, update and record personal notes.
+ You can search and view the notes you have created.
+ The notes are encrypted and cannot be viewed without an Ethereum wallet.
+ You can export/import notes you've created, so you can transfer the notes you've created to other wallets You can take over to.
+ local DB functionality
    + Create, update, search, and save notes even when you are not connected to the network by using local DBs You can view the information created in the remote DB (on Ethereum)
    + Local DB (local file) for information created in a remote DB (on Ethereum). You can save them as.
    + Notes created in the local DB can be exported/imported to a remote DB ( Ethereum).

# MyForeverNote_Truffle
Truffle project for MyForeverNote contract.


## Network Settings.
In the "# Add the network definition to truffle-config.js." part of build.sh,
you can specify network settings.  
This will add the network definition to the following file after it is built

~~~
MyProject/truffle-config.sj
~~~

## Specify the deployment location
The following line in build.sh determines the deployment destination.

~~~
#truffle migrate --network ropsten
truffle migrate --network development
~~~

## Specify the passphrase for deployment to Ropsten.
.secret
Specify the passphrase for deployment to Ropsten in the following file.

~~~
.secret
~~~

## The account for deployment.
The account to be used for deployment is specified in the network settings of build.sh.

## Run the build
The build will be executed by executing the following command.

~~~
$ ./build.sh
~~~

## Contract information file.
If the build is successful, a contract information file will be created in the following location.

~~~
MyProject/contract-info.js
~~~

This file is used by the MyForeverNote front-end program.
