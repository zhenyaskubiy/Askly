class QuestionsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  before_action :set_question, only: %i[show edit update destroy]
  before_action :require_owner, only: %i[edit update destroy]

  def index
    @questions = Question.all
    @question = Question.new
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      redirect_to question_path(@question), notice: "Question created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: "Question updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: "Question deleted!"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def require_owner
    redirect_to questions_path, alert: "Access denied" unless @question.user == current_user
  end
end