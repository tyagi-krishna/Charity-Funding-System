// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract CharitySystem {
    struct Charity {
        string ChairtyName;
        address CharityCreator;
        // uint256 CharityEntranceFee;
    }
    struct Funder {
        string CharityName;
        address FundersAddress;
        uint256 FundingAmount;
    }
    Funder[] public Funders;
    Charity[] public Charities;

    function CreateCharity(
        string memory _CharityName // uint256 _CharityEntranceFee
    ) public {
        address _CharityCreator = msg.sender;
        Charities.push(_CharityName, _CharityCreator);
    }

    // function getEntranceFee(
    //     string memory _CharityName
    // ) public returns (uint256) {
    //     uint256 length = Charities.length();
    //     uint256 i = 0;
    //     while (i < length) {
    //         if (_CharityName == Charities.ChairtyName) {
    //             uint256 EntranceFee = Charities.CharityEntranceFee;
    //         } else {
    //             uint256 EntranceFee = 0;
    //         }
    //     }
    // }

    function Fund(string memory _CharityName, uint256 _AmountFunded) public {
        require(msg.value > 0, "Please Send Money.");
        uint256 i = 0;
        uint256 length = Charities.length();
        while (i < length) {
            if (_CharityName == Charities[i].CharityCreator) {
                address _FunderAddress = msg.sender;
                Funders.push(_CharityName, _FunderAddress, _AmountFunded);
            } else {
                require(false, "No Charity Found");
            }
        }
    }
}
