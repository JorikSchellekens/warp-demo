# Getting started on StarkNet at Warp speed

An intro to warp

```bash
imgcat ./slides/cairo.png
```
---

# Why warp

Short dev time to deploy existing Solidity projects on StarkNet.

There are fundamental differences between Solidity and Cairo so some minor
changes to the Solidity source is necessary.

---

# Cairo fundamentals

## The fundamental data type: felt
```
2^251 + 7 * 2^192 + 1
```

---

# Cairo fundamentals

## Write **once** memory

```python
[ap] = 100; ap++
[ap - 1] = 0; ap++ # error
```

---

# Cairo fundamentals

## Builtins 

Builtins are memory locations with custom circuits defining their value's
relationship. For example:
- pedersen hash -- every 3 cells: 2 cells are inputs, 3rd cell is output
- range_check   -- values < 2^128
- syscall

---

# Cairo fundamentals

## Implicits

Implicits are values which are implicitly passed and returned from a
function

```c
func implicit{range_check_ptr}(/* no explicit args */) /* no return */:
    let range_check_ptr = range_check_ptr + 1
end

func main():
    let range_check_ptr = 0
    implicit()
    assert range_check_ptr = 1
end
```

Typically, we pass pointers to builtins as implicit arguments

---

# Cairo fundamentals

## Memory dict

An updatable (key, value) store which can be used to model memory

---

# Cairo fundamentals

## Hints

Cairo only needs to prove relationships
between memory locations. We can defer to
the execution environment to fill them.

sqrt example from cairo-lang.org:

```python
[ap] = 25; ap++
%{
    import math
    memory[ap] = int(math.sqrt(memory[ap - 1]))
%}
[ap - 1] = [ap] * [ap]; ap++
```
---

# Cairo fundamentals

## Storage vars

```python
@storage_var
func balance(user: felt) -> (balance: res):
end
```

---

# Installing warp

## Prerequisites:

z3

## Install
```bash
yarn global add @nethermindeth/warp
warp install
```

Onto a demo!

---

# Transpiling a large project

## Changes required

Replace assembly with Solidity -- math optimisations

Uniswap v3-core:
```solidity
assembly {
    let f := shl(7, gt(r, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
    msb := or(msb, f)
    r := shr(f, r)
}
```
Becomes

```solidity
f = 0;
if (r > 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
    f = 1 << 7;
msb = msb | f;
r = r >> f;
```

---

# Transpiling a large project

## Changes required

Replace assembly with Inline Cairo -- fallbacks

```solidity
pragma solidity ^0.8.10;

contract WARP {
  /// warp-cairo
  /// func INTERNALFUNC(stub)() -> (a: felt):
  ///     return (5)
  /// end
  function stub() internal returns (uint8) {
    return 0;
  }

  function useStub() public returns (uint8) {
    return stub();
  }
}
```
---

# Transpiling a large project

## Changes required

Replace assembly with Inline Cairo -- fallbacks

```solidity
pragma solidity ^0.8.10;

contract WARP {
  /// warp-cairo
  /// func INTERNALFUNC(stub)() -> (a: felt):
  ///     return (5)
  /// end
  function stub() internal returns (uint8) {
    return 0;
  }

  function useStub() public returns (uint8) {
    return stub();
  }
}
```

---

# Transpiling a large project

Address size changes to 251 bits

---

# Transpiling a large project
Check the unsuported features list:

  - abi.encode / abi.decode    # on the roadmap
  - terenary operators         # on the roadmap
  - indexed events             # on the roadmap
  - gas

Replace these where possible
  - ternary -> if
  - indexed -> non-indexed
---

# Roadmap

## Usability
 - Hardhat integration

## Language features
 - Indexed events
 - Function pointers
 - Abi encode and abi decode
 - Ternary expressions

## Maintenance

 - Cairo 0.10 -- **BIG HYPE**

---

# Shameless Nethermind plug



