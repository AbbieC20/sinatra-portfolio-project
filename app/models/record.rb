class Record < ActiveRecord::Base
  belongs_to :user

  include Slugifiable
  extend Findable
end
