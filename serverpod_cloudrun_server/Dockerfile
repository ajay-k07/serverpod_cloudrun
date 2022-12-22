FROM dart:stable

ARG mode=development
ARG serverId=1

RUN echo Building Image in $mode mode and with Server Id: $serverId

ENV MODE=mode
ENV SERVER_ID=serverID

WORKDIR /app
COPY . .

RUN  dart pub get

RUN dart compile exe bin/main.dart

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082 

CMD ["bin/main.exe"]

