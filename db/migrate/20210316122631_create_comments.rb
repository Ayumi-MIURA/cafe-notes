class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text       :text,             null: false
      t.references :user,      foreign_key: false
      t.references :note,      foreign_key: false

      t.timestamps
    end
  end
end
