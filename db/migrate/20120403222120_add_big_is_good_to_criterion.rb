class AddBigIsGoodToCriterion < ActiveRecord::Migration
  def change
    add_column :criterions, :big_is_good, :boolean
  end
end
