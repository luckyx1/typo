Feature: Merge Articles
	As an Admin
	In order to combine articles about the same subject
	I want to merge two articles together

Background: Given articles and users exist with the following data

        Given the blog is set up

        Given the following users exist:
            | profile_id | login  | name  | password | email                      | state  |
            | 2          | nacho | Robert | sonic    | nacholuckymaster@gmail.com | active |
            | 3          | monkey | Karla | ninja    | kaguilar7@berkeley.edu     | active |

        Given the following articles exist:
            | id | title            | author | user_id | body    | allow_comments | published | published_at        | state     | type    |
            | 2  | Book             | nacho  | 2       | library | true           | true      | 2013-01-11 12:30:00 | published | Article |
            | 7  | Plant vs Zombies | monkey | 3       | android | true           | true      | 2013-02-11 15:00:00 | published | Article |

        Given the following comments exist:
            | id | type    | author | body     | article_id | user_id | created_at          |
            | 2  | Comment | nacho | thug_life | 2          | 2       | 2013-01-11 17:25:00 |
            | 4  | Comment | monkey | no       | 7          | 3       | 2013-02-11 20:15:00 |


	Scenario: A non-admin cannot merge articles
		Given I am not the admin
		When I am on the edit article page
		Then I should not see "Merge Articles"

	Scenario: A new article cannot be merged
		Given I am on the new article page
		Then I should not see "Merge Articles"

	Scenario: When articles are merged, the merged article should contain the text of both previous articles
		Given I am logged into the admin panel
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
