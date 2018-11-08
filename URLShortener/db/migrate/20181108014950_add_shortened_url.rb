class AddShortenedUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :visits, :shortened_url, :string, null: false
  end
end
