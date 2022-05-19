class Public::CustomersController < ApplicationController
  layout 'public/application'
  def show
  end

  def edit
  end

  def quit
  end

  def withdraw
    #現在ログインしているユーザーを@customerに格納
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    #sessionIDのresetを行う
    reset_session
    redirect_to root_path
  end

end
