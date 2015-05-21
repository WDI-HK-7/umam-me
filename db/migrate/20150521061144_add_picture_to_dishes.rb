class AddPictureToDishes < ActiveRecord::Migration
  def up
    add_attachment :dishes, :picture
  end

  def down
    remove_attachment :dishes, :picture
  end
end