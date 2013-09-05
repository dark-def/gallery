# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  uid                    :string(255)
#  email                  :string(255)
#  provider               :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :uid, :provider, :encrypted_password,
                  :reset_password_token, :reset_password_sent_at, :remember_created_at, :current_sign_in_at, :last_sign_in_at,
                  :current_sign_in_ip, :last_sign_in_ip

  has_many :subscribes
  has_many :categories, :through => :subscribes
  has_many :comments
  has_many :likes
  has_many :events
  has_many :ratings

  validates :name,
            :presence => true,
            :length => {:minimum => 2, :maximum => 30}

  validates :email,
            :presence => true,
            :format => {:with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/}

  validates_uniqueness_of :email

end
