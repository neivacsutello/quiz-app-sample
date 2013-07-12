class Answer < ActiveRecord::Base
  attr_accessible :choice_id, :user_id, :choice

  belongs_to :user
  belongs_to :choice

  def self.for_quiz(quiz)
    joins(:choice => {:question => :quiz}).where("quizzes.id = ?", quiz.id)
  end

end
