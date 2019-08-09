class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def update
    user = User.find(params[:id])
    user.update(users_params)
    redirect_to admin_dashboard_url(subdomain: :admin)
  end

  private

  def users_params
    params.require(:user).permit!
  end
end