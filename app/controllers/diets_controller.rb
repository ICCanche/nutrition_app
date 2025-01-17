class DietsController < ApplicationController
  helper TimeZoneConverter
  before_action :set_diet, only: [:show, :edit, :update, :destroy]

  # GET /diets
  # GET /diets.json
  def index
    @diets = Diet.order('updated_at')
  end

  # GET /diets/1
  # GET /diets/1.json
  def show
    @diet = DietViewObject.new(@diet)
  end

  # GET /diets/new
  def new
    @diet = Diet.new
  end

  # GET /diets/1/edit
  def edit
    validate_diet_edition
    @diet = DietViewObject.new(@diet)
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet = Diet.new(diet_params)

    respond_to do |format|
      if @diet.save
        format.html { redirect_to @diet, notice: 'Diet was successfully created.' }
        format.json { render :show, status: :created, location: @diet }
      else
        format.html { render :new }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diets/1
  # PATCH/PUT /diets/1.json
  def update
    set_diet_status
    respond_to do |format|
      if @diet.update(diet_params)
        format.html { redirect_to @diet, :flash => { :success => "Se ha actualizado la dieta correctamente" } }
        format.json { render :show, status: :ok, location: @diet }
      else
        format.html { render :edit }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diets/1
  # DELETE /diets/1.json
  def destroy
    @diet.destroy
    respond_to do |format|
      format.html { redirect_to diets_url, notice: 'Diet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet
      @diet = Diet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diet_params
      params.require(:diet).permit(:recommendations)
    end

    def set_diet_status
      if @diet.requested?
        @diet.status = :approved
      end
    end

    def validate_diet_edition
      if @diet.expired?
        redirect_to "/"
      end
    end

end
