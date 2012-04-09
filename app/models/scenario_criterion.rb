class ScenarioCriterion < ActiveRecord::Base
  belongs_to :scenario
  belongs_to :criterion

  attr_accessor :weighted_value

end
# == Schema Information
#
# Table name: scenario_criterions
#
#  id           :integer         not null, primary key
#  scenario_id  :integer
#  criterion_id :integer
#  weight       :integer
#  created_at   :datetime
#  updated_at   :datetime
#

