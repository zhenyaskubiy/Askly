class AddTitleAndTagsToQuestions < ActiveRecord::Migration[8.1]
  def change
    add_column :questions, :title, :string
    add_column :questions, :tags, :string
  end
end
