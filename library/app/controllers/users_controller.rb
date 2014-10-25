class UsersController < ApplicationController
  skip_before_action :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if session[:id] and session[:admin]
      @users = User.order(:name)
    else
      redirect_to books_path, notice: "Please log in as admin"
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if session[:id] and session[:admin]

    else
      redirect_to books_path, notice: "Please log in as admin"
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if session[:id] and session[:admin]

    else
      redirect_to books_path, notice: "Please log in as admin"
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_url, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  if session[:id] and session[:admin]
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, 
          notice: "User #{@user.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  else
    redirect_to books_path, notice: "Please log in as admin"
  end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
  if session[:id] and session[:admin]
    begin
      @user.destroy
      flash[:notice]="User #{@user.name} deleted"
    rescue StandardError => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  else
    redirect_to books_path, notice: "Please log in as admin"
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :user_id, :password, :password_confirmation, :admin)
    end
end
