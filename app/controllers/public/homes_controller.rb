class Public::HomesController < ApplicationController
  layout 'public/application'
  def top
    # 販売停止は表示しないようにする
    @newitems = Item.order(created_at: :desc).limit(3)
  end

  def about
  end
end
