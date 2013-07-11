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

question_1.choices.build(:content => "2")
question_1.choices.build(:content => "2+2")
question_1.choices.build(:content => "4")
question_1.choices.build(:content => "1")

question_2.choices.build(:content => "2")
question_2.choices.build(:content => "4")
question_2.choices.build(:content => "6")
question_2.choices.build(:content => "1+1")

question_3.choices.build(:content => "2")
question_3.choices.build(:content => "3")
question_3.choices.build(:content => "2.5")
question_3.choices.build(:content => "1")

question_4.choices.build(:content => "2")
question_4.choices.build(:content => "8")
question_4.choices.build(:content => "16")
question_4.choices.build(:content => "4")

@basic_algebra.save