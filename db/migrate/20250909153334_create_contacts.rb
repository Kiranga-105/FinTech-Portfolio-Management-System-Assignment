class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.references :organization, foreign_key: true
      t.timestamps
    end
  end
end
