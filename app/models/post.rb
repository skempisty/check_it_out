class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :words, length: { maximum: 5000 }
end
