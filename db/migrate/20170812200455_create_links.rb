class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :long_url
      t.string :short_url

      t.timestamps
    end
    add_index :links, :short_url, unique: true
  end
end
