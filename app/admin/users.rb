ActiveAdmin.register User do
  index do
    column :id
    column :name
    column :email
    column :uid
    column :provider
    default_actions
  end
end
