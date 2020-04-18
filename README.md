# Saytheword

A WordPress example using Composer, Docker and Stonehenge.

## Environments

Env | Branch | URL
--- | ------ | ---
development | * | https://wp.docker.sh/
testing | dev | TBD
production | master | TBD

## Requirements

You need to have these applications installed to operate on all environments:

- [Docker](https://github.com/druidfi/guidelines/blob/master/docs/docker.md)
- [Stonehenge](https://github.com/druidfi/stonehenge)
- For the new person: Your SSH public key needs to be added to servers

## Create and start the environment

For the first time:

```
$ make fresh
```

Ready! Now go to https://wp.docker.sh/ to see your site.
