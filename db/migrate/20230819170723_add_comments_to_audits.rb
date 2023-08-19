class CreateAudits < ActiveRecord::Migration[6.1]
  def change
    add_column :audits, :comment, :string
  end
end
