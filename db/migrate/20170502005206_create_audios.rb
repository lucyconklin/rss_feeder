class CreateAudios < ActiveRecord::Migration[5.0]
  def change
    create_table :audios do |t|
      t.string :url
      t.integer :length
      t.string :filepath
      t.timestamps
    end
  end
end
