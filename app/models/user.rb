class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pins
  has_many :comments

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  def username
    self.email.split(/@/).first
  end

  def to_param
    "#{id} #{username}".to_slug.normalize.to_s
  end

end