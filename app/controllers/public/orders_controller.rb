class Public::OrdersController < ApplicationController
  layout 'public/application'

  def new
    @order = Order.new
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end
  
  def create
    @order = Order.new(order_params)
  end

  def confirm
    @order = Order.find(params[:id])
  end

  def complete
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:pay_way,:postcode, :address, :adress_name)
  end
end
