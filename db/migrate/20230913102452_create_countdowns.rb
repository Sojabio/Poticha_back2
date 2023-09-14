class CreateCountdowns < ActiveRecord::Migration[7.0]
  def change
    create_table :countdowns do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_open
      t.timestamps
    end
  end
end
