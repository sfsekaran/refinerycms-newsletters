class Newsletter < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :email]

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true  
end
