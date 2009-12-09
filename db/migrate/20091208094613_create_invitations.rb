class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.string :recipient_email
      t.string :token
      t.integer :recipient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
