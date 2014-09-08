#!/usr/bin/env ruby

require 'barrister-redis'
require './implementation.rb'

opts = {
  database_url: 'redis://localhost:6379',
  list_name: 'mail_service'
}

Barrister::RedisContainer.new('./interface.json', MailService.new, opts).start
