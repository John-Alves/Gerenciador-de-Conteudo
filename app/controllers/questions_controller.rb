require 'json'

class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Questão criada com sucesso.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Questão deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    data = params[:question]

    if data[:alternative0].nil? # Verdadeiro ou Falso
      alternatives = [
        ['Verdadeiro',  !(data[:alternative0_is_answer].nil?)],
        ['Falso',       !(data[:alternative1_is_answer].nil?)]
      ]
    else # Multipla Escolha
      alternatives = [
        [data[:alternative0], !(data[:alternative0_is_answer].nil?)],
        [data[:alternative1], !(data[:alternative1_is_answer].nil?)],
        [data[:alternative2], !(data[:alternative2_is_answer].nil?)],
        [data[:alternative3], !(data[:alternative3_is_answer].nil?)],
      ]
    end
    data_json = { statement: data[:enunciado], alternatives: alternatives }

    return {
      subject_id: data[:subject_id],
      question_type_id: data[:question_type_id],
      data_json: data_json.to_json
    }
  end
end
