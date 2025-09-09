class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.references :contact, foreign_key: true
      t.decimal :balance, precision: 12, scale: 2
      t.decimal :performance, precision: 10, scale: 4
      t.timestamps
    end
  end
end
