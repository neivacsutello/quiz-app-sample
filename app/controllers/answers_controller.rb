class AnswersController < ApplicationController

  def new
    @quiz = Quiz.find(params[:quiz_id])  
  end

  def create
    avi = User.first
    avi.take_quiz(params[:choices])
  end
end
