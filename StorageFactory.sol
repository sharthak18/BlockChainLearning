
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public listOfSimpleStorageContracts;

function createSimpleStorageContract () public {

 SimpleStorage newSimpleStorageContract = new SimpleStorage();
 listOfSimpleStorageContracts.push(newSimpleStorageContract);
}
function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
    // adresss
    //ABI
    SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
   mySimpleStorage.Store(_newSimpleStorageNumber); // assuming _set is your store function name.

}
function sfGet(uint256 _simpleStorageIndex)  public view returns (uint256){
    SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
    return mySimpleStorage.retrieve();
}
}