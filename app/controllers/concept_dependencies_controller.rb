class ConceptDependenciesController < ApplicationController
  skip_authorization_check #todo: i have no idea how authorization works, we need to chat. -cf

  include GraphHelper

  def new
    current_uri = request.env['PATH_INFO']
    puts 'URI: ' + current_uri
  end

  def create
  end
end
