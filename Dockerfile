FROM golang:1.11.1-alpine3.8

ENV DEP_VERSION v0.5.0
ENV GLIDE_VERSION v0.13.2

WORKDIR /tmp/pkg

RUN apk add --no-cache curl git make && \
    curl -fsSL -o ./dep https://github.com/golang/dep/releases/download/${DEP_VERSION}/dep-linux-amd64 && \
    chmod +x ./dep && \
    mv ./dep /usr/local/bin/ && \
    curl -fsSL -o ./glide.tar.gz https://github.com/Masterminds/glide/releases/download/${GLIDE_VERSION}/glide-${GLIDE_VERSION}-linux-amd64.tar.gz && \
    tar zxf glide.tar.gz && \
    mv ./linux-amd64/glide /usr/local/bin/ && \
    rm -rf /tmp/pkg

WORKDIR $GOPATH
