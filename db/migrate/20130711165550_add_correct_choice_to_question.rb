class AddCorrectChoiceToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :correct_choice_id, :integer
  end
end
