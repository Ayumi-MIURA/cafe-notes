class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string     :cafe_name,                null: false
      t.string     :appearance,               null: false
      t.string     :aroma,                    null: false
      t.string     :taste,                    null: false
      t.string     :rich,                     null: false
      t.integer    :geography_id,             null: false
      t.integer    :processing_id,            null: false
      t.text       :tasting_note,             null: false
      t.references :user,               foreign_key: true

      t.timestamps
    end
  end
end
