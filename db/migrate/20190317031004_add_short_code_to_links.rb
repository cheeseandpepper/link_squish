class AddShortCodeToLinks < ActiveRecord::Migration[5.1]
  def up
    add_column(:links, :short_code, :string)
  end

  def down
    remove_column(:links, :short_code)
  end
end
