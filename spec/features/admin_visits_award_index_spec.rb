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
  end
end

# As an admin user, 
#   When I visit the awards index page,
#     I can see a form to create a new award