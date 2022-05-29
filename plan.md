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
warp transpile ERC20/ERC20.sol
```

Deploy the ERC20

```
warp deploy warp_output/ERC20/ERC20_ERC20.cairo --inputs 5 0x53 0x54 0x41 0x52 0x4B 5 0x53 0x54 0x41 0x52 0x4B 
warp status <tx-hash>
```

## Invoke

```
warp invoke warp_output/ERC20/ERC20_ERC20.cairo --address <contract_address> --function mint_40c10f19 --inputs <__default__> 0 1000

```

```
warp invoke warp_output/ERC20/ERC20_ERC20.cairo --address <contract_address> --function transfer_a9059cbb --inputs <doquan> 0 10
```

## Inspection

# Syntax

## Modifiers

```
warp transpile syntax/modifiers.sol
```

## Inheritance

```
warp transpile syntax/inheritance.sol
```

# Semantic

## Memory

```
warp transpile semantic/memory.sol
```

## Storage Semantics

```
warp transpile semantic/storage.sol
```

## Copy semantics

```
warp transpile semantic/copy_semantics.sol
```

