class Admin::HomesController < ApplicationController
  layout 'admin/application'
  def top
    @orders = Order.all
  end
end
