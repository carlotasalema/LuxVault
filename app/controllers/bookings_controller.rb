class BookingsController < ApplicationController
  before_action :find_item, only: [:new, :create]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.item = @item
    @booking.user = current_user
    if @booking.save!
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  #   @booking.find(params[:id])
  #   @booking.update(booking_params)
  #   redirect_to items_path
  # end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to items_path, status: :see_other
  end

  def booking_requests
    @items = Item.where(user_id: current_user.id)
    @bookings = []
    @items.each do |item|
      @bookings << Booking.where(status: 'pending', item_id: item.id)
    end
    @bookings = @bookings.flatten
  end

  def accept
    @input = params[:input]
    @booking = Booking.find(params[:id])
    @booking.status = @input
    if @booking.save
      redirect_to booking_requests_path, status: :see_other
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
