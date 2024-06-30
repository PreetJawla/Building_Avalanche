// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";


contract DeganToken is ERC20("Degan Token", "DT"), ERC20Burnable, Ownable(msg.sender) {
    string[4] public ItemForSale = ["1. Yellow Shirt","2. M416 Skin","3. Shotgun Skin","4. Legendery Marrine Outfint"]; 
    string[] public MyInvetory;
    
    function mint1(address to, uint256 amount) public onlyOwner {
        _mint(to, amount*10**2);
    }

    function burn(uint256 amount) public override {
        _burn(msg.sender, amount);
    }

    function tranfer1(address to, uint256 amount) public {
        //approve(msg.sender, amount);
        _transfer(msg.sender, to, amount);
    }

    function getbalance() external view returns(uint256){
        return this.balanceOf(msg.sender);
    }

    function getItemsForSale() public view returns (string[4] memory) {
        return ItemForSale;
    }

        function getInventory() public view returns (string[] memory) {
        return MyInvetory;
    }

    function StoreItem(uint _value) external returns(string memory){
        if (_value == 1) {
            _burn(msg.sender,200);
            MyInvetory.push("Yellow Dress");
            return "You now have 1 yellow dress.";
        } else if (_value == 2) {
            _burn(msg.sender,400);
            MyInvetory.push("M416");
            return "You now have M416 skin";
        } else if (_value == 3) {
            _burn(msg.sender,500);            
            MyInvetory.push("Shotgun Skin");
            return "You now have Shotgun skin";
        } else if(_value ==4) {
            _burn(msg.sender,550);
            MyInvetory.push("Marrine Outfit");
            return "You now have a Legendery Marrine Outfit";
        }
        else{
            return "There is no item at such inedx for sale";
        }
    }



}

