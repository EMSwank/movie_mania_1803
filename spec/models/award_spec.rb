require 'rails_helper'

RSpec.describe Award, type: :model do
  it { should have_many(:award_movies) }
  it { should have_many(:awards).through(:award_movies) } 
end
