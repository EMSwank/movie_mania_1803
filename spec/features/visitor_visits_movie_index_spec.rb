require 'rails_helper'

describe "A visitor" do
  context "visits the movie index page" do
    it "each movie title listed" do
    director = Director.create(name: "Alec Baldwin")
    movie_1 = director.movies.create(title: "Mean Girls", description: "High school girls are mean.")
    movie_2 = director.movies.create!(title: "Boss Baby", description: "A baby is a boss.", director_id: director.id)
    movie_3 = director.movies.create(title: "Catch Me If You Can", description: "Boy becomes expert in check fraud", director: director)
    award1 = movie_1.awards.create!(name: 'award1')
    award2 = movie_1.awards.create!(name: 'award2')
    award3 = movie_2.awards.create!(name: 'award3')
    award4 = movie_2.awards.create!(name: 'award4')
    award5 = movie_3.awards.create!(name: 'award5')
    award_year1 = AwardMovie.create!(movie: movie_1, award: award1, year: 2015)
    award_year2 = AwardMovie.create!(movie: movie_2, award: award2, year: 2015)
    award_year3 = AwardMovie.create!(movie: movie_3, award: award3, year: 2015)
    
    visit movies_path

    expect(page).to have_content(movie_1.title) 
    expect(page).to have_content(movie_2.title) 
    expect(page).to have_content(movie_3.title) 
    expect(page).to have_content(award1.name)
    expect(page).to have_content(award2.name)
    expect(page).to have_content(award3.name)
    expect(page).to have_content(award_year1.year)
    expect(page).to have_content(award_year2.year)
    expect(page).to have_content(award_year3.year)
    end
  end
end


# As a Visitor,
#   When I visit the movie index,
#     Under each movie title listed,
#     I also see a heading that says "Awards for this Movie:"
#     I also see each award the movies have won
#     I also see what year the award was won