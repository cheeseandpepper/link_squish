class AddIndexToShortUrl < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def up
    add_index :links, :short_url, algorithm: :concurrently unless index_exists?(:links, :short_url)
  end

  def down
    remove_index :links, :short_url if index_exists?(:links, :short_url)
  end
end
