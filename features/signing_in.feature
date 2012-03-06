Scenario: Signing in via form
  Given there are the following users:
    | email
    | password |
    | user@ticketee.com | password |
  And I am on the homepage
  When I follow "Sign in"
  And I fill in "Email" with "user@ticketee.com"
  And I fill in "Password" with "password"
  And I press "Sign in"
  Then I should see "Signed in successfully."
