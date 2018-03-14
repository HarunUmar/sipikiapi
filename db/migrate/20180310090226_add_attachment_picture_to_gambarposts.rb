class AddAttachmentPictureToGambarposts < ActiveRecord::Migration[5.0]
  
  def self.up
    change_table :gambarposts do |t|
      t.attachment :picture
    end

    
  end

  def self.down
    remove_attachment :gambarposts, :picture
  end
end