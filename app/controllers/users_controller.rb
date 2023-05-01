class UsersController < Clearance::UsersController
  private

  def create
    @user = User.new(users_params)
    if @user.save
        redirect_to '/'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def show
    @user = User.find(params[:id])
    @shouts = @user.shouts
  end
end