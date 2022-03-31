class BorrowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_borrowing, only: %i[show]

  def index
    @borrowings = current_user.borrowings
  end

  def show; end

  def new
    @game_id = params[:game_id]
    @borrowing = Borrowing.new(game_id: @game_id)
  end

  def create
    # TO-DO user id is automatically introduced in the next line as current_user.id and it doesnt come
    # from the form
    @borrowing = Borrowing.new(borrowing_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @borrowing.save
        format.html { redirect_to borrowing_url(@borrowing), notice: 'Borrowing was successfully created.' }
        format.json { render :show, status: :created, location: @borrowing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @borrowing.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_borrowing
    @borrowing = Borrowing.find(params[:id])
  end

  def borrowing_params
    params.require(:borrowing).permit(:starts_on, :expires_on,:game_id)
  end
end
