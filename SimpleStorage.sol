// EVM, 
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; // This is solidity versions

contract SimpleStorage { // This is like class

    uint256  myFavoretNumber; // 0

    // uint256[] listOfFavoriteNumbers; // [0, 45, 90]
    struct Person{
        uint256 favoratNumber;
        string name;
    }

    Person[] public listOfPeople;  // []

    mapping(string => uint256) public nameToFavoreteNumber;

    // Person public pat = Person(7,"pat");

    function Store(uint256 _favoretNumber) public virtual  {
        myFavoretNumber= _favoretNumber;
    }

    // view, pure
    function retrieve() public view returns (uint256){
        return myFavoretNumber;
    }

    function addPerson(string memory _name, uint256 _favoretNumber) public {
        listOfPeople.push(Person(_favoretNumber, _name));
        nameToFavoreteNumber [_name] = _favoretNumber;
    }
}