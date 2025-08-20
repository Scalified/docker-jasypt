# Jasypt Docker Image

[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/Scalified/docker-jasypt/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/scalified/jasypt.svg)](https://hub.docker.com/r/scalified/jasypt)
[![Release](https://img.shields.io/github/v/release/Scalified/docker-jasypt?style=flat-square)](https://github.com/Scalified/docker-jasypt/releases/latest)

## Overview

Docker image that provides the [Jasypt](http://www.jasypt.org) command-line utilities for encryption and decryption

## Usage

See [Jasypt CLI](http://www.jasypt.org/cli.html) for the full list of available arguments

### String Encryption

```bash
docker run \
    --rm \
    scalified/jasypt \
    ./encrypt.sh input="This is my message to be encrypted" password="MYPAS_WORD" [ARGUMENTS]
```

### String Decryption

```bash
docker run \
    --rm \
    scalified/jasypt \
    ./decrypt.sh input="k1AwOd5XuW4VfPQtEXEdVlMnaNn19hivMbn1G4JQgq/jArjtKqryXksYX4Hl6A0e" password="MYPAS_WORD" [ARGUMENTS]
```

### File Decryption

```bash
docker run 
    --rm \
    scalified/jasypt \
    ./decryptFile.sh file="file.yaml" password="MYPAS_WORD" [ARGUMENTS]
```

---

**Made with ❤️ by [Scalified](http://www.scalified.com)**

