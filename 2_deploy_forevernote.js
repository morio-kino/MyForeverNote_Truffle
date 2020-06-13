const ForeverNote = artifacts.require('./ForeverNote.sol')

module.exports = deployer => {
    deployer.deploy(ForeverNote).then(instance => {
        console.log('ABI:', JSON.stringify(instance.abi))
    })
}
