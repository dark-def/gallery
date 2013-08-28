include ActionView::Helpers::TextHelper

ActiveSupport::Notifications.subscribe 'likes.create' do |name, start, finish, id, payload|
  Event.create(:url => payload[:url], :user_id => payload[:user_id], :event => name)
end

ActiveSupport::Notifications.subscribe 'likes.destroy' do |name, start, finish, id, payload|
  Event.create(:url => payload[:url], :user_id => payload[:user_id], :event => name)
end

ActiveSupport::Notifications.subscribe 'subscribe' do |name, start, finish, id, payload|
  Event.create(:url => payload[:category], :user_id => payload[:user_id], :event => name)
end

ActiveSupport::Notifications.subscribe 'unsubscribe' do |name, start, finish, id, payload|
  Event.create(:url => payload[:category], :user_id => payload[:user_id], :event => name)
end

ActiveSupport::Notifications.subscribe 'comment.create' do |name, start, finish, id, payload|
  Event.create(:url => payload[:url], :user_id => payload[:user_id], :event => name)
end

ActiveSupport::Notifications.subscribe 'sign_in' do |name, start, finish, id, payload|
  Event.create(:user_id => payload[:user].id, :event => name)
end

ActiveSupport::Notifications.subscribe 'sign_out' do |name, start, finish, id, payload|
  Event.create(:user_id => payload[:user].id, :event => name)
end

ActiveSupport::Notifications.subscribe 'click_links' do |name, start, finish, id, payload|
  Event.create(:url => payload[:url].truncate(50), :user_id => payload[:user_id], :event => 'Click on link' )
end

#Rails.logger.debug  "==================EARCH: #{payload[:url]} asd #{payload[:user_id]} asd #{name}"