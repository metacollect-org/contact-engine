class CreateContactContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_contacts do |t|
      t.integer :platform_id, null: false
      t.string :content, null: false
      t.references :accessible, polymorphic: true
    end

    add_foreign_key :contact_contacts, :contact_platform, column: :platform_id
  end
end
