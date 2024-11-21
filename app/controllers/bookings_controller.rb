class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.item = @item
    @booking.user = current_user
    if @booking.save!
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking.find(params[:id])
    @booking.update(booking_params)
    @booking.item.update(status: "available")
    redirect_to items_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to items_path, status: :see_other
  end

  def booking_requests
    @items = Item.where(user_id: current_user.id)
    @items.each do |item|
      @bookings = Booking.where(status: 'pending', item_id: item.id)
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: "accepted")
    flash[:notice] = "Booking has been accepted successfully."
    @booking.save
    redirect_to booking_requests_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
