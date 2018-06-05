require 'rails_helper'

describe "A visitor" do
  context "visits the genre index page" do
    it "and cannot see the form to create new genres" do
      visit genres_path

      expect(page).to_not have_button("Save Genre")
    end
  end
end


=begin
  As a Visitor,
  When I visit the genre index page,
    I cannot see the form to create new genres, 
    I see all genres in the database
      And each genre's name should be a link to that genre's show page.

for testing purposes, I should see at least 2 genres listed
rescue => exception
  
=end