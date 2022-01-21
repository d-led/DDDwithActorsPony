# DDDwithActorsPony

[![Docker Image CI](https://github.com/d-led/DDDwithActorsPony/actions/workflows/docker-image.yml/badge.svg)](https://github.com/d-led/DDDwithActorsPony/actions/workflows/docker-image.yml)

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
