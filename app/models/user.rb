class User < ActiveRecord::Base
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :followers, through: :followings

  has_attached_file(
    :profile_pic,
    styles: {
      mini: '40x40>',
      thumb: '150x150>',
      square: '200x200#'
    },
  )

  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/

  validates :profile_pic, presence: true
  validates :handle, length: { maximum: 18 }

end
