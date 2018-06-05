require 'rails_helper'

describe "A visitor" do
  context "visits the genre index page" do
    it "and cannot see the form to create new genres" do
      visit genres_path

      expect(page).to_not have_button("Save Genre")
    end

    it "and sees all the genres in the database" do
      genre1 = Genre.create(name: 'genre1')
      genre2 = Genre.create(name: 'genre2')

      visit genres_path

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)

    end

    it "And each genre's name should be a link to that genre's show page." do
      genre1 = Genre.create(name: 'genre1')
      genre2 = Genre.create(name: 'genre2')

      visit genres_path

      expect(page).to have_link(genre1.name)
      expect(page).to have_link(genre2.name)

    end

  end
end