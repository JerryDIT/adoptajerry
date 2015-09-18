source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.2.4'

gem 'sass-rails', '5.0.1'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

gem 'jquery-turbolinks'
# data-turbolinks-permanent is available in versions 3.0+
gem 'turbolinks', github: 'rails/turbolinks', ref: '937f5f6'

gem 'jbuilder', '~> 1.2'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'omniauth-browserid'
gem 'nested_form'
gem 'figaro'
gem 'gravatarify'
gem 'haml'
gem 'slim-rails'
gem 'active_interaction', '~> 2.1'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'jazz_hands'
  gem 'sqlite3'
  gem 'thin'
  gem 'quiet_assets'
end

group :production do
  platforms :ruby do # linux
   gem 'puma'
  end
  gem 'rails_12factor'
  gem 'pg'
end

# http://tzinfo.github.io/datasourcenotfound
gem 'tzinfo-data', platforms: [:mingw, :mswin]

# Fishes out the Accept-Language header into an array.
gem 'http_accept_language'

# Flexible authentication solution for Rails with Warden.
gem 'devise'
gem 'rolify', github: 'EppO/rolify' # issues/221

# Authorization library which restricts what resources a given user is allowed to access.
gem 'cancancan', '~> 1.10'

# Integrate Modernizr javascript library with Rails asset pipeline
gem 'modernizr_rails', github: 'tsechingho/modernizr-rails'

gem 'bootstrap-sass'

# CSS Authoring Framework
gem 'compass-rails', '2.0.4'
# The iconic font designed for Bootstrap
gem 'font-awesome-sass'

source 'https://rails-assets.org' do
  gem 'rails-assets-sugar'

  # Superheroic JavaScript MVW Framework
  gem 'rails-assets-angular', '1.4.0'
  gem 'rails-assets-angular-bootstrap'
  gem 'rails-assets-ngstorage'
  gem 'rails-assets-angular-formly'
  gem 'rails-assets-angular-formly-templates-bootstrap'
  gem 'rails-assets-angular-local-storage'
  gem 'rails-assets-angular-cache'
  gem 'rails-assets-angular-sanitize'
  gem 'rails-assets-angular-timeline', '1.2.1'
  gem 'rails-assets-angular-moment'
  gem 'rails-assets-angular-translate'
  gem 'rails-assets-angular-translate-loader-static-files'
  gem 'rails-assets-angular-filter'
  gem 'rails-assets-textAngular'
  gem 'rails-assets-ng-file-upload'
  gem 'rails-assets-angular-http-auth'
  gem 'rails-assets-moment'
  gem 'rails-assets-humps'
  gem 'rails-assets-angular-growl-v2'
end
# Use your angular templates with rails' asset pipeline
gem 'angular-rails-templates'
gem 'ngannotate-rails'

# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Rails 3 and 4
gem 'kaminari'

# An opinionated micro-framework for creating REST-like APIs in Ruby
gem 'grape'
gem 'grape-entity'
gem 'api-pagination'
# Disables the security feature of strong_params at the model layer,
# allowing you the use of Grape's own params validation instead.
gem 'hashie-forbidden_attributes'
# Add swagger compliant documentation to your grape API
gem 'grape-swagger'
gem 'grape-swagger-rails'

# Doorkeeper is an OAuth 2 provider for Rails
gem 'doorkeeper'
# A Ruby gem that allows Oauth2 protection with Doorkeeper for Grape Api's
gem 'wine_bouncer'

# The ActiveRecord acts_as_commentable plugin
gem 'acts_as_commentable'

# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup.
gem 'simple_form'

# Create plain old ruby models with functionality found in ORMs, like ActiveRecord
gem 'active_attr'

# RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data
gem 'rails_admin'
# Ckeditor integration gem for rails http://ckeditor.com/
gem 'ckeditor'
# Fix the Rails 4 asset pipeline to generate non-digest along with digest assets
gem 'non-stupid-digest-assets'
# Track changes to your models' data. Good for auditing or versioning.
gem 'paper_trail'

# Easy file attachment management for ActiveRecord
# Only used by ckeditor
gem "paperclip", "~> 4.3"
