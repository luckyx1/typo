Feature: Merge Articles
	As an Admin
	In order to combine articles about the same subject
	I want to merge two articles together

	Scenario: A non-admin cannot merge articles
		Given I am not the admin
		When I am on the edit article page
		Then I should not see "Merge Articles"

	Scenario: A new article cannot be merged
		Given I am on the new article page
		Then I should not see "Merge Articles"

	Scenario: When articles are merged, the merged article should contain the text of both previous articles

	Scenario: When articles are merged, the merged article should have one author

	Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article

	Scenario: The title of the new article should be the title from either one of the merged articles
