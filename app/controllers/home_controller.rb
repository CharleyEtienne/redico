class HomeController < ApplicationController
  def index
    @topics = Topic.order('created_at ASC')
    # @finishedTopics = Topic.where(finished: true).order('created_at ASC')
    # @currentTopics = Topic.where(finished: 0).order('created_at ASC')
  end

  def private
  end
end
