class CreateScenarioCriterions < ActiveRecord::Migration
  def change
    create_table :scenario_criterions do |t|
      t.integer :scenario_id
      t.integer :criterion_id
      t.integer :weight

      t.timestamps
    end
  end
end
