
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {SimpleStorage} from "./SimpleStorage.sol";
contract AddFiveStorage is SimpleStorage{
    function Store(uint256 _newNumber) public override {
        myFavoretNumber = _newNumber + 5;
    }
}
