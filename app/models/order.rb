class Order < ApplicationRecord
  belongs_to :user, :optional => true

  def self.search(search)
    if search
    where(['custumer_name LIKE ?',"%#{search}%"])
  else
      all
    end
  end
end
