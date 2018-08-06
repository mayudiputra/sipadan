class Indication < ApplicationRecord
  has_many :rules
  
  validates_presence_of :name
end
