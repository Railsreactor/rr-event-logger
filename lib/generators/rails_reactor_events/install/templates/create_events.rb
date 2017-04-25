class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :entity_type, null: false
      t.integer :entity_id, null: false
      t.jsonb :params, default: '{}', null: false, index: { using: 'gin' }
      t.string :action, default: '', null: false, index: true
      t.references :user, null: false, index: true, foreign_key: true
      t.integer :user_id, null: true

      t.timestamps null: false

      t.index %i[entity_type entity_id]
    end
  end
end
