class User < ActiveRecord::Base
  has_many :links, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

#   validates :name, length: {
#   minimum: 2,
#   message: "too short. Minimum length is two characters"
# }
#
# validates :password, length: {
#   minimum: 5,
#   message: "too short. Minimum length is five characters"
# }, if: :new_record?
#
# # validates :email, uniqueness: true, email_format: {
# #   message: "invalid. Please use a different one"
# # }

  has_secure_password

  scope :top_users, lambda {
    User.includes(:links).joins(:links).order("links.visit_count desc").limit(5)  }
end
