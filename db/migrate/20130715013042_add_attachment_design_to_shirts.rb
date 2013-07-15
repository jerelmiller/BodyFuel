class AddAttachmentDesignToShirts < ActiveRecord::Migration
  def self.up
    change_table :shirts do |t|
      t.attachment :design
    end
  end

  def self.down
    drop_attached_file :shirts, :design
  end
end
