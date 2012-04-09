# == Schema Information
#
# Table name: stocks
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Stock < ActiveRecord::Base
  attr_accessor :stock_symbol, :scenario, :score

  def initialize stock_symbol, scenario_id
    puts scenario_id
    puts "test"
    high_score = 0
    low_score = 100000
    @score = 0
    @stock_symbol = stock_symbol
    @scenario = Scenario.find(scenario_id)
    @scenario.scenarioCriterions.each do |sc| 
      #remove any sc with weight = 0
      if sc.weight == 0 
        @scenario.scenarioCriterions.delete sc
        break
      end

      sc.criterion.stock = stock_symbol
      sc.criterion.get_value
      if sc.weighted_value != nil
        @score += sc.weighted_value
      end
    end  


  end
  
  def self.parse_stocks str
    str.upcase.split(/\W+/)
  end
end
