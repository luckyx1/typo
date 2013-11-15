Feature:Add and Edit Categories
    As an Admin
    In order to manage different Categories
    I want to be able to add and edit at will

Background: start on categories
	Given the blog is set up
	And I am logged into the admin panel
	When I view the Admin Categories     



	Scenario: Open page to create a new category
		Then I should see "Name"
		And I should see "Keywords"
		And I should see "Permalink"
		And I should see "Description"

	Scenario: Create a new category
		When I fill in "Name" with "Cal"
		And I fill in "Keywords" with "Bears"
		And I fill in "Permalink" with "www.google.com"
		And I fill in "Description" with "seniors"
		When I press "Save"
		Then I should see "Cal"


	Scenario: Edit a category
		When I follow "Edit"
		Then I should see "Name"
		And I should see "Keywords"
		And I should see "Permalink"
		And I should see "Description"
		When I fill in "Keywords" with "Berkeley"
		And I fill in "Description" with "Class of 2014"
		When I press "Save"
		Then I should see "Berkeley"
		And I should see "Class of 2014"
