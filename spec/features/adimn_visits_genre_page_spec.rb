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
    
  end
end
