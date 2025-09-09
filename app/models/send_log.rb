class SendLog < ApplicationRecord
  belongs_to :contact, optional: true
  belongs_to :email_template, optional: true
end
