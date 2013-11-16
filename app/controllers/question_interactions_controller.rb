class QuestionInteractionsController < ApplicationController
  before_action :set_question_interaction, only: [:show, :edit, :update, :destroy]

  # GET /question_interactions
  # GET /question_interactions.json
  def index
    @question_interactions = QuestionInteraction.all
  end

  # GET /question_interactions/1
  # GET /question_interactions/1.json
  def show
  end

  # GET /question_interactions/new
  def new
    @question_interaction = QuestionInteraction.new
  end

  # GET /question_interactions/1/edit
  def edit
  end

  # POST /question_interactions
  # POST /question_interactions.json
  def create
    @question_interaction = QuestionInteraction.new(question_interaction_params)

    respond_to do |format|
      if @question_interaction.save
        format.html { redirect_to @question_interaction, notice: 'Question interaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question_interaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @question_interaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_interactions/1
  # PATCH/PUT /question_interactions/1.json
  def update
    respond_to do |format|
      if @question_interaction.update(question_interaction_params)
        format.html { redirect_to @question_interaction, notice: 'Question interaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question_interaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_interactions/1
  # DELETE /question_interactions/1.json
  def destroy
    @question_interaction.destroy
    respond_to do |format|
      format.html { redirect_to question_interactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_interaction
      @question_interaction = QuestionInteraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_interaction_params
      params[:question_interaction]
    end
end
