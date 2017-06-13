**Messaging API**
----

This Rails 5 API does the following:
- Allows you to create a new user
- Allows registered user to request an auth token
- Allows a registered user to message another user
- Organizes messages under conversations

Authentication is implemented via JWT using Warden and Devise. Backed by postgreSQL. Sample calls: https://www.getpostman.com/collections/95f3a307cf56f4f019ae

***Quickstart***
- Clone or unzip the project file
- cd into the project directory
- From your shell:
  - `bundle install`
  - `rails db:create`
  - `rails db:migrate`
  - `rails db:seed`
  - run tests `rspec`
  - start app `rails server`
  - Sample calls located in the "sample_requests" folder can be loaded into postman
