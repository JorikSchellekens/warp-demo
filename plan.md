# Install


```
yarn global add @swp0x0/warp
warp install
```

If you're on mac you'll need to

```
brew install z3
```

Test we have warp installed

```
warp
```

Set the starknet env variables

```
export STARKNET_NETWORK=alpha-goerli
export STARKNET_WALLET=starkware.starknet.wallets.open_zeppelin.OpenZeppelinAccount
```

Go to the examples

```
cd ..
```

# ERC20 example

Deploy accounts

```
warp deploy_account
warp deploy_account doquan
```

Transpile ERC20

```
warp transpile openzeppelin-contracts/contracts/token/ERC20/ERC20.sol
```

Deploy the ERC20

```
warp deploy warp_output/openzeppelin___contracts/contracts/token/ERC20/ERC20__WARP_CONTRACT__ERC20.cairo --inputs 5 0x53 0x54 0x41 0x52 0x4B 5 0x53 0x54 0x41 0x52 0x4B 
```

## Invoke

```
warp invoke --function mint to account
```

```
warp invoke transfer
```

## Inspection

# Syntax

## Modifiers
## Inheritance

# Semantic

## Memory
## Storage Semantics
## Copy semantics

# Contrived extend ERC20 with an array

