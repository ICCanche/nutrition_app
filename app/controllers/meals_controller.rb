class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.all
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    validate_diet_status
    newMeal = Meal.new
    @meal = NewMealViewObject.new(newMeal)
    @meal.set_diet(params[:diet_id])
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = Meal.new(meal_params)
    respond_to do |format|
      if @meal.save
        format.html { redirect_to new_meal_path(diet_id: @meal.diet_id, meal_type: meal_params[:meal_type]), :flash => { :success => "Se ha creado la comida correctamente. Puedes seguir agregando más alimentos." } }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to edit_diet_url(@meal.diet), :flash => { :success => "Se ha actualizado la comida correctamente" } }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to  edit_diet_url(@meal.diet), :flash => { :success => "Se ha eliminado la comida." } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_params
      params.require(:meal).permit(:name, :content, :diet_id, :meal_type)
    end

    def validate_diet_status
      if !params[:diet_id]
        redirect_to '/'
      end
      diet = Diet.find(params[:diet_id])
      if diet.paid? || diet.expired? 
        redirect_to '/'
      end

    end
end
