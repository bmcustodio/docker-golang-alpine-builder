# docker-golang-alpine-builder

An image meant to be used as a base for multi-stage builds.

[![Docker Repository on Quay](https://quay.io/repository/bmcstdio/golang-alpine-builder/status "Docker Repository on Quay")](https://quay.io/repository/bmcstdio/golang-alpine-builder)

## Current Software

* Alpine 3.8
* Go 1.11.1
* `dep` 0.5.0
* `glide` 0.13.2
* `curl`, `git` and `make`

## Example

[`bmcstdio/docker-multi-stage-builds`](https://github.com/bmcstdio/docker-multi-stage-builds) uses this image as its base:

```Dockerfile
FROM quay.io/bmcstdio/golang-alpine-builder:1.1.0 AS builder
WORKDIR $GOPATH/src/github.com/bmcstdio/docker-multi-stage-builds
COPY . .
RUN dep ensure
RUN go build -o /app ./main.go

FROM alpine:3.8
COPY --from=builder /app /app
CMD ["/app"]
```

## License

Copyright 2017 bmcstdio

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
