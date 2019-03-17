class AddIndexToShortCode < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def up
    add_index :links, :short_code, algorithm: :concurrently unless index_exists?(:links, :short_code)
  end

  def down
    remove_index :links, :short_code if index_exists?(:links, :short_code)
  end
end
