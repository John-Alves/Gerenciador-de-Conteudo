class Question < ApplicationRecord
  belongs_to :subject
  belongs_to :question_type
end
