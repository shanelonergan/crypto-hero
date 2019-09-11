class CryptosController < ApplicationController
  before_action :set_crypto, only: [:update, :edit, :show]

  def show
    
  end

  private

  def set_crypto
      @crypto = Crypto.find(params[:id])
  end

  def crypto_params
      params.require(:crypto).permit(
          :name,
          :buy_price,
          :spot_price,
          :sell_price
      )
  end
end
