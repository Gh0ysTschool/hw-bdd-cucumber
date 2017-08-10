# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create movie 
  #added
  end
  #fail "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  p1 = (page.body =~ /#{e1}/) 
  #added
  p2 = (page.body =~ /#{e2}/) 
  #added

  assert p1, "Page does not contain #{e1}" 
  #added
  assert p2, "Page does not contain #{e2}" 
  #added
  assert p1 < p2, "#{e1} occurs at #{p1}, #{e2} occurs at #{p2}" 
  #added
  #fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(',').each do |rating| 
  #added
    field = "ratings_#{rating.strip}" 
  #added
    if uncheck 
  #added
      uncheck field 
  #added
    else 
  #added
      check field 
  #added
    end 
  #added
  end 
  #added
  #fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  movies = Movie.all 
  #added
  movies.each do |movie| 
  #added
    assert page.body =~ /#{movie.title}/, "Missing #{movie.title} " 
  #added
  end 
  #added
  #fail "Unimplemented"
end
