# README

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
$ rails g migration AddColumnUsers username:string

# model
$ rails g scaffold projects  

```

# library
- Bootstrap
```
Gemfile
  gem 'bootstrap-sass', '3.3.6'
  gem 'font-awesome-rails'
app/assets/javascript/application.js
  //= require bootstrap-sprockets
app/assets/stylesheets/application.css
  *= require font-awesome
```