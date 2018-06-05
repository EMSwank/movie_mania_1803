require 'rails_helper'

describe "An admin" do
  context "visits the genre index page" do
    it "and sees a list of all genre names in the database." do
      genre1 = Genre.create(name: 'genre1')
      genre2 = Genre.create(name: 'genre2')

      visit admin_genres_path

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
    end
  end
end
