class MessagesController < ApplicationController

  # POST /messages
  # POST /messages.json
  def create
    if valid_salve(message_params[:topic_id], current_user.id, message_params[:salve_id])
      nb_messages = messages_in_topic(message_params[:topic_id], current_user)
      message_name = current_user.username[0] + nb_messages.to_s
      @message = Message.new(user_id: current_user.id,
                             salve_id: message_params[:salve_id],
                             content: message_params[:content],
                             url: message_params[:url],
                             name: message_name,
                             location: message_params[:location])
      if @message.save
        @note = Note.new(user_id: current_user.id,
                         message_id: @message.id,
                         value: message_params[:note_value].to_i)
        if @note.save
          redirect_to topic_path(message_params[:topic_id]), notice: 'Proposition envoyée.'
        else
          redirect_to topic_path(message_params[:topic_id]), alert: 'Note invalide.'
        end
      else
        redirect_to topic_path(message_params[:topic_id]), alert: 'Message invalide.'
      end
    else
      redirect_to root_path, alert: "Salve invalide"
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:user_id, :salve_id, :content, :name, :url, :location, :topic_id, :note_value)
  end

  # Get the total messages throught salves of a user in a topic
  def messages_in_topic (topic_id, user)
    @salvesuser = Salve.where(topic_id: topic_id, user_id: user.id)
    @nb_messages = 1
    @salvesuser.each do |salve|
      @nb_messages += salve.messages.count
    end
    return @nb_messages
  end

  def valid_salve(topic, user, salve)
    salve = Salve.where(id: salve, topic_id: topic, user_id: user, finished: true).first
    salve.blank?
  end
end
