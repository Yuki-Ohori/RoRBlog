# My First Project RoR

Make a CRUD Blog (REST API)

* https://guides.rubyonrails.org/getting_started.html

Useful Ruby Command (For Window add 'ruby' before command)

* Start Server

    `bin/rails server`

* Add resources - go to config/routes.rb and add  resources :articles (articles can be any name) and Run command.

    `bin/rails routes`

* Create a controller - Then add 'def new /n render plain: params[:article].inspect /n end' to app/controllers/articles_controller.rb - Then Create a file new.html.erb to app/views/articles/.

    `bin/rails generate controller Articles`

* Migrate Database

    `bin/rails db:migrate`