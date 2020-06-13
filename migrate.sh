# truffleのパスを設定
export PATH=`pwd`/node_modules/.bin:$PATH

cd MyProject

echo "### truffleのmigrateを実行します。"
truffle migrate --network ropsten
#truffle migrate --network development


