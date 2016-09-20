class Answer < ActiveRecord::Base
  belongs_to :question
  has_many  :comments, as: :commentable, dependent: :destroy
  validates :body, presence: true, length: { maximum: 1400 }
end
