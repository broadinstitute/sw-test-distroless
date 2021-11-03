FROM alpine AS picard

WORKDIR /build

RUN apk add curl jq
RUN wget $(curl -s https://api.github.com/repos/broadinstitute/picard/releases/latest | \
      jq -r .assets[1].browser_download_url)


FROM gcr.io/distroless/java:11

COPY --from=picard /build/picardcloud.jar ./

ENTRYPOINT ["java", "-jar", "picardcloud.jar"]