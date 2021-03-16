# DDDwithActorsPony

[![Build Status](https://travis-ci.com/d-led/DDDwithActorsPony.svg?branch=master)](https://travis-ci.com/d-led/DDDwithActorsPony)

Pony version of https://github.com/VaughnVernon/DDDwithActors by Vaughn Vernon

(no persistence at the moment)

## Structure

- main: [AccountRunner.pony](AccountRunner.pony)
- contracts: [Contracts.pony](Contracts.pony)
- contracts for a second, type-minimizing version: [SimplerContracts.pony](SimplerContracts.pony)
- implementations: the rest

## Running

- `docker-compose up --build`
- alternative: `ponyc && ./DDDwithActorsPony`
