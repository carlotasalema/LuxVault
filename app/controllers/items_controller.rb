class ItemsController < ApplicationController
  # Skip authentication for the 'index' action (ALL ITEMS page)
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if params[:category].present?
      @items = Item.where(category: params[:category])
    elsif params[:query].present?
      sql_subquery = "name ILIKE :query OR description ILIKE :query"
      @items = Item.where(sql_subquery, query: "%#{params[:query]}%")
    else
      @items = Item.all
    end
    @categories = ["clothing", "jewelry", "accessories"]
  end

  def my_items
    @items = Item.where(user_id: current_user.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @categories = ['clothing', 'accessories', 'jewelry']
  end

  def create
    # @item = Item.new(items_params)
    # if @item.save
    #   redirect_to items_path
    # else
    #   render :new, status: :unprocessable_entity
    # end
    @item = current_user.items.create!(item_params)

    if @item.save!
      redirect_to my_items_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to my_items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to my_items_path, status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:name, :category, :price_per_day, :description, :user_id, :photo)
  end
end
