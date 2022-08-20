class Account < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
