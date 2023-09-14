class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :ISBN
      t.integer :season
      t.integer :pages
      t.datetime :issue_date

      t.belongs_to :author, index: true
      t.timestamps
    end
  end
end
