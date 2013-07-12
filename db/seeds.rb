# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@basic_algebra = Quiz.new(:name => "Basic Algebra")

question_1 = @basic_algebra.questions.build(:content => "What is 1+1?")
question_2 = @basic_algebra.questions.build(:content => "What is 2*2?")
question_3 = @basic_algebra.questions.build(:content => "What is 4/2?")
question_4 = @basic_algebra.questions.build(:content => "What is 2**2?")

correct_answer_1 = question_1.choices.build(:content => "2")
question_1.choices.build(:content => "2+2")
question_1.choices.build(:content => "4")
question_1.choices.build(:content => "1")

question_2.choices.build(:content => "2")
correct_answer_2 = question_2.choices.build(:content => "4")
question_2.choices.build(:content => "6")
question_2.choices.build(:content => "1+1")

correct_answer_3 = question_3.choices.build(:content => "2")
question_3.choices.build(:content => "3")
question_3.choices.build(:content => "2.5")
question_3.choices.build(:content => "1")

question_4.choices.build(:content => "2")
question_4.choices.build(:content => "8")
question_4.choices.build(:content => "16")
correct_answer_4 = question_4.choices.build(:content => "4")


@basic_algebra.save

question_1.set_correct_choice!(0)
question_2.set_correct_choice!(1)
question_3.set_correct_choice!(0)
question_4.set_correct_choice!(3)

avi = User.create(:email => "avi@avi.com")

avi.create_answer(correct_answer_1)
avi.create_answer(correct_answer_2)
avi.create_answer(correct_answer_3)
avi.create_answer(correct_answer_4)

avi.score_for(@basic_algebra) #=> 100