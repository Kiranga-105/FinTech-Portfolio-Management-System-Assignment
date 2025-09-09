class CreateEmailTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :email_templates do |t|
      t.string :name
      t.string :subject
      t.text :body
      t.timestamps
    end
  end
end
