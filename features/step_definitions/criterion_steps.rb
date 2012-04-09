

Given /the following criterions exist/ do |table|
  table.hashes.each do |record|
    Criterion.create!(record)
  end
end

Given /the following scenarios exist/ do |table|
  table.hashes.each do |scenario|
    Scenario.create!(scenario)
  end
end

  Then /I should should see every criterion/ do
    criterions = Criterion.all
    criterions.each do |criterion| 
      step "Then I should see "#{criterion.name} value:"
    end  
  end

