# Mailgun Tracking Middleware module

## Project description

A middleware for Mailgun Tracking gem (with optional rack-contrib) to integrate Rails app with Mailgun Webhooks as a middleware module.

Module in one file with a MailLogger class, and inserts in to application.rb to load the middleware.

## Dependencies
* mailgun-tracking  (required gem) [https://rubygems.org/gems/mailgun-tracking]
* rack-contrib  (optional gem, for extra functions) [https://rubygems.org/gems/rack-contrib]
* PostgreSQL
* Ruby >= 2.7.1
* Rails >= 6.0.3.1

Setup required dependencies from `Brewfile`:


Place in lib/middleware,  add the additional lines to application.rb
