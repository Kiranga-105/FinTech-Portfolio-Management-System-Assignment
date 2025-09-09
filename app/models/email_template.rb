class EmailTemplate < ApplicationRecord
  # attributes: name, subject, body
  validates :name, presence: true
end
