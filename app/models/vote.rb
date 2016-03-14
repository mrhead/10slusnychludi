class Vote < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :city, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX, allow_blank: true }

  scope :visible, -> { where(public: true) }
end
