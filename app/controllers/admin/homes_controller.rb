class Admin::HomesController < ApplicationController
  layout 'admin/application'
  def top
    @orders = Order.page(params[:page])
  end
end
