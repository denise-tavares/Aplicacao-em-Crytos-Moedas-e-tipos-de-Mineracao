class AddNiningTypeToCoins < ActiveRecord::Migration[5.2]
  def change
    add_reference :coins, :nining_type, foreign_key: true
  end
end
