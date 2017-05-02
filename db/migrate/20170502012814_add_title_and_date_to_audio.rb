class AddTitleAndDateToAudio < ActiveRecord::Migration[5.0]
  def change
    add_column :audios, :title, :string
    add_column :audios, :date, :datetime 
  end
end
