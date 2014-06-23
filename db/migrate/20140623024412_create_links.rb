class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :long_url, null: false
      t.string :short_url, null: false

      t.timestamps
    end

    add_index :links, :long_url, unique: true
    add_index :links, :short_url, unique: true
  end
end
