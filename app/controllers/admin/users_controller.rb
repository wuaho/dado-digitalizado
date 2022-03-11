module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
    before_action :set_user, only: %i[show edit update destroy]
    # GET /users or /users.json
    def index
      @users = User.all
    end

    # GET /users/1 or /users/1.json
    def show; end

    # GET /users/1/edit
    def edit; end

    # PATCH/PUT /users/1 or /users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to admin_user_url(@user), notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /users/1 or /users/1.json
    def destroy
      @user.destroy

      respond_to do |format|
        format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      # TO-DO I should change this to only the parameters that the admin is able to modify
      params.require(:user).permit(:name, :password, :surname, :email, :phone, :address, :birthdate, :nickname, :role)
    end

    def require_admin
      unless current_user.admin?
        flash[:alert] = 'Forbidden'
        redirect_to root_path # halts request cycle
      end
    end
  end
end
