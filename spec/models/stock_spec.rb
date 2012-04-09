# == Schema Information
#
# Table name: stocks
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Stock do

  it "should return an array of stock symbols from a space or comma deliniated string of symbols" do
    str = "csco QCOM, arLp---www"
    arr = Stock.parse_stocks(str)
    arr[0].should eq "csco".upcase
    arr[1].should eq "qcom".upcase
    arr[2].should eq "ARLP"
    arr[3].should eq "WWW"
    arr.length.should eq 4

  end
end
