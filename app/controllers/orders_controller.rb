class OrdersController < ApplicationController
before_action :set_action
before_action :sold_out
before_action :authenticate_user!

def index
  @order_adress = OrderAdress.new
  if @lesson.user_id == current_user.id
      redirect_to root_path
  end

end

def create

  @order_adress = OrderAdress.new(order_params)
  if @order_adress.valid?
    pay_lesson
    @order_adress.save
    redirect_to root_path
  else
    render action: :index
  end
end

private

def order_params
  params.require(:order_adress).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(
    lesson_id: params[:lesson_id], token: params[:token], user_id: current_user.id
  )
end

def pay_lesson
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
  Payjp::Charge.create(
    amount: @lesson.price, # 商品の値段
    card: order_params[:token], # カードトークン
    currency: 'jpy'
  ) # 通貨の種類（日本円）
end

def set_action
  @lesson = Lesson.find(params[:lesson_id])
end

def sold_out
  @stock = Order.where(lesson_id: @lesson.id).count
    if @stock >= @lesson.capacity.id
      redirect_to root_path
    end
end
end

