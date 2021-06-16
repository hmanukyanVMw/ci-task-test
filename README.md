
# how to push log-emitter application in cloud foundry

- In first step we should build this docker image
    <pre><code>
    FROM golang:1.10
    
    ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64
    
    # Set the Current Working Directory inside the container
    WORKDIR $GOPATH/src/logemitter
    
    # Copy everything from the current directory to the PWD(Present Working Directory) inside the container
    COPY . .
    
    # Download all the dependencies
    RUN go get -d -v ./...
    
    # Install the package
    RUN go install -v ./...
    
    # This container exposes port 8080 to the outside world
    EXPOSE 8080
    
    # Run the executable
    CMD ["logemitter"]
    </pre></code>
- For building docker image docker image you should run command like this
   <pre><code>docker build -t hmanukyan/logemitter:1.2 . </pre></code>
    - hmanukyan is docker hub id (should get from [docker-hub](https://hub.docker.com) account username)
    - logemitter is repo name (could be any name)
    - 1.3 is image name OR tag name (could be any name)
- In the next step, you mast push docker in your account
  > Important Notes,    
  It is mandatory to push, cf not get the image from local docker repository
  <pre><code>docker image push hmanukyan/logemitter:1.2</pre></code>
- finally we can push the app in cloud foundry
  <pre><code>cf push logemitter --docker-image hmanukyan/go-example:1.3  \
             --no-route --no-start --health-check-type process -m 32M -k 32M
  </pre></code>
- If you interesting how to run docker image in locally then you can look this example
  <pre><code>docker container run -d --name APPLICATION_NAME hmanukyan/logemitter:1.2</pre></code>
  - You can see container with this  `docker ps` command and with flag `-a` you can see all containers 
   which is not successfully run `docker ps -a`
> Notes,    
for running application which is running in some port you need add -p 8000:8080
<pre><code>docker container run -d --name APPLICATION_NAME -p 8000:8080 hmanukyan/logemitter:1.2</pre></code>

