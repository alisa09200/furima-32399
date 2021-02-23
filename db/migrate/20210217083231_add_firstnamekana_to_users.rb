class AddFirstnamekanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :product, :string
  end
end
