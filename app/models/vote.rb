class Vote < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :city, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX, allow_blank: true }

  scope :visible, -> { where(public: true) }
  scope :correct, -> { where(correct: true) }

  before_save :check_bot

  def check_bot
    bad_ips = [
        '109.230.14.211',
        "91.233.248.21",
    ]

    filter = [
        /kurva/i,
        /kokot/i,
        /fico/i,
        /matovic/i,
        /beblavy/i,
        /\bpice/i,
    ]

    if filter.any? { |f| name =~ f } || bad_ips.include?(ip)
      self.correct = false
    end

    true
  end
end
