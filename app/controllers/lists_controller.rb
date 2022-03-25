class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:name))
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def show
    @list = List.found(params[:id])
  end

  def destroy
    @list = List.found(params[:id])
    @list.destroy
  end
end
