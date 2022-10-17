class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "Congratulations! #{@kitten.name} joined the familey!"
      redirect_to kitten_path(@kitten)
    else
      flash[:alert] = "Error with kitten info!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)
    if @kitten.save
      redirect_to kitten_path(@kitten)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Kitten.destroy(params[:id])
    flash[:notice] = "Removed entry for this kitten"
    redirect_to root_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end


