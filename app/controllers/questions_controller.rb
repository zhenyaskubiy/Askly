class QuestionsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  before_action :set_question, only: %i[show edit update destroy]
  before_action :require_owner, only: %i[edit update destroy]

  def index
    @questions = Question.all.order(created_at: :desc).includes(:user)
    @question = Question.new
    @trending_questions = @questions.first(3)
    @top_contributors = User.joins(:questions)
                            .group("users.id")
                            .order("COUNT(questions.id) DESC")
                            .limit(3)
                            .select("users.*, COUNT(questions.id) as questions_count")
    all_tags = @questions.flat_map(&:tags_list)
    @popular_tags = all_tags.tally.sort_by { |_, v| -v }.first(6).map(&:first)
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
    params.require(:question).permit(:title, :body, :tags)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def require_owner
    redirect_to questions_path, alert: "Access denied" unless @question.user == current_user
  end
end