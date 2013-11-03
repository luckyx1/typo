Feature: Merge Articles
	As an Admin
	In order to combine articles about the same subject
	I want to merge two articles together


	Scenario: A non-admin cannot merge articles
		Given the non-admin blog is set up
		And I am logged into the non-admin panel
		When I am on the edit article page
		Then I should not see "Merge Articles"

	Scenario: A new article cannot be merged
		Given I am on the new article page
		Then I should not see "Merge Articles"

	Scenario: When articles are merged, the merged article should contain the text of both previous articles
		Given the blog is set up
		And I am logged into the admin panel
		When I am on the edit article page
		And I fill in "Article ID" with "some ID"
		And I press "Merge"
		Then I should be on the admin content page
    		When I go to the home page
    		Then I should see "Article 1"
    		When I follow "Article 1"
    		Then I should see "Article 1 content" and "Article 2 content"	

	Scenario: When articles are merged, the merged article should have one author
		Given I am the admin
		When I am on the edit article page
		And I fill in "Article ID" with "some ID"
		And I press "Merge"
		Then I should be on the admin content page
    		And I should see "Article 1" with "Author" as "X"
    		And I should not see "Article 2"	


	Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article

	Scenario: The title of the new article should be the title from either one of the merged articles
