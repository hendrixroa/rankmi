class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :area
      t.float :nota

      t.timestamps
    end
  end
end
