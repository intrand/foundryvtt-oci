FROM alpine:3.18.4
RUN apk add --no-cache \
        npm \
        openssl-dev && \
    adduser \
        -D \
        -g '' \
        app && \
    mkdir -p \
        /opt/foundryvtt \
        /opt/foundrydata && \
    chown -R app:app /opt/foundrydata;
COPY dist/ /opt/foundryvtt/
USER app
ENTRYPOINT ["node", "/opt/foundryvtt/resources/app/main.js", "--dataPath=/opt/foundrydata"]
