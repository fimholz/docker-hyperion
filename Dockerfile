ARG HYPERIONVER=2.0.15
ARG DEBVER=bullseye

FROM debian:${DEBVER}-slim
ARG HYPERIONVER
ARG DEBVER
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    gpg \
    wget \
 && wget -qO- https://apt.hyperion-project.org/hyperion.pub.key | gpg --dearmor -o /usr/share/keyrings/hyperion.pub.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/hyperion.pub.gpg] https://apt.hyperion-project.org/ "$DEBVER" main" | tee /etc/apt/sources.list.d/hyperion.list \
 && apt-get update && apt-get install -y \
    hyperion="$HYPERIONVER"~"$DEBVER" \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Dashboard, JSON Server, Protocol Buffers Server
EXPOSE 8090 19444 19445

ENTRYPOINT ["/usr/bin/hyperiond"]
CMD ["--verbose"]
