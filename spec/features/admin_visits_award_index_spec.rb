require 'rails_helper'

describe "An admin" do
  context "visits the awards index page" do
    it "see a form to create a new award" do
      admin = User.create(username: "Dee", password: "password", role: 1)
      award = Award.create(name: 'Award')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_awards_path

      fill_in 'award[name]',	with: award.name 
    end

    it "see a form to create a new award" do
      admin = User.create(username: "Dee", password: "password", role: 1)
      award1 = Award.create(name: 'Award1')
      award2 = Award.create(name: 'Award2')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_awards_path

      fill_in 'award[name]',	with: "new_award"
      click_on 'Save Award'

      expect(page).to have_content(award1.name) 
      expect(page).to have_content(award2.name) 
      expect(page).to have_content("new_award") 
    end

    
  end
end

# As an admin user, 
# When I visit the awards index page,
#   When I fill out the form with the award's title, 
#     And click 'Create Award', 
#     I see a list of all awards including the one I have just created. 