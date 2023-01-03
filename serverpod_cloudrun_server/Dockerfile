ARG mode=development

FROM dart:stable
ARG mode
RUN echo "Building Image in ${mode} mode"

WORKDIR /app
COPY pubspec.* .
COPY . .

RUN  dart pub get
RUN dart compile exe bin/main.dart

FROM alpine:3.4

COPY --from=0 /runtime/ /
COPY --from=0 /app/bin/main.exe /app/bin/
COPY --from=0 /app/config/ config
COPY --from=0 /app/generated/ generated
COPY --from=0 /app/web/ web

ARG mode
ENV runmode=$mode

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082 

CMD app/bin/main.exe --mode ${runmode} 



######### Smaller Image with kernel build (~50 mb) ########
# FROM dart:stable as build

# ARG mode=development
# ARG serverId=1


# RUN echo Building Image in $mode mode and with Server Id: $serverId

# ENV RUN_MODE=$mode
# ENV SERVER_ID=$serverID

# WORKDIR /app
# COPY . .

# RUN  dart pub get

# RUN dart compile kernel bin/main.dart
# RUN chmod +x ./bin/main.dill

# FROM alpine

# COPY --from=build /usr/lib/dart/bin/dart /usr/lib/dart/bin/dart
# COPY --from=build /runtime/ /
# COPY --from=build /app/bin/main.dill /app/bin/
# COPY --from=build /app/config/ config/ 
# COPY --from=build /app/generated/ generated/
# COPY --from=build /app/web/ web/

# EXPOSE 8080
# EXPOSE 8081
# EXPOSE 8082 
# ENTRYPOINT ["/usr/lib/dart/bin/dart", "/app/bin/main.dill"]
