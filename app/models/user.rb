class User < ActiveRecord::Base
  has_many :links, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  scope :top_users, lambda {
    User.includes(:links).joins(:links).order("links.visit_count desc").limit(5)  }
end
