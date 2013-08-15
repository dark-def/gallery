class RegistrationsController < Devise::RegistrationsController

  def create

    if simple_captcha_valid?
      super
    else
      build_resource
      resource.errors.add(:base, "Please re-enter the captcha code") if resource.valid?
      render :new
    end
  end

end