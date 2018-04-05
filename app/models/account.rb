class Account < ApplicationRecord
  validates :simcardNumber, :presence => true, :uniqueness => true

    def self.search(search)
      if search
      where(["customer_name LIKE ? OR simcardNumber LIKE ?","%#{search}%", "%#{search}%"])
    else
        all
      end
    end
end
