
# how to push log-emitter application in cloud foundry

- In first step we should build this docker image 
``FROM golang:1.10

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
CMD ["logemitter"]``

# Usage

- You must provide TLS certificates and keys for the emitter via a volume mount.
