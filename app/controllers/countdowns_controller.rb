class CountdownsController < ApplicationController
  before_action :set_countdown, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: [:update]


  # GET /countdowns
  def index
    @countdowns = Countdown.all

    render json: @countdowns
  end

  # GET /countdowns/1
  def show
    render json: @countdown
  end

  # POST /countdowns
  def create
    @countdown = Countdown.new(countdown_params)

    if @countdown.save
      render json: @countdown, status: :created, location: @countdown
    else
      render json: @countdown.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /countdowns/1
  def update
    if @countdown.update(countdown_params)
      render json: @countdown
    else
      render json: @countdown.errors, status: :unprocessable_entity
    end
  end



  # DELETE /countdowns/1
  def destroy
    @countdown.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_countdown
      @countdown = Countdown.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def countdown_params
      params.require(:countdown).permit(:start_date, :end_date, :is_open)
    end
end
