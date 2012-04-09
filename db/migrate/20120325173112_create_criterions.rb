class CreateCriterions < ActiveRecord::Migration
  def change
    create_table :criterions do |t|
      t.string :name
      t.string :url
      t.string :xpath

      t.timestamps
    end
  end
end
