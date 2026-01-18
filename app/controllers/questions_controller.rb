class QuestionsController < ApplicationController
  before_action :set_action, only: %i[show edit update destroy]
  def create
    question = Question.create(question_params)

    flash[:notice] = "Question created successfully!"

    redirect_to question_path(question)
  end

  def update
    @question.update(question_params)

    flash[:notice] = "Question updated!"

    redirect_to question_path(@question)
  end

  def destroy
    @question.destroy

    flash[:notice] = "Question deleted!"

    redirect_to questions_path
  end

  def show
  end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new
  end

  def edit
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_action
    @question = Question.find(params[:id])
  end
end
