class Every2min# < ApplicationController
  @queue = :events_queue

  def self.perform()
    p 'Here just started test event 2 minutes'
    p 'successfuly writed'
    raise ActionController::RoutingError.new('Not Found')
  end

end