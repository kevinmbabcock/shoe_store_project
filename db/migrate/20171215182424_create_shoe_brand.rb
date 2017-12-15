class CreateShoeBrand < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoe_brands) do |t|
      t.column(:name, :string)
      t.column(:price, :float)
      t.column(:shoe_store_id, :integer)
      t.timestamps
    end
  end
end
