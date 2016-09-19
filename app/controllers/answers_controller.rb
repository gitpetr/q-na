class AnswersController < ApplicationController
  before_action :load_answer, only: [:edit, :update, :destroy, :make_best, :render_answer, :render_error, :show]
  before_action :load_question, only: [:create, :make_best, :update]

  def create
    @answer = @question.answers.create(answer_params)
    #redirect_to question_path(@answer.question)
  end

  private

  def load_question
    @question = if params.key?(:question_id)
                  Question.find(params[:question_id])
    else
      @answer.question
    end
  end

  def load_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    answer_params = params.require(:answer).permit(:body, :user_id, attachments_attributes: [:id, :file, :_destroy])
    #answer_params.merge(user_id: current_user.id)
  end

end
