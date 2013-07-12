class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :choices

  def add_choices(choices_content)
    choices_content.each_with_index do |choice_content, index|
      choice = self.choices.build(:content => choice_content)
    end
  end
  
  def set_correct_choice!(choice_index)
    binding.pry
    # get the choice via index
    self.correct_choice = self.choices[choice_index.to_i]
    self.save
  end

  def correct_choice?(choice)
    self.correct_choice_id == choice.id
  end

  def correct_choice
    @correct_choice ||= Choice.find(self.correct_choice_id)
  end

  def correct_choice=(choice)
    self.correct_choice_id = choice.id
  end

end
