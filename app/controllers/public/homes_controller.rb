class Public::HomesController < ApplicationController

  def top
    @shops = Shop.where
  end

  def about
  end

end
