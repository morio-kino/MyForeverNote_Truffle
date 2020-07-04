# Set the truffle path to the PATH environment variable.
export PATH=`pwd`/node_modules/.bin:$PATH

# Check to see if npm is installed.
hash npm
if [ "$?" = "0" ]; then
    echo "npm is already installed."
else
    echo "npm is not installed yet."
    echo "Please install npm."
    exit
fi

# Check to see if Truffle is installed."
hash truffle
if [ "$?" = "0" ]; then
    echo "Truffle is already installed."
else
    echo "Truffle is not installed yet."
    echo "Install Truffle."
    npm install truffle
fi

# Create a Truffle project.
PROJECT_DIR=MyProject

if [ -d $PROJECT_DIR ]; then
    echo "Do you want to remove the existing $PROJECT_DIR directory? (y/n)"
    read INPUT
    if [ "$INPUT" = "y" ]; then
        rm -rf $PROJECT_DIR
    else
        echo "Abort the build process."
        exit
    fi
fi

echo "Create a Truffle project."
mkdir $PROJECT_DIR
cd $PROJECT_DIR
truffle init

# Install truffle-hdwallet-provider
sudo npm install truffle-hdwallet-provider

# Copy the files.
cp ../MyForeverNote.sol contracts/.
cp ../2_deploy_forevernote.js migrations/.
cp ../.secret .

# Add a definition of a constant to truffle-config.js
# Add it after the first comment.
ed - truffle-config.js <<-EOF
/^ \*\//
a
const HDWalletProvider = require('truffle-hdwallet-provider');
const fs = require('fs');
const mnemonic = fs.readFileSync('.secret').toString().trim();
const projectid = 'ad6d6c94cddf4103a6692157dc215c8f';
.
w
q
EOF

# Add the network definition to truffle-config.js.
ed - truffle-config.js <<-EOF
/^  networks: {$/
a
    development: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 8545,            // Standard Ethereum port (default: none)
      network_id: 15,       // Any network (default: none)
      from: "0x66b4e7be902300f9a15d900822bbd8803be87391",
      gas: 4500000,
      gasPrice: 10000000000   // 10 Gwei
    },
    ganache: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    },
    ropsten: {
      provider: () => new HDWalletProvider(mnemonic, \`https://ropsten.infura.io/v3/\${projectid}\`),
      network_id: 3,       // Ropsten's id
      gas: 1000000,        // Ropsten has a lower block limit than mainnet
      gasPrice: 10000000000   // 10 Gwei
      // confirmations: 2,    // # of confs to wait between deployments. (default: 0)
      // timeoutBlocks: 200,  // # of blocks before a deployment times out  (minimum/default: 50)
      // skipDryRun: true     // Skip dry run before migrations? (default: false for public nets )
    },
.
w
q
EOF

# Operate Truffle.
echo "### Start compiling."
truffle compile --all

echo "### Start migrate"
truffle migrate --network ropsten
#truffle migrate --network development


