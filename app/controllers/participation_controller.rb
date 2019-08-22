class ParticipationController < ApplicationController

  # POST /participate
  def participate
    @topic_id = params[:topic].to_i
    @user_id = params[:user].to_i
    @je_participe = Participation.where(topic_id: @topic_id, user_id: @user_id)
    @participants = Participation.where(topic_id: @topic_id)
    if @participants.count < 4
      @participation = Participation.new(topic_id: @topic_id, user_id: @user_id)
      if @participation.save
        redirect_to topic_path(@topic_id), notice: 'Prennez place au débat !'
      end
    elsif @je_participe
      redirect_to topic_path(@topic_id), notice: 'Vous participez déjà à ce débat !'
    else
      redirect_to topic_path(@topic_id), alert: 'Désolé, le débat est déjà complet...'
    end
  end

end
