class Admin::AwardsController < Admin::BaseController

  def index
    @awards = Award.all
  end
  
end