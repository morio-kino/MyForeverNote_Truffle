const ForeverNote = artifacts.require('./ForeverNote.sol')

module.exports = deployer => {
    deployer.deploy(ForeverNote).then(instance => {
        console.log('=======================================');
        console.log('address:', JSON.stringify(instance.address));
        console.log('ABI:', JSON.stringify(instance.abi));
        console.log('=======================================');

        var  fs = require("fs");
        var info = '';
        info += '// Address of ForeverNote contract.\n';
        info += 'var addr = ' + JSON.stringify(instance.address) + ';\n';
        info += '\n';
        info += '// ABI of ForeverNote contract.\n';
        info += 'var ABI = ' + JSON.stringify(instance.abi) + ';\n'
        try {
            fs.writeFileSync('contract-info.js', info);
        } catch(e) {
            if(err) console.log(err);
        }
    })
}

