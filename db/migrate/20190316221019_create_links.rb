class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string  :short_url
      t.string  :source_url
      t.boolean :active,     default: true
      t.integer :hits,       default: 0
      
      t.timestamps
    end
  end
end
