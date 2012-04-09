class AddNodeNumberToCriterion < ActiveRecord::Migration
  def change
    add_column :criterions, :node_number, :int
  end
end
