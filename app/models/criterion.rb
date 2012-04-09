class Criterion < ActiveRecord::Base
  has_many :scenarioCriterions, :dependent => :destroy
  has_many :scenarios,  :through => :scenarioCriterions

  attr_accessor :raw_value, :stock, :normalized_value


  @@highest_value = 0

  def self.highest_value
    @@highest_value
  end

  def self.highest_value= value
    @@highest_value = value
  end
  def get_value 
    agent = Mechanize.new

    puts url
    @raw_value = agent.get(url.gsub('#{stock}', @stock)).search(xpath)[node_number].inner_text().to_f
  end
  def raw_value_for_calculations
    if big_is_good 
      return @raw_value
    end
    1/@raw_value
  end
  def self.set_normalized_values stocks

    i = 0
    stocks[0].scenario.scenarioCriterions.count.times do 
      @@highest_value = 0
      stocks.each do |stock| 
        logger.debug "criterion = #{stock.scenario.scenarioCriterions[i].criterion.name} | raw = #{stock.scenario.scenarioCriterions[i].criterion.raw_value_for_calculations}"


        if (stock.scenario.scenarioCriterions[i].criterion.raw_value_for_calculations> @@highest_value)
          @@highest_value = stock.scenario.scenarioCriterions[i].criterion.raw_value_for_calculations
          logger.debug "highest = #{@@highest_value }"
        end  
      end  
      stocks.each do |stock| 
        stock.scenario.scenarioCriterions[i].criterion.normalized_value = stock.scenario.scenarioCriterions[i].criterion.raw_value_for_calculations/@@highest_value 
        stock.scenario.scenarioCriterions[i].weighted_value = stock.scenario.scenarioCriterions[i].criterion.normalized_value * stock.scenario.scenarioCriterions[i].weight

      end  
      i = i+1 

    end
    return stocks

  end
end
# == Schema Information
#
# Table name: criterions
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  url         :string(255)
#  xpath       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  node_number :integer
#

