FROM dart:stable
ARG mode development

RUN echo 'Building Image in $mode'

WORKDIR /app
COPY . .

RUN chmod +x ./bin/main.dart

RUN  dart pub get

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082 

CMD ["dart","bin/main.dart"]

