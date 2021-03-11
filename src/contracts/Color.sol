pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Color is ERC721 {
  struct Set {
    uint size;
    mapping (string => uint) _items;
  }
  Set ids = Set(0);
  function addItem(string memory _item) private returns(uint) {
    require(!hasItem(_item));

    return ids._items[_item] = ++ids.size;
  }
  function hasItem(string memory _item) private returns(bool) {
    return ids._items[_item] > 0;
  }
  constructor() ERC721() public {}
  // E.G. color = "#FFFFFF"
  function mint(string memory _color) public {
    uint _id = addItem(_color);
    _mint(msg.sender, _id);
  }
}
