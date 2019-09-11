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
      if @exchange.user.can_buy?(exchange_amount)
        redirect_to custom_route
      else
        flash[:errors] = "You don't have those funds"
        redirect_to @exchange.crypto
      end

    end

    def sell
      if @exchange.user.can_sell?(params[:exchange][:units].to_f)
        session[:exchange_amount] = exchange_amount
        redirect_to
      else
        flash[:errors] = "You don't have that many units"
        redirect_to @exchange.crypto
      end

    end

    # def buy
    #   if @exchange.user.can_buy?(exchange_amount)
    #     @exchange.user.balance -= exchange_amount
    #     redirect_to update_user_path(@exchange.user)
    #   end
    # end
    #
    # def sell
    #   if @exchange.user.can_sell?(params[:exchange][:units].to_f)
    #     @exchange.user.balance += exchange_amount
    #     @exchange.user.save
    #     @exchange.save
    #   end
    # end


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
