require 'active_record'

class User < ActiveRecord::Base
  validates :email, uniqueness: true
end
