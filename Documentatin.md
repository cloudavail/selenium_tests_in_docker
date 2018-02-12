# Small Java app in docker image with file output to host OS

## Build jar
`cd main`
`mvn install`

## Build docker image
`cd ..`
`docker build -t selenium_screenshot .`

## Run docker image with mounted folder "Screenshots"
`docker run -v ${PWD}/Screenshots:/Screenshots selenium_screenshot:latest`

The output file with be `screenshot.png` located in `./Screenshots`


