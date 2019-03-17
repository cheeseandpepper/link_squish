class RemoveShortCodeUrlIndex < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def up
    remove_index :links, :short_url if index_exists?(:links, :short_url)
  end
  
  def down
    add_index :links, :short_url, algorithm: :concurrently unless index_exists?(:links, :short_url)
  end
end
