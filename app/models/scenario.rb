class Scenario < ActiveRecord::Base
  has_many :scenarioCriterions, :dependent => :destroy
  has_many :criterions,  :through => :scenarioCriterions
  accepts_nested_attributes_for :scenarioCriterions, :reject_if => lambda { |a| a[:weight] == 0 }

  def initialization
  end

  def remove_criterion (scenario_id, criterion_id)
  end
end
# == Schema Information
#
# Table name: scenarios
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

