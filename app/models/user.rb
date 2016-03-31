class User < ActiveRecord::Base
  has_many :links, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  before_create :generate_api_key

  has_secure_password

  scope :top_users, lambda {
    User.includes(:links).joins(:links).order("links.visit_count desc").limit(5)  }

    def generate_api_key
      self.api_key = SecureRandom.urlsafe_base64(48)
    end
end
