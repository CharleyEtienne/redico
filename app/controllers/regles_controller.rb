class ReglesController < ApplicationController
  before_action :set_regle, only: [:show, :edit, :update, :destroy]

  # GET /regles
  # GET /regles.json
  def index
    @regles = Regle.all
  end

  # GET /regles/1
  # GET /regles/1.json
  def show
  end

  # GET /regles/new
  def new
    @regle = Regle.new
  end

  # GET /regles/1/edit
  def edit
  end

  # POST /regles
  # POST /regles.json
  def create
    @regle = Regle.new(regle_params)

    respond_to do |format|
      if @regle.save
        format.html { redirect_to @regle, notice: 'Regle was successfully created.' }
        format.json { render :show, status: :created, location: @regle }
      else
        format.html { render :new }
        format.json { render json: @regle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regles/1
  # PATCH/PUT /regles/1.json
  def update
    respond_to do |format|
      if @regle.update(regle_params)
        format.html { redirect_to @regle, notice: 'Regle was successfully updated.' }
        format.json { render :show, status: :ok, location: @regle }
      else
        format.html { render :edit }
        format.json { render json: @regle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regles/1
  # DELETE /regles/1.json
  def destroy
    @regle.destroy
    respond_to do |format|
      format.html { redirect_to regles_url, notice: 'Regle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regle
      @regle = Regle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regle_params
      params.require(:regle).permit(:num, :content)
    end
end
