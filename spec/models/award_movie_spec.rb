require 'rails_helper'

RSpec.describe AwardMovie, type: :model do
it { should belong_to(:award) } 
it { should belong_to(:movie) } 
end
