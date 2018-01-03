# claymore-eth-docker-amd [![Build Status](https://travis-ci.org/CultClassik/claymore-eth-docker-amd.svg?branch=master)](https://travis-ci.org/CultClassik/claymore-eth-docker-amd)
[Image on Docker Hub](https://hub.docker.com/r/cultclassik/claymore-eth/)

Dockerfile to build cultclassik/claymore GPU container.

Incorporates Claymore's dual ETH miner.

Written to mine ETH on ethermine and LBC on supernova.

## Pre-requisites

Requires a working installation of Docker CE or EE and Nvidia-Docker2.

## Installation

docker build -t cultclassik/claymore-eth:amd .

## Usage

docker run --device=/dev/dri cultclassik\claymore-eth:amd

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

TODO: Write history

## Credits

TODO: Write credits

## License

TODO: Write license