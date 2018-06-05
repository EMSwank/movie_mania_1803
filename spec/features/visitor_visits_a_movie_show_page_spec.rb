require 'rails_helper'

describe "A visito" do
  context "visits a movie show page" do
    it "and sees a list of genres associated with that movie" do
      director = Director.create!(name: 'Someone!')
      movie = Movie.create(title: "movie", description: 'description', director: director)
      genre1 = movie.genres.create(name:'genre1')
      genre2 = movie.genres.create(name:'genre2')

      visit movie_path(movie)

      expect(page).to have_content("Genres for this Movie:")
      expect(page).to have_content(genre1.name) 
      expect(page).to have_content(genre2.name) 
    end
  end
end

# When I visit a movie show page,
#     I see genre names under a heading that says "Genres for this Movie:"
#       and the genres listed are only the genres associated with this movie.