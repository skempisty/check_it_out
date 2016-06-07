class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :followings
  has_many :followers, through: :followings

  has_attached_file(
    :profile_pic,
    styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    },
    # :path => "/users/:style/:id/:filename"
    # :path =>  "/:class/:attachment/:id_partition/:style/:filename"
  )

  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/
end
