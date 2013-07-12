class Quizzes::QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    render 'questions/show'
  end

  def new
    # In the controller, I'll load the quiz and then instantiate a question for that quiz.
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build
    render 'questions/new'
  end

  def create
    @question = Question.new(params[:question])
    @question.add_choices(params[:choices])

    if @question.save
      @question.set_correct_choice!(params[:correct_choice])

      redirect_to @question.quiz
    else
      render :new
    end
  end
end
