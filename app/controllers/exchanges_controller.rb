class ExchangesController < ApplicationController


    def create
      @exchange = Exchange.new(exchange_params)
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
      if @exchange.user.can_buy?(exchange_amount)
        @exchange.save(validate: false)
        session[:buy] = true
        redirect_to portfolio_path(@exchange.user)
      else
        flash[:errors] = ["You don't have those funds"]
        redirect_to @exchange.crypto
      end

    end

    def sell
      if @exchange.user.can_sell?(params[:exchange][:units].to_f)
        @exchange.save(validate: false)
        session[:buy] = false
        redirect_to portfolio_path(@exchange.user)
      else
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
