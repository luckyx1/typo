
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

Given /^I am logged in as "(.*?)" with pass "(.*?)"$/ do |user, pass|
  visit '/accounts/login'
  fill_in 'user_login', :with => user
  fill_in 'user_password', :with => pass
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

And /^the following articles exist$/ do |art|
  art.hashes.each do |info|
	Article.create!(info)
  end
end


When /^I visit the the edit page for "(.*)"$/ do |title|
  visit 'admin/content/edit/' + Article.find_by_title(title).id.to_s
end

Given /the following (.*?) exist:$/ do |type, table|
  table.hashes.each do |element|
    if    type == "users"    then User.create!(element)
    elsif type == "articles" then Article.create!(element)
    elsif type == "comments" then Comment.create(element)
    end
  end
end

Given /^I am logged into the admin panel as "(.*?)" with "(.*?)"$/ do |user, pass|
  visit '/accounts/login'
  fill_in 'user_login', :with => user
  fill_in 'user_password', :with => pass
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given /^I try to merge with "(.*?)"$/ do |title|
  fill_in 'merge_with', :with => Article.find_by_title(title).id
  click_button 'Merge'
end

