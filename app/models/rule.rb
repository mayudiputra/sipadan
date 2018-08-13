class Rule < ApplicationRecord
  belongs_to :trouble
  belongs_to :indication

  validates_presence_of :trouble_id, :indication_id, :weight, message: "tidak boleh kosong"
end
