class ConceptDependenciesController < ApplicationController
  skip_authorization_check #todo: i have no idea how authorization works, we need to chat. -cf

  include GraphHelper

  def new
    @jsonNodes = category_to_node(Category.first).to_json

    concept = Concept.find(params[:concept_id])

    current_uri = request.fullpath

    if (current_uri.index('prereq'))
      @dependency = concept.dependencies.build
    else
      @dependency = concept.post_dependencies.build
    end
  end

  def create
    concept = Concept.find(params[:concept_id])

    current_uri = request.fullpath
    if (current_uri.index('prereq'))
      prereq = Concept.find(params[:concept_dependency][:prereq])
      postreq = concept
    else
      prereq = concept
      postreq = Concept.find(params[:concept_dependency][:postreq])
    end

    @dependency = Dependecy.new(:prereq => prereq, :postreq => postreq)

    if (@dependency.save)
      flash[:success] = "Dependency created!"
      redirect_to concept
    else
      render 'new'
    end
  end
end
