pragma solidity ^0.5.0;

//ERC20 reference interface 
interface ERC20 {}

// interface of keybernet proxy smart contract for instantioation reference 
contract KyberNetworkProxy {
    function swapEtherToToken(ERC20, uint) public payable returns(uint){}
    function getExpectedRate(ERC20, ERC20 , uint) public view returns(uint , uint){}
    function swapTokenToToken(ERC20,uint ,ERC20, uint)public returns(uint){}
    function swapTokenToEther(ERC20, uint, uint) public returns(uint){}
    
}


contract KyberSwap {

//hardcoded for ethereum type transfers only , for now , i.e , ETH to token

address dest = 0x0000000000000000000000000000000;
KyberNetworkProxy KI ;
 //0xF77eC7Ed5f5B9a5aee4cfa6FFCaC6A4C315BaC76;
constructor(address _t) public {
    KI = KyberNetworkProxy(_t);
}


function InitiateSwapping(ERC20 token , uint256 numOfTokens) public payable returns() {
    address borrower = msg.sender;

    // this tells how many ether we will need 

    (uint256 finalAmount ,) = getRate(token, dest, numOfTokens);

    // converting tokens
    // minimum ramount of tokens to be bought/send cannot be less then number of tokens user asked for 
    Ether_Token_Swap(finalAmount), numberOfTOkenss);

    // send back tokens to user , since exchnaged tokens is held by contract

    token.transfer(address.this,msg.sender,numberOfTokens) 
}



function getRate(ERC20 src, ERC20 dest, uint srcQty) public view returns (uint,uint) {
return (KI.getExpectedRate(src, dest,srcQty));
}

function Token_Token_Swap(ERC20 src,uint srcAmount,ERC20 dest,uint minConversionRate) public returns(uint)
{
  return (KI.swapTokenToToken(src, srcAmount, dest,minConversionRate));
}

function Ether_Token_Swap(ERC20 token, uint minConversionRate) public payable returns(uint) 
{
 return (KI.swapEtherToToken(token, minConversionRate)) ;
}

function Token_Ether_Swap(ERC20 token, uint srcAmount, uint minConversionRate) public returns(uint)
{
    return (KI.swapTokenToEther(token,srcAmount,minConversionRate)) ;
}


}