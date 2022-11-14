# Example Ethereum CTF challenge

This challenge uses the Ethereum ctf challenge framework developed by samczsun at Paradigm. It was originally written for CSAW CTF 2022.

We've made this challenge public so as to provide a self-contained example on how to use Paradigm's CTF framework.

See [this blog post](https://www.zellic.io/blog/how-to-create-an-ethereum-ctf-challenge) for more information. Pull requests welcome!

## Installing

### Prerequisites

* Docker
* [mpwn](https://github.com/lunixbochs/mpwn)
* Python 3

### Configuration

You'll need to set the following environment variables:
* `ETH_RPC_URL` to a valid Ethereum JSON-RPC endpoint
* `PYTHONPATH` to point to mpwn

You'll also need to manually install the following:
* `pip install yaml ecdsa pysha3 web3`

## Usage

### Build everything

```bash
docker buildx build --platform linux/amd64 -t mytag .
```

### Run a challenge

Running a challenge will open a port which users will `nc` to. For Ethereum/Starknet related
challenges, an additional port must be supplied so that users can connect to the Ethereum/Starknet
node

```
./run.sh mytag 31337 8545
```

On another terminal:

```
nc localhost 31337
```

When prompted for the ticket, they will need to solve a PoW. This ticket should NOT be shared between teams, it's a secret.

```
$ nc localhost 31337
1 - launch new instance
2 - kill instance
3 - get flag
action? 1
ticket please: ticket

your private blockchain has been deployed
it will automatically terminate in 30 minutes
here's some useful information
```

### How to solve it

See solve.sh, basically just deploy Exploit.sol contract and run it. Constructor expects 100 eth and parameter is setup contract address
