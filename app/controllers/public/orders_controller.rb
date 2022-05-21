class Public::OrdersController < ApplicationController
  layout 'public/application'

  def new
    @order = Order.new
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  # 注文確定するボタン
  def create
    cart_items = current_customer.cart_items.all
    # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
    @order = current_customer.orders.new(order_params)
    # 渡ってきた値を @order に入れます
    if @order.save
    # ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
      cart_items.each do |cart|
    # 取り出したカートアイテムの数繰り返します
    # order_item にも一緒にデータを保存する必要があるのでここで保存します
        order_item = OrderItem.new
        order_item.item_id = cart.item_id
        order_item.order_id = @order.id
        order_item.order_quantity = cart.quantity
    # 購入が完了したらカート情報は削除するのでこちらに保存します
        order_item.order_price = cart.item.price
    # カート情報を削除するので item との紐付けが切れる前に保存します
        order_item.save
    end
      redirect_to orders_complete_path
      cart_items.destroy_all
    # ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    # new 画面から渡ってきたデータを @order に入れます
    if params[:order][:address_number] == "1"
    # view で定義している address_number が"1"だったときにこの処理を実行します
    # form_with で @order で送っているので、order に紐付いた address_number となります。以下同様です
    # この辺の紐付けは勉強不足なので gem の pry-byebug を使って確認しながら行いました
    @order.address_name = current_customer.last_name # @order の各カラムに必要なものを入れます
    @order.address = current_customer.address
    elsif params[:order][:address_number] == "2"
    # view で定義している address_number が"2"だったときにこの処理を実行します
      if Delivery.exists?(name: params[:order][:registered])
    # registered は viwe で定義しています
        @order.name = Delivery.find(params[:order][:registered]).name
        @order.address = Delivery.find(params[:order][:registered]).address
      else
        render :new
    # 既存のデータを使っていますのでありえないですが、万が一データが足りない場合は new を render します
      end
    elsif params[:order][:address_number] == "3"
    # view で定義している address_number が"3"だったときにこの処理を実行します
      address_new = current_customer.deliveries.new(deliveries_params)
      if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
      else
        render :new
    # ここに渡ってくるデータはユーザーで新規追加してもらうので、入力不足の場合は new に戻します
      end
    else
      redirect_to orders_new_path # ありえないですが、万が一当てはまらないデータが渡ってきた場合の処理です
    end
    @cart_items = current_customer.cart_items.all # カートアイテムの情報をユーザーに確認してもらうために使用します
    @total_pay = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    # 合計金額を出す処理です sum_price はモデルで定義したメソッドです
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
  params.require(:order).permit(:address, :total_price,:address_name,:total_pay)
  end

  def deliveries_params
    params.require(:order).permit(:name, :address,:delivery_id)
  end

end
