const MyForeverNote = artifacts.require('./MyForeverNote.sol')

module.exports = deployer => {
    deployer.deploy(MyForeverNote).then(instance => {
        console.log('=======================================');
        console.log('address:', JSON.stringify(instance.address));
        console.log('ABI:', JSON.stringify(instance.abi));
        console.log('=======================================');

        var  fs = require("fs");
        var info = '';
        info += '// Address of MyForeverNote contract.\n';
        info += 'var addr = ' + JSON.stringify(instance.address) + ';\n';
        info += '\n';
        info += '// ABI of MyForeverNote contract.\n';
        info += 'var ABI = ' + JSON.stringify(instance.abi) + ';\n'
        try {
            fs.writeFileSync('contract-info.js', info);
        } catch(e) {
            if(err) console.log(err);
        }
    })
}

