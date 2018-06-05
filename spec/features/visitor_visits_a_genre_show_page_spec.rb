require 'rails_helper'

describe "A visitor" do
  context "visits a genre show page" do
    it "and sees all movies associated with that genre listed on the page" do
      director = Director.create!(name: 'Someone!')
      genre = Genre.create(name: 'genre')
      movie1 = genre.movies.create!(title: 'movie1', description: 'desc 1', director: director)
      movie2 = genre.movies.create!(title: 'movie2', description: 'desc 2', director: director)

      visit genre_path(genre)

      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie1.description)
      expect(page).to have_content(movie2.title)
      expect(page).to have_content(movie2.description)
    end
  end
end