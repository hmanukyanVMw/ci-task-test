FROM golang:1.10

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/github.com/cloudfoundry-incubator/loggregator-tools/logemitter

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


#
#For building docker image
# docker image build -t hmanukyan/logemitter:1.2 . // id running Dockerfile 
# docker image ls //to see docker images
#
# //for runing application if is web application need  add -p 8000:8080, in cf deploy case not need
# docker container run -d --name APPLICATION_NAME hmanukyan/logemitter:1.2
#
#
# docker ps OR docker container ls  // to see list of running containers
#docker ps -a //a flag show all(+ stopped )
#
# //If you have a docker hub account you can push the docker image there to be have a published image
# //Important Notes, it is montatory to push, cf not get the image from local
# docker image push hmanukyan/logemitter:1.2
#
#
#hmanukyan  —— docker hub id
#Go-example —— repo name
#1.3        —— image name (tag name)



#//add Docker image as a cf product
#cf push logemitter --docker-image hmanukyan/go-example:1.3  \
# --no-route --no-start --health-check-type process \
# -m 32M -k 32M
