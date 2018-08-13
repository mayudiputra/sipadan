class Indication < ApplicationRecord
  has_many :rules, :dependent => :destroy
  
  validates_presence_of :name, message: "tidak boleh kosong"
end
