class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten - Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new
      if @kitten.save
        redirect_to @kitten
      else
        render 'new'
      end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update

    flash[:notice] = 'New and improved kitty successfully edited'
    redirect_to kitten_path(@kitten)
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    flash[:notice] = 'Hasta la vista, kitty'
    redirect_to kittens_path
  end

end
