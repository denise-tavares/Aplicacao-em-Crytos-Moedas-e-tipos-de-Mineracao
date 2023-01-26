class CreateNiningTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :nining_types do |t|
      t.string :description
      t.string :acronym

      t.timestamps
    end
  end
end
