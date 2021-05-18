class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :name
      t.string :location 
      t.string :category 
      t.string :notes
      t.integer :user_id
    end
  end
end
