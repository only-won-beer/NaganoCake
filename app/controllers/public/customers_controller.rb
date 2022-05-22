class Public::CustomersController < ApplicationController
  layout 'public/application'
  def show
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customers_path

  end

  def update_resource(resource, params)
    resource.update_without_password(params)
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

  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :nick_name)
  end

end
