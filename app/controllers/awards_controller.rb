class AwardsController < ApplicationController

  def index
    binding.pry
    @awards = Award.all
  end
  
  def show
    @award = Award.find(params[:id])
    @movies = @award.movies
  end
  
end