class DosesController < ApplicationController
before_action :set_dose, only: [:destroy]

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @ingredients = Ingredient.all
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path
  end

private

  def dose_params
    params.require(:dose).permit(:name, :description, :cocktail_id, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
