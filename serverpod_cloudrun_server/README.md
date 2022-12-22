# serverpod_cloudrun_server

This is the starting point for your Serverpod server.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker-compose up --build --detach

Then you can start the Serverpod server.

    dart bin/main.dart

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker-compose stop


lets see how we can deploy serverpod to cloud run 

    1. Lets create the Docker File
    2. Build The Docker Image 
    3. Create the Workflows
    4. Lets Do git push


1. Lets create the Docker File

First lets create a docker file for our serverpod application
we create docker image of our application so that we can almost 
deploy in any cloud provider

