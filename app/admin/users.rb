ActiveAdmin.register User do
  index do
    column :id
    column :name
    column :email
    column :uid
    column :provider
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :uid
      f.input :provider
    end
    f.actions
  end

  #controller do
  #
  #  #def edit
  #  #
  #  #
  #  #
  #  #end
  #
  #end

end
