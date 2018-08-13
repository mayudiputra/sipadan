class Trouble < ApplicationRecord
  has_many :rules, :dependent => :destroy

  validates_presence_of :name, :weight, :description, :fa, message: "tidak boleh kosong"
end
