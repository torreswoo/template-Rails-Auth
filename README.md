# Torres Template Project - Ruby On Rails
This project is based on Ruby On Rails.
- Login : LDAP / DB Authenticate & Sign up
- Role Management & Authority
- Audit Log
- Searching & Paging - index & table

## feature
### Login : LDAP / DB Authenticate & Sign up
![rails-intro-login](/docs/images/intro_login.png)

### Role Management & Authority
![rails-Role-Management](/docs/images/permission_policy.png)

### Audit Log
![rails-AuditLog](/docs/images/audit_log_modal.png)
![rails-AuditLog](/docs/images/audit_log_page.png)

### Searching & Paging

## library - gem
| name | version  | link |
| --- | --- | --- |
| devise | --- | https://github.com/plataformatec/devise |
| rolify | --- | https://github.com/RolifyCommunity/rolify |
| authority | --- | https://github.com/nathanl/authority |
| devise_ldap_authenticatable | --- | --- |
| net-ldap | --- | --- |
| omniauth | --- | --- |
| audited | --- | https://github.com/collectiveidea/audited |
| --- | --- | --- |
| ransack | --- | https://github.com/activerecord-hackery/ransack |
| will_paginate | --- | https://github.com/mislav/will_paginate |
| --- | --- | --- |
| bootstrap-sass | --- | --- |
| font-awesome-rails | --- | --- |

## How to use gem simply
- set basic project
```
$ rails new template-Rails-Auth
$ bundle install
$ rails db:migrate
$ rails db:migrate:status
$ rails db:rollback
$ rails s
$ rails c
$ rails routes

```

- devise : set the login & auth
```
## devise
$ rails g devise:install
$ rails g devise User
$ rails db:migrate 
$ rails g devise:views
$ rails g migration AddColumnUsers username:string

## model
$ rails g scaffold projects  
```

- rolify
```
## role
$ rails g rolify Role

## Auth
$ rails g authority:install 

## usage
$ user = User.find_by(username:'1001')
$ user.roles.pluck(:name, :resource_type, :resource_id)
$ user.add_role :admin
$ user.add_role :owner, Project.find(1)
```

- 1:N relation
```
## model
$ rails g scaffold projects
$ rails g scaffold posts  

## keyword
belongs_to
has_many
```

- authorizer
```
config/initializers/authority.rb
** ProjectAuthorizer, PostAuthorizer
** creatable_by?, updatable_by?, deletable_by?, permissionable_by?
```

- audited
```
## Gemfile
gem "audited", "~> 4.6"

## command
$ rails generate audited:upgrade
$ rake db:migrate

## keyword
audited
has_associated_audits
```

- Searching
```
## Gemfile
gem 'ransack'
config/initializers/ransack.rb

## view helper
<%= search_form_for @q, url: , class:  do |f| %>

## controller
@q = Project.ransack(params[:q])
```

- Paging
```
## Gemfile
gem 'will_paginate'

## view helper
<%= will_paginate @projects, :class , :previous_label, :next_label %>

## keyword
lib/pagination.css
```

- use "nested_form"


## UI library
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
- mustache.js
- select2.js