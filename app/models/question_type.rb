class QuestionType < ApplicationRecord
  has_many :questions, dependent: :destroy
end
