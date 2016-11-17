class CreateContactPlatforms < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_platforms do |t|
      t.string :uid, null: false, limit: 32
      t.string :logo
    end
    add_index :contact_platforms, :uid, unique: true
  end
end
