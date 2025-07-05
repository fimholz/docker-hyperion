# hyperion.ng in docker
https://github.com/hyperion-project/hyperion.ng

## build example

```docker buildx build -t fimholz/hyperion.ng:latest -t fimholz/hyperion.ng:2.1.1 .```

## docker compose example

```
services:
  hyperion:
    image: fimholz/hyperion.ng:latest
    ports:
      - "8090:8090"   # Dashboard
      - "19400:19400" # Flatbuffers Server
      - "19444:19444" # JSON Server
      - "19445:19445" # Protocol Buffers Server
    restart: unless-stopped
    volumes:
      - data:/root/.hyperion

volumes:
  data:
```

## docker run example (testing)

```
docker run --rm --publish 8090:8090 fimholz/hyperion.ng:latest
```