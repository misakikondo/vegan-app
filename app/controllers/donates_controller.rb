class DonatesController < ApplicationController
  
def index
  @donate = Donate.new
end

def create
  @donate = Donate.new(donate_params)
  if @donate.valid?
    pay_donate
    @donate.save
    redirect_to root_path
  else
    render 'index'
  end
end

private

def pay_donate
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: donate_params[:price],  # 値段
      card: donate_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
end

def donate_params
  params.require(:donate).permit(:price).merge(token: params[:token], user_id: current_user.id)
end

end