class User < ActiveRecord::Base
  attr_accessible :email

  has_many :answers

  def create_answer(choice)
    choice.is_a?(Choice) ? 
      self.answers.create(:choice => choice) :
      self.answers.create(:choice_id => choice)
  end

  def take_quiz(choices_hash)
    choices_hash.each do |key, choice_id|
      self.create_answer([choice_id].flatten.first)
    end
  end
  
  def score_for(quiz)
    quiz_answers = self.answers.for_quiz(quiz)

    right_answers = []
    wrong_answers = []

    quiz_answers.each do |answer|
      question = answer.choice.question
      if question.correct_choice_id == answer.choice_id
        right_answers << answer
      else
        wrong_answers << answer
      end
    end

    score = (right_answers.size.to_f/quiz.questions.size.to_f)*100.00
  end
end
