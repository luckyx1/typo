Feature: Merge Articles
	As an Admin
	In order to combine articles about the same subject
	I want to merge two articles together

Background: Given articles and users exist with the following data

        Given the blog is set up

       Given the following users exist:
            | profile_id | login  | name  | password | email                      | 
            | 1          | nacho  | Robert| sonic    | nacholuckymaster@gmail.com | 
            | 2          | monkey | Karla | ninja    | kaguilar7@berkeley.edu     | 

        Given the following articles exist:
            | id | title            | author | body    | published | 
            | 2  | Book             | nacho  | library | true      | 
            | 7  | Plant vs Zombies | monkey | android | true      | 

	Scenario: A non-admin cannot merge articles
		Given the non-admin blog is set up
		And I am logged into the non-admin panel
		And the following articles exist
		| title | author | id |
		| Cool School | non-admin | 3 |
		| Second | non-admin2 | 2 |
		When I follow "All Articles"
		And I follow "Cool School"
		Then I should not see "Merge articles"

	Scenario: A new article cannot be merged
		Given I am on the new article page
		Then I should not see "Merge Articles"

	Scenario: A admin can merge articles
		 Given I am logged into the admin panel as "nacho" with "sonic"
    	 And I visit the the edit page for "Book"
    	 Then I should see "Merge Articles"

	Scenario: When articles are merged, the merged article should contain the text of both previous articles

		Given I am logged into the admin panel as "nacho" with "sonic"
		And I visit the the edit page for "Book"
		And I try to merge with "Plant vs Zombies"
		Then I should be on the admin content page
        And I should see "Articles successfully merged!"


	Scenario: When articles are merged, the merged article should have one author
		Given I am logged into the admin panel
		

	Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article

	Scenario: The title of the new article should be the title from either one of the merged articles
