require 'rails_helper'

RSpec.describe Genre, type: :model do
  it { should have_many(:genre_movies) }
  it { should have_many(:movies).through(:genre_movies) }  
end
