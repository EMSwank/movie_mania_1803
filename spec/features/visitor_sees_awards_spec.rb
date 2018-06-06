require 'rails_helper'

describe "A visitor" do
  context "visits an awards page" do
    it "does not see a for to create new awards" do
      visit awards_path

      expect(page).to_not have_filed('award[name]') 
    end
  end
end


# As a Visitor,
#   When I visit the awards index,
#     I cannot see the form to create new awards, 
#     I see all awards
#       and each award should be a link to that award's specific page.