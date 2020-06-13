# ForeverNote_Truffle
Truffle project for ForeverNote.


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

## The account to be used for deployment is specified in the network settings of build.sh.

## Run the build
The build will be executed by executing the following command.

