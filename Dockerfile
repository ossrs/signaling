
############################################################
# build
############################################################
FROM registry.cn-hangzhou.aliyuncs.com/ossrs/srs:dev AS build

RUN make
RUN cp objs/signaling /usr/local/bin/signaling
RUN cp -R www /usr/local/www

############################################################
# dist
############################################################
FROM centos:7 AS dist

# HTTP/1989
EXPOSE 1989
# SRS binary, config files and srs-console.
COPY --from=build /usr/local/bin/signaling /usr/local/bin/
COPY --from=build /usr/local/www /usr/local/
# Default workdir and command.
WORKDIR /usr/local
CMD ["./bin/signaling"]
