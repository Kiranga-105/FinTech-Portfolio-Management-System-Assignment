class CreateSendLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :send_logs do |t|
      t.references :contact, foreign_key: true
      t.references :email_template, foreign_key: true
      t.string :recipient_email
      t.string :subject
      t.text :body
      t.timestamps
    end
  end
end
