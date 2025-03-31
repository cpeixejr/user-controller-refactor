Ruby Refactoring Take Home Assessment

The test will consist of two parts: refactoring poor code and migrating from one API to another.
Please document how/why you made certain refactoring decisions.

My refactoring changes include:

1 - I decided to create the user_params method (Strong Parameters) because it’s a Rails way to prevent undesired attributes in the hash

2 - I created the UserMailerWorker to perform the sending of emails asynchronously using Sidekiq

3 - I changed the previous email API to use the Rails AplicationMailer.

In this [branch](https://github.com/cpeixejr/user-controller-refactor/tree/services-refactoring), I created an approach to use a User registration service.
Using a service, the controller will deal only with HTTP requests, while the service will deal with the creation process, improving the tests, and the addition of new workflows or features
