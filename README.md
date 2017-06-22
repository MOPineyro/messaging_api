# Lua Messaging API Exercise

Basic Rails 5 API that allows for 2-way messaging.

[![Run in Postman](https://run.pstmn.io/button.svg)](https://www.getpostman.com/collections/95f3a307cf56f4f019ae)

What it does:
- Allows you to create a new user
- Allows registered user to request an auth token
- Allows a registered user to message another user
- Organizes messages under conversations


### Quick Start
```sh
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rspec
$ rails server
```

Postman sample requests and documentation: https://documenter.getpostman.com/collection/view/549043-6c7b4843-4728-4911-4a86-6c7ec84072a8

### Todos
 - Allow for multiple receivers
 - Basic frontend client