class Admin::GenresController < Admin::BaseController
  before_action :require_admin
  
  def index
    @genres = Genre.all
  end
  
end