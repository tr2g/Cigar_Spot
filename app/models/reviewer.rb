class Reviewer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviewer_comments, dependent: :destroy
  has_one_attached :profile_image

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |reviewer|
      reviewer.password = SecureRandom.urlsafe_base64
      reviewer.nickname = "guestreviewer"
      reviewer.birthday = Date.new(2000, 12, 1)
    end
  end

  def get_profile_image
    (profile_image.attached?) ? profile_image: 'no_image.jpg'
  end

end