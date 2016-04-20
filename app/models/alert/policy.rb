class Alert::Policy < ActiveRecord::Base
  has_many :conditions
end
