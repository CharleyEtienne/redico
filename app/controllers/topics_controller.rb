class TopicsController < ApplicationController
  protect_from_forgery

  # Only for members
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @salves = @topic.salves.order('created_at ASC')
    @message = Message.new
    @note = Note.new
    session[:return_to] ||= request.referer
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(title: topic_params[:title], user_id: current_user.id, finished: false, description: topic_params[:description])
    if @topic.save
      @salve = Salve.new(user_id: current_user.id, topic_id: @topic.id, finished: false)
      @participate = Participation.new(user_id: current_user.id, topic_id: @topic.id, status: true)
      if @salve.save && @participate.save
        redirect_to @topic, notice: 'Redico créé, bon débat !'
      end
    end

  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html {redirect_to @topic, notice: 'Topic was successfully updated.'}
        format.json {render :show, status: :ok, location: @topic}
      else
        format.html {render :edit}
        format.json {render json: @topic.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    redirect_to topics_url, notice: 'Topic was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
    @user = current_user.id
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, :flash => { :alert => "Record not found." }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
