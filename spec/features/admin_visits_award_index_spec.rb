require 'rails_helper'

describe "An admin" do
  context "visits the awards index page" do
    it "see a form to create a new award" do
      admin = User.create(username: "Dee", password: "password", role: 1)
    director = Director.create(name: "Alec Baldwin")
    movie_1 = director.movies.create(title: "Mean Girls", description: "High school girls are mean.")
    movie_2 = director.movies.create!(title: "Boss Baby", description: "A baby is a boss.", director_id: director.id)
    movie_3 = director.movies.create(title: "Catch Me If You Can", description: "Boy becomes expert in check fraud", director: director)
    award1 = movie_1.awards.create!(name: 'award1')
    award2 = movie_1.awards.create!(name: 'award2')
    award3 = movie_2.awards.create!(name: 'award3')
    award4 = movie_2.awards.create!(name: 'award4')
    award5 = movie_3.awards.create!(name: 'award5')
    award = AwardMovie.create!(movie: movie_1, award: award1, year: 2015)

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

