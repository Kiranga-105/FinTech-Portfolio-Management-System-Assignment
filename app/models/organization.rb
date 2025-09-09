class Organization < ApplicationRecord
  has_many :contacts, dependent: :nullify
end
