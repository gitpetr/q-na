class Answer < ActiveRecord::Base
  belongs_to :question
  validates :body, presence: true, length: { maximum: 1400 }
end
