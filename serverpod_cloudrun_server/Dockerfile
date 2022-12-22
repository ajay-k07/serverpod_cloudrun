FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code and AOT compile it.
COPY . .
# Ensure packages are still up-to-date if anything has changed
RUN dart pub get --offline
RUN dart compile exe bin/main.dart -o bin/main


EXPOSE 8080
EXPOSE 8081
EXPOSE 8082 

CMD ["/bin/main"]



#future update 

#FROM scratch
# COPY --from=build /app/bin/main app/bin
# COPY --from=build /app/config/ app/config
# COPY --from=build /app/generated/ app/generated
# COPY --from=build /app/web/ app/web