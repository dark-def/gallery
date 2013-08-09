class SubscribeMailer < ActionMailer::Base
  default :from => 'pair.dro@gmail.com'

  def send_mail(image, category, users)
    @image = image
    @category = category
    mail(:to => users, subject: 'New image was added')
  end
end
