class AddAttachmentPictureToGambarDisposisiBalasans < ActiveRecord::Migration[5.0]
  def self.up
    change_table :gambar_disposisi_balasans do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :gambar_disposisi_balasans, :picture
  end
end
