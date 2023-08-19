class CreateAudits < ActiveRecord::Migration[6.1]
  def change
    create_table :audits do |t|
      t.references :auditable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true
      t.json :auditable_changes, null: false, default: {}
      t.column :created_at, :datetime
    end

    add_index :audits, [:auditable_id, :auditable_type]
  end
end
