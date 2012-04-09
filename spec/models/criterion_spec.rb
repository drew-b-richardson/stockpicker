require 'spec_helper'

describe Criterion do
  it "should return the value of a specified stock for a specified criteria" do
    crit = Criterion.new
    crit.name = "PEG"
    stock = "CSCO"
    crit.url = "http://finance.yahoo.com/q?s=#{stock}&ql=1"
    value = crit.get_value stock
    value.should eq 1.31
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

