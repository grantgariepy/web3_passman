import detectEthereumProvider from '@metamask/detect-provider';
import { ethers, Contract } from 'ethers';
import Todo from './artifacts/contracts/Todo.sol/Todo.json';

const getBlockchain = () =>
  new Promise( async (resolve, reject) => {
    let provider = await detectEthereumProvider();
    if(provider) {
      await provider.request({ method: 'eth_requestAccounts' });
      const networkId = await provider.request({ method: 'net_version' })
      provider = new ethers.providers.Web3Provider(provider);
      const signer = provider.getSigner();
      const todo = new Contract(
        '0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512'
        ,Todo.abi,
        signer
      );
      resolve({todo});
      return;
    }
    reject('Install Metamask');
 });

export default getBlockchain;
