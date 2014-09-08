#!/usr/bin/env ruby

#require 'active_record'
require 'barrister-redis'
require './implementation.rb'
#require "erb"
#require "yaml"

container = container = Barrister::RedisContainer.new('./interface.json', UserService.new, database_url: ENV['OPENREDIS_URL'] || 'redis://localhost:6379', list_name: 'user_service')
container.start

# Create a connection to the database

#db_config = YAML.load(ERB.new(File.read('../../config/database.yml')).result)
#ActiveRecord::Base.establish_connection db_config[ENV['RACK_ENV'] || 'development']
## Create the MailService proxy
#opts         = { database_url: 'redis://localhost:6379', list_name: 'user_service' }
#transport    = Barrister::RedisTransport.new opts
#mail_service = Barrister::Client.new(transport).MailService
#
## Create the user service
#idl     = './interface.json'
#service = UserService.new mail_service
#
#STDOUT.write idl
#
## Put our AR model into Redis
#Barrister::RedisContainer.new(idl, service, opts).start
