Given /^I am not the admin$/ do
   # express the regexp above with the code you wish you had
   if page.logged_in?
    false
  else
    true
  end
end

Given /^I am the admin$/ do
  if page.responds_to? visit '/accounts/admin'
    true
  else
    false
  end
end

Then /^I should see "(.*?)" and "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "(.*?)" with "(.*?)" as "(.*?)"$/ do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Given /the following (.*?) exist:$/ do |type, table|
  table.hashes.each do |element|
    if    type == "users"    then User.create(element)
    elsif type == "articles" then Article.create(element)
    elsif type == "comments" then Comment.create(element)
    end
  end
end