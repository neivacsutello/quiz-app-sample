json.array!(@quizzes) do |quiz|
  json.extract! quiz, :name
  json.url quiz_url(quiz, format: :json)
end
