class BGEvents# < ApplicationController
  @queue = :events_queue

  def self.perform(id, path)
    ActiveSupport::Notifications.instrument('click_links', :user_id => id, :url => path)
    p 'Event successfuly writed'
  end
end