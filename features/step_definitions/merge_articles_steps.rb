
Given /^the non-admin blog is set up$/ do
  Blog.default.update_attributes!({:blog_name => 'Cool School',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'non-admin',
                :password => 'no-admin',
                :email => 'no@luck.com',
                :profile_id => 2,
                :name => 'non-admin',
                :state => 'active'})
end



And /^I am logged into the non-admin panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'non-admin'
  fill_in 'user_password', :with => 'no-admin'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end	

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

And /^the following articles exist$/ do |art|
  art.hashes.each do |info|
	Article.create!(info)
  end
end


#Given /^I am the admin$/ do
#end

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
