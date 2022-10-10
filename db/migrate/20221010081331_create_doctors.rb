class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :image_url
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
