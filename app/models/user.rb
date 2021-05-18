require_relative './concerns/slugifiable'

class User < ActiveRecord::Base
  has_secure_password
  has_many :records

  include Slugifiable
  extend Findable
end
