# Docker

This project requires the tools:
  
  - Docker Machine
  - Docker Compose
  - Docker

### Installation

Use git bash to configuration tools.

Install Docker Machine.

```sh
$ mkdir -p "$HOME/bin"
$ curl -L "https://github.com/docker/machine/releases/download/v0.14.0//docker-machine-Windows-x86_64.exe" > "$HOME/bin/docker-machine.exe"
$ chmod +x "$HOME/bin/docker-machine.exe"
```

Create and configure default machine.

```sh
$ docker-machine create default
$ eval $(docker-machine env default)
```

Install Docker Compose

```sh
$ curl -L "https://github.com/docker/compose/releases/download/1.22.0-rc1/docker-compose-Windows-x86_64.exe" > "$HOME/bin/docker-compose.exe"
$ chmod +x "$HOME/bin/docker-compose.exe"
```

Install Docker

```sh
$ mkdir -p "$HOME/tmp"
$ curl -L "https://download.docker.com/win/static/stable/x86_64/docker-17.09.0-ce.zip" > "$HOME/tmp/docker.zip"
$ unzip "$HOME/tmp/docker.zip" -d "$HOME/tmp/"
$ mv "$HOME/tmp/docker/docker.exe" "$HOME/bin/docker.exe"
$ rm -rf "$HOME/tmp/docker" "$HOME/tmp/docker.zip"
```

### Get start

Use git bash to start service.

Create docker-compsoe.yml.

```yml
version: '2.1'

services:
  service:
    image: hunsche/delphi-dev:1.0 
    ports:
      - '64211:64211'
```

Open docker-compose.yml folder.

```sh
$ docker-compose up
```