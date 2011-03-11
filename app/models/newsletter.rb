class Newsletter < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :email]

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    
end
