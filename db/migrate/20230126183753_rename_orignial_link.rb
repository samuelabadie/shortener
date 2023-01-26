class RenameOrignialLink < ActiveRecord::Migration[7.0]
  def change
    change_table :links do |t|
      t.rename :origial_url, :original_url
    end
  end
end
