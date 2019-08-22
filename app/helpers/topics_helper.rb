module TopicsHelper
  # Helpers pour la page topics/show.html.erb

  # Si l'utilisateur courant est en train de salver
  def je_salve
    salves = @topic.salves.order('created_at ASC')
    @topic.ma_salve(current_user, salves.last)
  end

  # Si l'utilisateur courant est un participant de la salve visitée actuellement
  def je_participe
    @topic.je_participe(current_user, @topic)
  end

  # Si personne ne salve dans le redico visité actuellement
  def personne_ne_salve
    Salve.where(topic_id: @topic, finished: false).first.blank?
  end

  # Renvoie les participants du redico visité actuellement
  def participants
    Participation.where(topic_id: @topic.id)
  end

  # Verifie si c'est l'utilisateur courrant qui a salvé en dernier
  def jai_salve_en_dernier
    salves = @topic.salves.order('created_at ASC')
    if @topic.salves.count > 1
      @topic.last_salve(current_user, salves.offset(1).last)
    else
      @topic.last_salve(current_user, salves.last)
    end
  end

  # Si j'ai pas note, ajoute un formulaire pour le faire
  def ma_note message
    @note = Note.where(message_id: message.id, user_id: current_user.id).first
    if !@note.blank?
      render 'notes/form', note: @note
    else
      render 'notes/form', note: Note.new
    end
  end

  # Récupère toutes les autres notes d'un message
  def autre_notes message
    Note.where(message_id: message.id).where.not(user_id: current_user.id)
  end
end
