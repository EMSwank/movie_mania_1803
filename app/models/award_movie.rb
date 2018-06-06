class AwardMovie < ApplicationRecord
  belongs_to :award
  belongs_to :movie
end
