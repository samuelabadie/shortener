class DeleteShortUrl < ActiveRecord::Migration[7.0]
  def change
    remove_column :links, :short_url
  end
end
