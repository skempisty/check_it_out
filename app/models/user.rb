class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :followings
  has_many :followers, through: :followings

  has_attached_file :profile_pic,
  styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  } #,
  # :storage => :s3,
  # :s3_credentials => ".env",
  # :path => "/users/:style/:id/:filename"

  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/
end
