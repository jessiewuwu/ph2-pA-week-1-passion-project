class AddVideoUrl < ActiveRecord::Migration
  def change
    add_column :ratings, :video_url, :string
  end
end
