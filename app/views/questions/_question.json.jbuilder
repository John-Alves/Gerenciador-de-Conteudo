json.extract! question, :id, :subject_id, :question_type_id, :data_json, :created_at, :updated_at
json.url question_url(question, format: :json)
