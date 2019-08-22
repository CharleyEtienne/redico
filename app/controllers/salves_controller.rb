class SalvesController < ApplicationController
  before_action :set_salf, only: [:show, :edit, :update, :destroy]

  # GET /salves
  # GET /salves.json
  def index
    @salves = Salve.all
  end

  # GET /salves/1
  # GET /salves/1.json
  def show
  end

  # GET /salves/new
  def new
    @salf = Salve.new
  end

  # GET /salves/1/edit
  def edit
  end

  # POST /salves
  # POST /salves.json
  def create
    @salf = Salve.new(salf_params)

    respond_to do |format|
      if @salf.save
        format.html { redirect_to @salf, notice: 'Salve was successfully created.' }
        format.json { render :show, status: :created, location: @salf }
      else
        format.html { render :new }
        format.json { render json: @salf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salves/1
  # PATCH/PUT /salves/1.json
  def update
    respond_to do |format|
      if @salf.update(salf_params)
        format.html { redirect_to @salf, notice: 'Salve was successfully updated.' }
        format.json { render :show, status: :ok, location: @salf }
      else
        format.html { render :edit }
        format.json { render json: @salf.errors, status: :unprocessable_entity }
      end
    end
  end

  # Set the salve to finished
  def finish
    salve = Salve.where(id: params[:salve], user_id: params[:user], topic_id: params[:topic], finished: false).first
    if !salve.blank?
      salve.finished = true
      if salve.save
        redirect_to topic_path(params[:topic])
      else
        redirect_to topic_path(params[:topic]), alert: "Problème lors de l'enregistrement"
      end
    else
      redirect_to root_path, alert: "Salve invalide"
    end
  end

  # Prend le tour de salve
  def take_salve
    salve = Salve.new(topic_id: params[:topic], user_id: params[:user], finished: false)
    if salve.save
      redirect_to topic_path(params[:topic]), notice: "c'est à votre tour de salver !"
    else
      redirect_to topic_path(params[:topic]), alert: "Problème lors de l'enregistrement"
    end
  end

  # DELETE /salves/1
  # DELETE /salves/1.json
  def destroy
    @salf.destroy
    respond_to do |format|
      format.html { redirect_to salves_url, notice: 'Salve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salf
      @salf = Salve.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salf_params
      params.require(:salf).permit(:topic_id, :user_id, :finished)
    end
end
