# Python 3.7 Docker image

## Docker image containing

- navikt/common
- Python 3.7-slim

## Basic Usage

We support two ways of running your app:

1. a script called `main.py`
2. Regular Docker CMD

Create a `Dockerfile` containing:

### Simplest example

The simplest way of running your app is to create a script to start the applicaton and copy it into your container as `main.py`.
Since the default working directory is `/app`, there's no need to specify the path.

```Dockerfile
FROM navikt/python:3.7
COPY my-cool-app/ .
```
