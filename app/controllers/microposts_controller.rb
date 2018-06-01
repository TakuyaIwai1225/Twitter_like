class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :currect_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'staticpages/home'
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました!!"
    redirect_to request.referrer || root_url
  end
  
  private
    
    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end
    
    def currect_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect to root_url if @micropost.nil?
    end
    

end
