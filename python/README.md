# Python Docker images

## Docker image containing

- navikt/common
- slim variant of the official Python image for given version

## Basic Usage

We support two ways of running your app:

1. a script called `main.py`
2. Regular Docker CMD

Create a `Dockerfile` containing:

### Simplest example

The simplest way of running your app is to create a script to start the applicaton and copy it into your container as `main.py`.
Since the default working directory is `/app`, there's no need to specify the path.

```Dockerfile
FROM navikt/python:3.8
COPY my-cool-app/ .
```
