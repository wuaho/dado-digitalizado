class BorrowingsController < ApplicationController
  before_action :set_borrowing, only: %i[show edit update destroy]

  def index
    @borrowings = Borrowing.all
  end

  def show; end

  def new
    @borrowing = Borrowing.new
  end

  def edit; end

  def create
    @borrowing = Borrowing.new(borrowing_params)

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

  def update
    respond_to do |format|
      if @borrowing.update(borrowing_params)
        format.html { redirect_to borrowing_url(@borrowing), notice: 'Borrowing was successfully updated.' }
        format.json { render :show, status: :ok, location: @borrowing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @borrowing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @borrowing.destroy

    respond_to do |format|
      format.html { redirect_to borrowings_url, notice: 'Borrowing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_borrowing
    @borrowing = Borrowing.find(params[:id])
  end

  def borrowing_params
    params.require(:borrowing).permit(:starts_on, :expires_on)
  end
end
