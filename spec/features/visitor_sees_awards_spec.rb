require 'rails_helper'

describe "A visitor" do
  context "visits an awards page" do
    it "does not see a for to create new awards" do
      visit awards_path

      expect(page).to_not have_content('award[name]') 
    end

    it "sees all the awards" do
      award1 = Award.create(name: 'award1')
      award2 = Award.create(name: 'award2')

      visit awards_path

      expect(page).to have_content(award1.name) 
      expect(page).to have_content(award2.name) 
    end

    it "have link to award show page" do
      award1 = Award.create(name: 'award1')
      award2 = Award.create(name: 'award2')

      visit awards_path
      click_on award1.name

      expect(current_path).to eq(award_path(award1))
    end
  end
end


