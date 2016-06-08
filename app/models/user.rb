class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :followings
  has_many :followers, through: :followings

  has_attached_file(
    :profile_pic,
    styles: {
      thumb: '150x150>',
      square: '200x200#',
      medium: '300x300>'
    },
  )

  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/
end
