class Admin::AwardsController < Admin::BaseController

  def index
    @awards = Award.all
  end
  
    def create
    @award = Award.new(award_params)
    if @award.save
      flash[:success] = "#{@award.name} Created!"
      redirect_to admin_awards_path
    else
      render :new
    end
  end

      private
  def award_params
    params.require(:award).permit(:name)
  end

end