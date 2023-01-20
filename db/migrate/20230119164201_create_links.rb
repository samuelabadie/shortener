class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :lookup_code
      t.string :origial_url

      t.timestamps
    end
  end
end
