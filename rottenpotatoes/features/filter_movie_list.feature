Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And  I am on the RottenPotatoes home page

Scenario: restrict to movies with 'PG' or 'R' ratings
  # enter step(s) to check the 'PG' and 'R' checkboxes
  # enter step(s) to uncheck all other checkboxes
  # enter step to "submit" the search form on the homepage
  # enter step(s) to ensure that PG and R movies are visible
  # enter step(s) to ensure that other movies are not visible
  When I check the following ratings: PG, R 
  #added
  And  I uncheck the following ratings: G, PG-13 
  #added
  And  I press "Refresh" 
  #added

  Then I should see "The Incredibles" 
  #added
  And  I should see "The Terminator" 
  #added
  And  I should see "When Harry Met Sally" 
  #added
  And  I should see "Amelie" 
  #added
  And  I should see "Raiders of the Lost Ark" 
  #added

  And  I should not see "The Help" 
  #added
  And  I should not see "Chocolat" 
  #added
  And  I should not see "2001: A Space Odyssey" 
  #added
  And  I should not see "Chicken Run" 
  #added

Scenario: all ratings selected
  # see assignment
  When I check the following ratings: G, R, PG-13, PG 
  #added
  And  I press "Refresh" 
  #added
  Then I should see all the movies 
  
  #added
