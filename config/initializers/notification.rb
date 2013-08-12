#ActiveSupport::Notifications.subscribe "process_action.action_controller" do |name, start, finish, id, payload|
#
#    #if current_user
#    #  @event = Event.new
#    #  @event.user_id = current_user.id
#    #  #@event.event = params[]
#    #  @event.url = request.fullpath
#    #  if @event.save
#    #    render :json => {:action => @event}
#    #  end
#    #end
#
#    #  user_id    :integer
#    #  event      :string(255)
#    #  url        :string(255)
#
#
#    #Event.create! do |event|
#    #  event.url = payload[:path]
#    #  event.user_id = current_user.id
#    #  event.view_duration = payload[:view_runtime]
#    #  event.db_duration = payload[:db_runtime]
#    #end
#
#
#end

#Rails.logger.debug  "==================EARCH: #{payload[:url]} asd #{payload[:user_id]} asd #{name}"

ActiveSupport::Notifications.subscribe 'likes.create' do |name, start, finish, id, payload|
  Event.create(:url => payload[:url], :user_id => payload[:user_id], :event => name)
end

ActiveSupport::Notifications.subscribe 'likes.destroy' do |name, start, finish, id, payload|
  Event.create(:url => payload[:url], :user_id => payload[:user_id], :event => name)
end

#ActiveSupport::Notifications.subscribe 'click_links' do |name, start, finish, id, payload|
#  Event.create(:url => payload[:url], :user_id => payload[:user_id], :event => 'Click on link' )
#end

ActiveSupport::Notifications.subscribe 'process_action.action_controller' do |name, start, finish, id, payload|
  Event.create(:url => payload[:path], :event => 'Click on link', :user_id => payload[:user_id])
end