# serverpod_cloudrun_server

This is the starting point for your Serverpod server.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker-compose up --build --detach

Then you can start the Serverpod server.

    dart bin/main.dart

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker-compose stop


lets see how we can deploy serverpod to cloud run 

    1. Enable Api   
        Cloud Run
        Artifact Registry
        Cloud Build

    1. Create the Service accout and get the json file
    2. Storing the Json File in Github secrets
    3. Review the Github Workflows and Docker File
    4. Lets Do git push





```
ARG mode=development
ARG serverId=1

FROM dart:stable

RUN echo Building Image in $mode mode and with Server Id: $serverId

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
ENV RUN_SERVER_ID=$serverID

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082 

CMD app/bin/main.exe --mode ${runmode} 
```