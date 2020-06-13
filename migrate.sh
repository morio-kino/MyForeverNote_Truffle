# Set the truffle path to the PATH environment variable.
export PATH=`pwd`/node_modules/.bin:$PATH

cd MyProject

echo "### Run truffle migrate."
truffle migrate --network ropsten
#truffle migrate --network development


