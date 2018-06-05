require 'rails_helper'

describe "An admin" do
  context "visits the genre index page" do
    it "and sees a list of all genre names in the database." do
      user = User.create(username: 'user', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      genre1 = Genre.create(name: 'genre1')
      genre2 = Genre.create(name: 'genre2')

      visit admin_genres_path

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
    end

    it "and sees a form to create a new genre." do
      user = User.create(username: 'user', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      genre1 = Genre.create(name: 'genre1')
      genre2 = Genre.create(name: 'genre2')

      visit admin_genres_path
      fill_in 'genre[name]', with: 'name'

      expect(page).to have_content("Name:")
    end
    
    it "I fill out the form with a genre's name and click 'Create Genre', I return to the genre index page,
        I see all genre names from the database including the new genre I have just created." do

      user = User.create(username: 'user', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      genre1 = Genre.create(name: 'genre1')
      genre2 = Genre.create(name: 'genre2')

      visit admin_genres_path
      fill_in 'genre[name]', with: 'name3'

      click_on 'Save Genre'
      expect(current_path).to eq(admin_genres_path)
      expect(page).to have_content("name3")
    end
    
  end
end