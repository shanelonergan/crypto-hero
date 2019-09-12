class ExchangesController < ApplicationController


    def create
      @exchange = Exchange.create(exchange_params)
      session[:exchange_amount] = exchange_amount
      if @exchange.buy
        buy
      else
        sell
      end
    end

    private

    def exchange_amount
      params[:exchange][:units].to_f * params[:exchange][:market_price].to_f
    end

    def buy
      can_buy = @exchange.user.can_buy?(exchange_amount)
      if can_buy == true
        session[:buy] = true
        redirect_to portfolio_path(@exchange.user)
      elsif can_buy == false
        flash[:errors] = ["You don't have those funds"]
        redirect_to @exchange.crypto
      end

    end

    def sell
      can_sell = @exchange.user.can_sell?(params[:exchange][:units].to_f)
      if can_sell == true
        session[:buy] = false
        redirect_to portfolio_path(@exchange.user)
      elsif can_sell == false
        flash[:errors] = ["You don't have that many units"]
        redirect_to @exchange.crypto
      end

    end


    def exchange_params
        params.require(:exchange).permit(
            :user_id,
            :crypto_id,
            :units,
            :buy,
            :market_price
        )
    end

end
