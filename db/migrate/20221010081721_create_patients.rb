class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :image_url
      t.string :location

      t.timestamps
    end
  end
end
