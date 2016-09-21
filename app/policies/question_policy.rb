class QuestionPolicy < ApplicationPolicy
  attr_reader :user, :question
  class Scope < Scope
    def resolve
      scope
    end
  end
  def initialize(user, question)
    @user = user
    @question = question
  end

  def new?
    create?
  end

  def create?
    user.admin?# or not question.published?
  end

  def update?
    user.admin?# or not question.published?
  end

  

   
end
