class AddAttachmentPictureToGambarDisposisis < ActiveRecord::Migration[5.0]
  def self.up
    change_table :gambar_disposisis do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :gambar_disposisis, :picture
  end
end
