require 'rails_helper'

describe "A visitor" do
  context "visits an awards page" do
    it "does not see a for to create new awards" do
      visit awards_path

      expect(page).to_not have_content('award[name]') 
    end

    it "sees all the awards" do
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

      visit awards_path

      expect(page).to have_content(award1.name) 
      expect(page).to have_content(award2.name) 
    end

    it "have link to award show page" do
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

      visit awards_path
      click_on award1.name

      expect(current_path).to eq(award_path(award1))
    end
  end
end


