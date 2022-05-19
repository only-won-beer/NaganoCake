class Public::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      redirect_to deliveries_path(@delivery.id)
    else
      @deliveries = Delivery.all
      render :index
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end
  
  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    if @delivery.save
     redirect_to deliveries_path(@delivery.id)
    else
      @deliveries = Delivery.all
      render :edit
    end
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to '/deliveries'
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postcode, :address, :address_name)
  end
end
