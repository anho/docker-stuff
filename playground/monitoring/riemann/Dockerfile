FROM develar/java:8u45

ENV RIENMANN_VERSION=0.2.10
ENV RIEMANN_PATH_CONF=/home/riemann
ENV RIEMANN_CONFIG=/home/riemann/riemann.config

RUN apk -U add curl bash && \
    adduser -D riemann

USER riemann
WORKDIR /home/riemann

RUN curl -o riemann.tar.bz2 https://aphyr.com/riemann/riemann-$RIENMANN_VERSION.tar.bz2 && \
    tar -xj -f riemann.tar.bz2 && \
    ln -s riemann-$RIENMANN_VERSION riemann-current

COPY riemann.config riemann.config

## 5555 - Riemann TCP and UDP
EXPOSE 5555 5555/udp

ENTRYPOINT ["/home/riemann/riemann-current/bin/riemann"]
CMD ["riemann.config"]
