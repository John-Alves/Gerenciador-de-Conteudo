# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creating admin user
admin = User.new(
  name: 'Administrador',
  login: 'admin',
  password_digest: '$2a$10$1b/JEqHbuprOq6kXn.wJg.sEhyaiTNOb9QbYM1d7uuFik2Cs9I.qu'
)
admin.save

subjects = [
  { title: 'Introdução a Biologia' },
  { title: 'Química da Vida' },
  { title: 'Celula' },
  { title: 'Citoplasma' },
  { title: 'Reprodução Celular' }
]
subjects.each { |subject| Subject.new(subject).save }

# Creating question types
question_types = [
  { title: 'Multipla Escolha' },
  { title: 'Multipla Escolha c/ Imagens sendo alternativas' },
  { title: 'Verdadeiro ou Falso' }
]
question_types.each { |types| QuestionType.new(types).save }
