pragma solidity ^0.8.10;

//SPDX-License-Identifier: MIT

contract Base {
  function func(uint8 x) virtual pure public returns (uint8) {
    return x;
  }
}

contract Mid is Base {
  function func(uint8 x) override pure public returns (uint8) {
    return x*2;
  }
}

contract Derived is Mid {
  function compute(uint8 x) pure public returns (uint8) {
    return super.func(x) + Base.func(x);
  }
}
