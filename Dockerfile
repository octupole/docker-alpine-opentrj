FROM octupole/alpine-openmpi:latest as base-openmpi
FROM alpine:latest

COPY --from=base-openmpi /usr/local /usr/local

RUN apk add wget cmake make fftw-dev g++ openssh
RUN set -x \
  && cd /tmp \
  && wget https://github.com/octupole/openTRJ/archive/v0.5.beta7.tar.gz \
  && tar xvfz "v0.5.beta7.tar.gz" \
  && cd openTRJ-0.5.beta7 \
  && mkdir build\
  && cd build\
  && cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. \
  && make -j \
  && make install
  






