pragma solidity ^0.8.6;

//SPDX-License-Identifier: MIT

contract S2C {
    struct S {
        uint256 m1;
        uint32 m2;
        uint32 m3;
    }
    S s;

    function setS(uint256 m1, uint32 m2, uint32 m3)  public {
      s = S(m1, m2, m3);
    }

    function getS() public view returns (S memory) {
      S memory ss  = s;
      return ss;
    }
}

contract M2S {

    struct S {
      uint a;
      T t;
    }

    struct T {
      uint a;
    }

    S s;
    T t;

    function copySimpleStruct(uint a) public {
      T memory tMem = T(a);
      t = tMem;
    }

    function copyNestedStruct(uint a, uint b) public {
      S memory sMem = S(a, T(b));
      s = sMem;
    }

    function copyInnerStruct(uint a) public {
      T memory tMem = T(a);
      s.t = tMem;
    }

    // Results are unpacked because this test is not to test for return structs
    function getStructs() view public returns (uint, uint, uint) {
      return (s.a, s.t.a, t.a);
    }
}
