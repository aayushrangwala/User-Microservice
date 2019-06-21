[![Coverage Status](https://coveralls.io/repos/github/aayushrangwala/User-Microservice/badge.svg?branch=master)](https://coveralls.io/github/aayushrangwala/User-Microservice?branch=master)

# User-Microservice

This project is a part of a simple application which aims to implement the services required to authenticate and fetch the user details from the database

The User-Microservice is the API which will give the user-details for the users given in the request Header

API Implementations:
  1. API : `/user/profile` Method : GET, Secured : true, Header {Username: XXXX}
  This API will return the username, dob, age, email, and phoneNumber.
  2. API: `/microservice/name` Method : GET, Secured : false
  This API will return the name of microservice(for our use ‘user-microservice’).

## How it works?:

The Overall application has the API gateway also as a component which will act as the contact point for the user.
The end user only knows about the two APIS of user-microservice and also about the details
and function of these API’s like if they are secured or not

This User-Microservice is the secured API which will first forward the the user request with the username as the header to the Authentication service for validity and then respond accordingly

## Contents:

Repo contains mainly below files/directories:

1. api/v1:
   1. `routes.go`: Contains the Route struct which is basically the mapping object of the Handler-Function to its url path-pattern
   2. `router.go`: Creates and returns a router object when server is started. Router object contains the list of route objects registerd to it.
2. cmd/server:
   1. `main.go`: It simply creates a router which has mappings of Url path and their handlers and starts a server on port 8080 with it
3. pkg/services/v1:
   1. `userDetails.go`: This file contains the HandlerFunc for fetching the details of the user and also another Handler to return the name of the microservice. It acts as the main logic of the Microservice
4. `Dockerfile`: It is used to run in the Build and Release Pipeline at Azure infra


## How to Use?

Simply do the `make run` to run the service at the localhost

## Note

Currently, there is no DB integration, so the output from this service comes hardcoded with your given username. only those users will be authorized.

Valid Users: test1, test2

## Useful Commands:

 1. `make build`: To build the image
 2. `make push`: To push the image
 3. `make test`: To run the tests
 4. `make lint`: To run the lint

## Dependencies

1. [gorilla mux](https://github.com/gorilla/mux)
2. [goveralls](https://github.com/mattn/goveralls)
3. [golangci-lint](https://github.com/golangci/golangci-lint#install)
4. [docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
5. Go installed correctly
