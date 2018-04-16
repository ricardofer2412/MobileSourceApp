class Account < ApplicationRecord
  validates :sim_card_number, :presence => true, :uniqueness => true

    def self.search(search)
      if search
      where(["customer_name LIKE ? OR sim_card_number LIKE ?","%#{search}%", "%#{search}%"])
    else
        all
      end
    end
end
  
