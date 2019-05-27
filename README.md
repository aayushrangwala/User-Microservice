[![Coverage Status](https://coveralls.io/repos/github/aayushrangwala/Authentication-Service/badge.svg?branch=master)](https://coveralls.io/github/aayushrangwala/Authentication-Service?branch=master)

# Go-Microservices-task

A sample Microservices implementation task in Go

We have three entities here
1. Authenticator-Microservice.
2. User-Microservice.
3. Azure API gateway

## 1 . Authenticator-Microservice
Authenticator-Microservice authenticates client HTTP request if the request is valid or not by
analyzing the value in the user request header ‘ Username ’. If the user with this header is
present in the database then it's a valid request otherwise the user request is not a valid
request.
Implement API named ‘/auth’ which will perform the above task. For every authenticated
user request it sends HTTP code 200 to the API gateway and for every un-authenticated
request, it sends HTTP status code 401 un-authorized.

## 2. User-Microservice
Implements:
  2.1. API : /user/profile Method : GET, Secured : true
  This API will return the username, dob, age, email, and phoneNumber.
  2.2. API: /microservice/name Method : GET, Secured : false
  This API will return the name of microservice(for our use case ‘user-microservice’).

## 3. Azure API gateway
The azure API gateway is the contact point for the client. It does conditional routing.
If authentication is required for the request API, it routes it to Authenticator-Microservices
and if it is not required it routes directly to the target microservice (for our use case the
user-microservice).

## How it works? :
The end user only knows about the two APIS of user-microservice and also about the details
and function of these API’s like if they are secured or not but do not know about the auth
service. The contact point for the user is the API gateway and not the microservice directly.
For every secured endpoint, the user sends a header called ‘ Username ’ which is used by
authenticator-microservice to validate it. For this exercise, you can hard code the
‘Username’ in the authenticator-microservice and send it as a header for the required
API(for API’s which are secured).

## Infrastruture
Use azure as infrastruture.

## Build process
Create docker image of user-microservice and authenticator microservice and build its azure
pipeline and deploy it to azure.

## Optional
Deploy the above application to microsoft kubernates cluster.
