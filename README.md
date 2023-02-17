# hyperion.ng in docker
https://github.com/hyperion-project/hyperion.ng

## build example

```docker build -t fimholz/hyperion.ng:latest -t fimholz/hyperion.ng:2.0.14 .```

## docker compose example

```
version: "3.8"

x-images:
  - &image "fimholz/hyperion.ng:latest"
    
volumes:
  data:

services:
  hyperion:
    restart: unless-stopped
    image: *image
    ports:
      - "8090:8090"   # Dashboard
      - "19400:19400" # Flatbuffers Server
      - "19444:19444" # JSON Server
      - "19445:19445" # Protocol Buffers Server
    volumes:
      - data:/root/.hyperion

```
