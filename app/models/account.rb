class Account < ApplicationRecord
  validates :simcardNumber, :presence => true, :uniqueness => true
end
