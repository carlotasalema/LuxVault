class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @item = Item.find(params[:item_id])
    @booking.item = @item
    if @booking.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to items_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to items_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :status)
  end
end
