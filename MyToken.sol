pragma solidity ^0.4.19;

contract MyToken {

    address owner;
    string myString;
    mapping(address => uint) balances;
    uint total;
    mapping(address => mapping (address => uint256)) allowed;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function MyToken()  public {
        owner = msg.sender;
        myString = "hello";
        total = 1000;
        balances[msg.sender] = total;
    }

    function hello() public view returns (string) {
        return myString;
    }

    function myBalance() public constant returns (uint) {
        return balances[msg.sender];
    }

    function totalSupply() public constant returns (uint) {
        return total;
    }

    function balanceOf(address _addr) public constant returns (uint) {
        return balances[_addr];
    }

    function addSupply(uint _amount) public onlyOwner {
        // no need any more with the onlyOwner modifier, require(msg.sender == owner);
        balances[owner] += _amount;
        total += _amount;

    }

    function transfer(address _to, uint256 _amount) public returns (bool success) {
        if (balances[msg.sender] >= _amount
            && _amount > 0
            && balances[_to] + _amount > balances[_to]) {
            balances[msg.sender] -= _amount;
            balances[_to] += _amount;
            return true;
        } else {
            return false;
        }
     }

     function transferFrom(address _from, address _to, uint _amount) public returns (bool success) {
        if (balances[_from] >= _amount
            && _amount > 0
            && allowed[_from][msg.sender] >= _amount
            && balances[_to] + _amount > balances[_to]) {
            balances[_from] -= _amount;
            allowed[_from][msg.sender] -= _amount;
            balances[_to] += _amount;
            return true;
        } else {
            return false;
        }
     }

     function approve(address _spender, uint _amount) public returns (bool success) {
        allowed[msg.sender][_spender] = _amount;
        return true;
     }


     function allowance(address _addr, address _spender) public constant returns (uint remaining) {
        return allowed[_addr][_spender];
     }
}
