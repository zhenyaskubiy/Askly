class Question < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 200 }
  validates :body, presence: true, length: { minimum: 10 }

  def tags_list
    return [] if tags.blank?
    tags.split(",").map(&:strip).reject(&:blank?)
  end
end