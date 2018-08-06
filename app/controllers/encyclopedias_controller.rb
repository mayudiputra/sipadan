class EncyclopediasController < ApplicationController

  def index
    @troubles = Trouble.all
  end

  def show
    @trouble = Trouble.find(params[:id])
  end

end
