class Feedstock < ActiveRecord::Base
  attr_accessible :name, :unity

  validates_presence_of :name, :unity
end
