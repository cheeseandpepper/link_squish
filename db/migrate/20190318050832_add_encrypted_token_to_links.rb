class AddEncryptedTokenToLinks < ActiveRecord::Migration[5.1]
  def up
    add_column(:links, :encrypted_token, :string)
  end

  def down
    remove_column(:links, :encrypted_token)
  end
end
