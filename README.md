# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# gem
- devise
** devise_ldap_authenticatable
** net-ldap
** omniauth
- rolify
- authority
``` 
gem 'devise'
gem 'devise_ldap_authenticatable'
gem 'net-ldap'
gem 'omniauth', '>= 0.2.2'
gem 'rolify'
gem 'authority'
```

# feature
- Login : LDAP / DB Authenticate
- Sign up
- Role Management
- Authority

# command

```
$ rails new template-Rails-Auth
$ bundle install
$ rails db:migrate
$ rails db:migrate:status
$ rails db:rollback
$ rails s
$ rails c
$ rails routes


# devies
$ rails g devise:install
$ rails g devise User
$ rails db:migrate 
$ rails g devise:views

# model
$ rails g scaffold projects

# LDAP
rails g devise_ldap_authenticatable:install
  config/ldap.yml
  config/initializers/devise.rb
  
rails g migration AddColumnUsers name:string department:string mobile:string department_number:string

```